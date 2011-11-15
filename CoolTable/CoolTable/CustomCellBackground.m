//
//  CustomCellBackground.m
//  CoolTable
//
//  Created by Trung Dang on 11/15/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "CustomCellBackground.h"

#import "Common.h"

@implementation CustomCellBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
//    CGColorRef redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0].CGColor;
//    
//    CGContextSetFillColorWithColor(context, redColor);
//    CGContextFillRect(context, self.bounds);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1.0].CGColor;
//    CGColorRef redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0].CGColor;
    CGColorRef whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor; 
    CGColorRef lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0].CGColor;
    
    CGRect paperRect = self.bounds;        
    drawLinearGradient(context, paperRect, whiteColor, lightGrayColor);
    
//    CGRect strokeRect = CGRectInset(paperRect, 5.0, 5.0);
//    CGRect strokeRect = rectFor1PxStroke(CGRectInset(paperRect, 5.0, 5.0));
    
    CGRect strokeRect = paperRect;
    strokeRect.size.height -= 1;
    strokeRect = rectFor1PxStroke(strokeRect);
    
    CGContextSetStrokeColorWithColor(context, whiteColor);
    
//    CGContextSetStrokeColorWithColor(context, redColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, strokeRect);
    
    CGPoint startPoint = CGPointMake(paperRect.origin.x, paperRect.origin.y + paperRect.size.height - 1);
    CGPoint endPoint = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, paperRect.origin.y + paperRect.size.height - 1);
    draw1PxStroke(context, startPoint, endPoint, separatorColor);

}


@end
