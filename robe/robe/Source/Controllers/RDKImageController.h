//
//  ImageController.h
//  jmDiap
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDKCustomImage.h"

/** image view controller */
@interface RDKImageController : UIViewController <UIScrollViewDelegate>
{
	int pageIndex;
    
	Boolean zoomMode;
	Boolean maximized;
    Boolean touched;

	RDKCustomImage *thumb;
	
    CGRect _frame;
	CGPoint startPoint;
	CGPoint lastPoint;
	
	CGFloat initialDistance;
	CGFloat currentDistance;
	CGAffineTransform scaleTransform;
	CGAffineTransform rotateTransform;	
}

-(void)resetThumb;
-(void)clearTouches;
-(Boolean)getZoomMode;
-(void)setPageIndex:(int)value;
-(void)handleSingleTap:(NSDictionary *)touches;
-(void)handleDoubleTap:(NSDictionary *)touches;
-(id)initWithThumb:(RDKCustomImage *)t:(CGRect)frame;
-(CGFloat)distanceBetweenTwoPoints:(CGPoint)fromPoint toPoint:(CGPoint)toPoint;

CGFloat distanceBetweenPoints(CGPoint firstPoint, CGPoint secondPoint);
CGPoint vectorBetweenPoints(CGPoint firstPoint, CGPoint secondPoint);
CGAffineTransform CGAffineScaleTransformWithTouches(CGAffineTransform _scaleTransform, UITouch *firstTouch, UITouch *secondTouch);
CGAffineTransform CGAffineRotateTransformWithTouches(CGAffineTransform _rotateTransform, UITouch *firstTouch, UITouch *secondTouch);

@end
