//
//  RDKRectangleView.m
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/27/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import "RDKProductView.h"

#import "RDKProductsItem.h"
#import "UIImageView+WebCache.h"

@implementation RDKProductView
@synthesize productsItem = _productsItem;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame productsItem:(RDKProductsItem *)productsItem
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        /** Initialization code */
        [self setProductsItem:productsItem];
        [self setBackgroundColor:[UIColor clearColor]];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 106, 122)];
        [imageView setContentMode:UIViewContentModeCenter];
        [imageView setImageWithURL:[NSURL URLWithString:self.productsItem.icon] placeholderImage:nil];
        
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 107, 1)];
        [topView setBackgroundColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 123, 107, 1)];
        [bottomView setBackgroundColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];

        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 123)];
        [leftView setBackgroundColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];

        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(107, 0, 1, 123)];
        [rightView setBackgroundColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(0, 0, 107, 123)];
        [button setBackgroundColor:[UIColor clearColor]];
        [button addTarget:self action:@selector(selectProduct:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:imageView];
        [self addSubview:topView];
        [self addSubview:bottomView];
        [self addSubview:leftView];
        [self addSubview:rightView];
        [self addSubview:button];
        
        [imageView release];
        [topView release];
        [bottomView release];
        [leftView release];
        [rightView release];
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    /** Drawing code */
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGColorRef color = [UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0].CGColor;
//    CGRect rectangleRect = CGRectMake(0, 0, 107, 123);
    
//    CGContextClearRect(context, rectangleRect);
//    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
//    CGContextFillRect(context, rectangleRect);
    
//    CGContextSetStrokeColorWithColor(context, color);
//    CGContextSetLineWidth(context, 1.0);
//    CGContextStrokeRect(context, rectangleRect);
}

-(void)selectProduct:(id)sender
{
    [self.delegate selectProduct:self];
    [self setBackgroundColor:[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:210.0/255.0 alpha:1.0]];
}

- (void)dealloc
{
    [_productsItem release];
    [_delegate release];
    [super dealloc];
}


@end
