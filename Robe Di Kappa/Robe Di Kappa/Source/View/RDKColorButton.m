//
//  RDKColorButton.m
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/27/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import "RDKColorButton.h"

#import "UIColor+HexString.h"

@implementation RDKColorButton
@synthesize color = _color;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        /** Initialization code */
        UIImageView *gradientOverlay = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
        [gradientOverlay setImage:[UIImage imageNamed:@"clothes-color-button.png"]];
        
        /** add gradient overlay image view */
        [self addSubview:gradientOverlay];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorRef colorRef = [UIColor colorWithHexString:self.color].CGColor;
    CGRect rectangleRect = CGRectMake(0, 0, 25, 25);

    /** fill background with color */
    CGContextSetFillColorWithColor(context, colorRef);
    CGContextFillRect(context, rectangleRect);
    
    /** declare three point for fill color */
    CGPoint A = CGPointMake(25, 25);
    CGPoint B = CGPointMake(21, 25);
    CGPoint C = CGPointMake(25, 21);
    
    /** fill color with three point */
    CGContextMoveToPoint(context, A.x, A.y);
    CGContextAddLineToPoint(context, B.x, B.y);
    CGContextAddLineToPoint(context, C.x, C.y);
    CGContextAddLineToPoint(context, A.x, A.y);
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextFillPath(context);
}

- (void)dealloc
{
    [_color release];
    [super dealloc];
}


@end
