//
//  ImageController.m
//  jmDiap
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKImageController.h"


@implementation RDKImageController


-(id)initWithThumb:(RDKCustomImage *)t:(CGRect)frame
{
	if(self = [super init]) 
	{
		_frame = frame;
		thumb = t;
		
		maximized = NO;
		zoomMode = NO;
		touched = NO;
		scaleTransform = CGAffineTransformIdentity;
		rotateTransform = CGAffineTransformIdentity;
		
		/** create view container */
		self.view = [[UIView alloc] initWithFrame:_frame];
		self.view.backgroundColor = [UIColor clearColor];
		self.view.multipleTouchEnabled = YES;
		self.view.exclusiveTouch = YES;
				
		/** add one thumb into view container */
//		[thumb scaleToOriginalRect];
//		[thumb scaleToFitRect:CGRectMake(0, 0, 160, 240)];	
		[thumb scaleToFitRect:_frame];	
		[self.view addSubview:thumb];
//		zoomMode = YES;		
    }
    return self;
}

-(void)setPageIndex:(int)value 
{
	pageIndex = value;
}

-(void)resetThumb
{
	scaleTransform = CGAffineTransformIdentity;
	rotateTransform = CGAffineTransformIdentity;
//	thumb.transform = CGAffineTransformConcat(scaleTransform, rotateTransform);
	thumb.transform = scaleTransform;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
//	UITouch *aTouch = [touches anyObject];
//    
//    if (aTouch.tapCount == 2) {
//		[NSObject cancelPreviousPerformRequestsWithTarget:self];
//	}
		
	NSSet *allTouches = [event allTouches];
	NSArray *t = [allTouches allObjects];
	NSInteger numberOfTouches = [t count];
    
	switch(numberOfTouches)
	{
		case 1:
		{
			UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
			switch ([touch tapCount])
			{
				case 1: /** Single tap */
				break;
					
				case 2: /** Double tap */
				break;
			}
            
			CGPoint currentTouchPosition = [touch locationInView:self.view];
            
			if(zoomMode == YES && touched == NO) 
            {
				startPoint = currentTouchPosition;
				lastPoint = startPoint;
				touched = YES;
			}
		}	
		break;
	}
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
	NSSet *allTouches = [event allTouches];
	NSArray *t = [allTouches allObjects];
	NSInteger numberOfTouches = [t count];
    
	switch(numberOfTouches)
	{			
		case 1:
		{
			UITouch *touch = [[event allTouches] anyObject];
//			CGPoint location2 = [touch locationInView:touch.view];
			CGPoint location = [touch locationInView:self.view];
			
			if(zoomMode == YES && touched == YES) {
				CGPoint p = CGPointMake(location.x - lastPoint.x, location.y - lastPoint.y);
				lastPoint = location;
				
				[thumb addOffset:p.x:p.y];
			}
		}
		break;
			
		case 2:
		{
			UITouch *touch1 = [[allTouches allObjects] objectAtIndex:0];
			UITouch *touch2 = [[allTouches allObjects] objectAtIndex:1];
			scaleTransform = CGAffineScaleTransformWithTouches(scaleTransform, touch1, touch2);
			rotateTransform = CGAffineRotateTransformWithTouches(rotateTransform, touch1, touch2);
			
//			thumb.transform = CGAffineTransformConcat(scaleTransform, rotateTransform);
			thumb.transform = scaleTransform;
			
			[UIView commitAnimations];

			zoomMode = YES;
			touched = YES;
		}
		break;
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
	[self clearTouches];
	
//	UITouch *theTouch = [touches anyObject];
//	CGPoint currentTouchPosition = [theTouch locationInView:self.view];
//
//	NSDictionary *touchLoc = [NSDictionary dictionaryWithObject:
//							  [NSValue valueWithCGPoint:[theTouch locationInView:self.view]] forKey:@"location"];
//	
//    if (theTouch.tapCount == 1) {
//		[self performSelector:@selector(handleSingleTap:) withObject:touchLoc afterDelay:0.3];
//	} 
//	else if (theTouch.tapCount == 2) {
//		[self performSelector:@selector(handleDoubleTap:) withObject:touchLoc afterDelay:0.01];
//	}	
}

-(Boolean)getZoomMode
{
	return zoomMode;
}

-(void)handleSingleTap:(NSDictionary *)touches 
{
}

-(void)handleDoubleTap:(NSDictionary *)touches 
{
	CGRect fullScreenRect = [[UIScreen mainScreen] applicationFrame];
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.3f];	

	Boolean isIdentity = CGAffineTransformIsIdentity(scaleTransform);
	isIdentity |= CGAffineTransformIsIdentity(rotateTransform);
	
	/** reset matrix transform scales */
	[self resetThumb];
	
	if(isIdentity == NO) 
    {
		if(maximized == YES) 
        {
			[thumb scaleToFitRect:fullScreenRect];
		}
		[thumb centerImage];
//		[thumb setOffset:0:0];
		maximized = NO;
		zoomMode = NO;
	}
	else {
		if(maximized == NO) {
			[thumb scaleToOriginalRect];
			maximized = YES;
			zoomMode = YES;
		}
		else {		
			[thumb scaleToFitRect:fullScreenRect];
			maximized = NO;
			zoomMode = NO;
		}
	}
	
	[UIView commitAnimations];
	touched = NO;
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event 
{
	[self clearTouches];	
}

-(void)clearTouches 
{	
	touched = NO;
	initialDistance = -1;
	currentDistance = -1;
}

-(CGFloat)distanceBetweenTwoPoints:(CGPoint)fromPoint toPoint:(CGPoint)toPoint
{
	float x = toPoint.x - fromPoint.x;
	float y = toPoint.y - fromPoint.y;	
	return sqrt(x * x + y * y);
}

CGFloat distanceBetweenPoints(CGPoint firstPoint, CGPoint secondPoint) 
{
	CGFloat distance;
	
	/** Square difference in x */
	CGFloat xDifferenceSquared = pow(firstPoint.x - secondPoint.x, 2);
	
	/** Square difference in y */
	CGFloat yDifferenceSquared = pow(firstPoint.y - secondPoint.y, 2);
	
	/** Add and take Square root */
	distance = sqrt(xDifferenceSquared + yDifferenceSquared);

	return distance;
	
}

CGPoint vectorBetweenPoints(CGPoint firstPoint, CGPoint secondPoint) 
{
	CGFloat xDifference = firstPoint.x - secondPoint.x;
	CGFloat yDifference = firstPoint.y - secondPoint.y;	
	CGPoint result = CGPointMake(xDifference, yDifference);
	
	return result;
}

CGAffineTransform CGAffineScaleTransformWithTouches(CGAffineTransform _scaleTransform, UITouch *firstTouch, UITouch *secondTouch)
{	
	CGPoint firstTouchLocation = [firstTouch locationInView:nil];
	CGPoint firstTouchPreviousLocaion = [firstTouch previousLocationInView:nil];
	CGPoint secondTouchLocation = [secondTouch locationInView:nil];
	CGPoint secondTouchPreviousLocaion = [secondTouch previousLocationInView:nil];
	
	/** Get distance between points */
	CGFloat currentDistance = distanceBetweenPoints(firstTouchLocation, secondTouchLocation);
	CGFloat previousDistance = distanceBetweenPoints(firstTouchPreviousLocaion, secondTouchPreviousLocaion);
	
	/** Figure new scale */
	if((NSInteger)currentDistance == 0) 
    {
		return _scaleTransform;
	}	
    
	if((NSInteger)previousDistance == 0) 
    {
		return _scaleTransform;
	}
	
	CGFloat distanceRatio = currentDistance / previousDistance;	
	CGAffineTransform newTransform = CGAffineTransformScale(_scaleTransform, distanceRatio, distanceRatio);	
	CGFloat minValue = 0.20;
    
	if((newTransform.a > 0 && newTransform.a < minValue) || (newTransform.d > 0 && newTransform.d < minValue)) 
    {
		newTransform = _scaleTransform;
	}
    
	if((newTransform.a < 0 && newTransform.a > -minValue) || (newTransform.d < 0 && newTransform.d > -minValue)) 
    {
		newTransform = _scaleTransform;
	}
	
	CGFloat maxValue = 1.50;
    
	if((newTransform.a > 0 && newTransform.a > maxValue) || (newTransform.d > 0 && newTransform.d > maxValue))
    {
		newTransform = _scaleTransform;
	}
    
	if((newTransform.a < 0 && newTransform.a < -maxValue) || (newTransform.d < 0 && newTransform.d < -maxValue))
    {
		newTransform = _scaleTransform;
	}
	
	_scaleTransform = newTransform;
	return _scaleTransform;
}

CGAffineTransform CGAffineRotateTransformWithTouches(CGAffineTransform _rotateTransform, UITouch *firstTouch, UITouch *secondTouch)
{	
	CGPoint firstTouchLocation = [firstTouch locationInView:nil];
	CGPoint firstTouchPreviousLocaion = [firstTouch previousLocationInView:nil];
	CGPoint secondTouchLocation = [secondTouch locationInView:nil];
	CGPoint secondTouchPreviousLocaion = [secondTouch previousLocationInView:nil];
	
	/** Get distance between points */
	CGFloat currentDistance = distanceBetweenPoints(firstTouchLocation, secondTouchLocation);
	CGFloat previousDistance = distanceBetweenPoints(firstTouchPreviousLocaion, secondTouchPreviousLocaion);
	
	/** Now figure new rotation */
	/** Get previous angle */
	CGPoint previousDifference = vectorBetweenPoints(firstTouchPreviousLocaion, secondTouchPreviousLocaion);
	CGFloat xDifferencePrevious = previousDifference.x;
	
	/** Use acos to get angle to avoid issue with the denominator being 0 */
	CGFloat previousRotation = acos(xDifferencePrevious / previousDistance); 
    
    /** adjacent over hypotenuse */
	if (previousDifference.y < 0) {
		/** account for acos of angles in quadrants III and IV */
		previousRotation *= -1;
	}
	
	/** Get current angle */
	CGPoint currentDifference = vectorBetweenPoints(firstTouchLocation, secondTouchLocation);
	CGFloat xDifferenceCurrent = currentDifference.x;
	
	/** Use acos to get angle to avoid issue with the denominator being 0 */
	CGFloat currentRotation = acos(xDifferenceCurrent / currentDistance); 
    
    /** adjacent over hypotenuse */
	if (currentDifference.y < 0) {
		/** account for acos of angles in quadrants III and IV */
		currentRotation *= -1;
	}
	
	CGFloat newAngle = currentRotation - previousRotation;
	
	/** Combine with current transform */
	_rotateTransform = CGAffineTransformRotate(_rotateTransform, newAngle);
	
	/** Return result */
	return _rotateTransform;
}

- (void)dealloc 
{
    [super dealloc];
}

@end
