//
//  CustomFooter.m
//  CoolTable
//
//  Created by Trung Dang on 11/15/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "CustomFooter.h"

// At top of file
#import "Common.h"

@implementation CustomFooter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = YES;
        self.backgroundColor = [UIColor clearColor];
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
//    CGColorRef redColor = [UIColor colorWithRed:1.0 green:0.0 
//                                           blue:0.0 alpha:1.0].CGColor;
//    
//    CGContextSetFillColorWithColor(context, redColor);
//    CGContextFillRect(context, self.bounds);
    
    //////
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef whiteColor = [UIColor colorWithRed:1.0 green:1.0 
                                             blue:1.0 alpha:1.0].CGColor; 
    CGColorRef lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 
                                                 blue:230.0/255.0 alpha:1.0].CGColor;
    CGColorRef darkGrayColor = [UIColor colorWithRed:187.0/255.0 green:187.0/255.0 
                                                blue:187.0/255.0 alpha:1.0].CGColor;
    CGColorRef shadowColor = [UIColor colorWithRed:0.2 green:0.2 
                                              blue:0.2 alpha:0.5].CGColor;
    
    CGFloat paperMargin = 9.0;
    CGRect paperRect = CGRectMake(self.bounds.origin.x+paperMargin, 
                                  self.bounds.origin.y,
                                  self.bounds.size.width-paperMargin*2, 
                                  self.bounds.size.height);
    
    CGRect arcRect = paperRect;
    arcRect.size.height = 8;
    
    CGContextSaveGState(context);
    CGMutablePathRef arcPath = createArcPathFromBottomOfRect(arcRect, 4.0);
    CGContextAddPath(context, arcPath);
    CGContextClip(context);            
    drawLinearGradient(context, paperRect, lightGrayColor, darkGrayColor);
    CGContextRestoreGState(context);
    
    CFRelease(arcPath);
}


@end
