//
//  CoolButton.m
//  CoolButton
//
//  Created by Trung Dang on 11/15/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "CoolButton.h"

#import "Common.h"

@implementation CoolButton
@synthesize hue = _hue;
@synthesize saturation = _saturation;
@synthesize brightness = _brightness;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        _hue = 1.0;
        _saturation = 1.0;
        _brightness = 1.0;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGColorRef color = [UIColor colorWithHue:_hue saturation:_saturation 
//                                  brightness:_brightness alpha:1.0].CGColor;
//    
//    CGContextSetFillColorWithColor(context, color);
//    CGContextFillRect(context, self.bounds);
    
    //////
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //color section
    CGColorRef blackColor = [UIColor colorWithRed:0.0 green:0.0 
                                             blue:0.0 alpha:1.0].CGColor;
    CGColorRef highlightStart = [UIColor colorWithRed:1.0 green:1.0 
                                                 blue:1.0 alpha:0.4].CGColor;
    CGColorRef highlightStop = [UIColor colorWithRed:1.0 green:1.0 
                                                blue:1.0 alpha:0.1].CGColor;
    CGColorRef shadowColor = [UIColor colorWithRed:0.2 green:0.2 
                                              blue:0.2 alpha:0.5].CGColor;
    
    CGColorRef outerTop = [UIColor colorWithHue:_hue saturation:_saturation 
                                     brightness:1.0*_brightness alpha:1.0].CGColor;
    CGColorRef outerBottom = [UIColor colorWithHue:_hue saturation:_saturation 
                                        brightness:0.80*_brightness alpha:1.0].CGColor;
    CGColorRef innerStroke = [UIColor colorWithHue:_hue saturation:_saturation 
                                        brightness:0.80*_brightness alpha:1.0].CGColor;
    CGColorRef innerTop = [UIColor colorWithHue:_hue saturation:_saturation 
                                     brightness:0.90*_brightness alpha:1.0].CGColor;
    CGColorRef innerBottom = [UIColor colorWithHue:_hue saturation:_saturation 
                                        brightness:0.70*_brightness alpha:1.0].CGColor;
    
//    CGColorRef outerTop = [UIColor colorWithHue:_hue saturation:_saturation 
//                                     brightness:_brightness alpha:1.0].CGColor;
//    CGColorRef shadowColor = [UIColor colorWithRed:0.2 green:0.2 
//                                              blue:0.2 alpha:0.5].CGColor;
    
    CGFloat outerMargin = 5.0f;
    CGRect outerRect = CGRectInset(self.bounds, outerMargin, outerMargin);
    CGMutablePathRef outerPath = createRoundedRectForRect(outerRect, 6.0);
    
    CGFloat innerMargin = 3.0f;
    CGRect innerRect = CGRectInset(outerRect, innerMargin, innerMargin);
    CGMutablePathRef innerPath = createRoundedRectForRect(innerRect, 6.0);
    
    CGFloat highlightMargin = 2.0f;
    CGRect highlightRect = CGRectInset(outerRect, highlightMargin, highlightMargin);
    CGMutablePathRef highlightPath = createRoundedRectForRect(highlightRect, 6.0);
    
    
//    if (self.state != UIControlStateHighlighted) {
//        CGContextSaveGState(context);
//        CGContextSetFillColorWithColor(context, outerTop);
//        CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor);
//        CGContextAddPath(context, outerPath);
//        CGContextFillPath(context);
//        CGContextRestoreGState(context);
//    }
    
    CGContextSaveGState(context);
    CGContextAddPath(context, outerPath);
    CGContextClip(context);
    drawGlossAndGradient(context, outerRect, outerTop, outerBottom);
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextAddPath(context, innerPath);
    CGContextClip(context);
    drawGlossAndGradient(context, innerRect, innerTop, innerBottom);
    CGContextRestoreGState(context);
    
    if (self.state != UIControlStateHighlighted) {
        CGContextSaveGState(context);
        CGContextSetLineWidth(context, 4.0);
        CGContextAddPath(context, outerPath);
        CGContextAddPath(context, highlightPath);
        CGContextEOClip(context);
        drawLinearGradient(context, outerRect, highlightStart, highlightStop);
        CGContextRestoreGState(context);
    }
    
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, blackColor);
    CGContextAddPath(context, outerPath);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, innerStroke);
    CGContextAddPath(context, innerPath);
    CGContextClip(context);
    CGContextAddPath(context, innerPath);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);    
    
    CFRelease(outerPath);
    CFRelease(innerPath);
    CFRelease(highlightPath);
}

- (void)hesitateUpdate
{
    [self setNeedsDisplay];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [self setNeedsDisplay];
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    [self setNeedsDisplay];
    [self performSelector:@selector(hesitateUpdate) withObject:nil afterDelay:0.1];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self setNeedsDisplay];
    [self performSelector:@selector(hesitateUpdate) withObject:nil afterDelay:0.1];
}

- (void)setHue:(CGFloat)hue {
    _hue = hue;
    [self setNeedsDisplay];
}

- (void)setSaturation:(CGFloat)saturation {
    _saturation = saturation;
    [self setNeedsDisplay];
}

- (void)setBrightness:(CGFloat)brightness {
    _brightness = brightness;
    [self setNeedsDisplay];
}

@end
