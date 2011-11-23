//
//  ImageController.h
//  jmDiap
//
//  Created by Julien MEYER on 10/07/10.
//  Copyright 2010 jmApp.com All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jmImage.h"


@interface ImageController : UIViewController <UIScrollViewDelegate>
{
	CGRect _frame;
	int pageIndex;
	Boolean				zoomMode;
	Boolean				maximized;
	jmImage             *thumb;
	
	CGPoint				startPoint;
	CGPoint				lastPoint;
	Boolean				touched;
	
	CGFloat				initialDistance;
	CGFloat				currentDistance;
	CGAffineTransform	scaleTransform;
	CGAffineTransform	rotateTransform;	
}

- (id) initWithThumb:(jmImage*)t:(CGRect)frame;
- (void)setPageIndex:(int)value;
- (void) clearTouches;
- (void)			resetThumb;
- (Boolean)			getZoomMode;
- (void)			handleSingleTap:(NSDictionary *)touches;
- (void)			handleDoubleTap:(NSDictionary *)touches;

- (CGFloat)			distanceBetweenTwoPoints:(CGPoint)fromPoint toPoint:(CGPoint)toPoint;
CGFloat				distanceBetweenPoints(CGPoint firstPoint, CGPoint secondPoint);
CGPoint				vectorBetweenPoints(CGPoint firstPoint, CGPoint secondPoint);
CGAffineTransform	CGAffineScaleTransformWithTouches(CGAffineTransform _scaleTransform, UITouch *firstTouch, UITouch *secondTouch);
CGAffineTransform	CGAffineRotateTransformWithTouches(CGAffineTransform _rotateTransform, UITouch *firstTouch, UITouch *secondTouch);

@end
