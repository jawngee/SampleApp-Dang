//
//  CustomHeader.h
//  CoolTable
//
//  Created by Trung Dang on 11/15/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomHeader : UIView {
    UILabel *_titleLabel;
    UIColor *_lightColor;
    UIColor *_darkColor;
    CGRect _coloredBoxRect;
    CGRect _paperRect;
}

@property (retain) UILabel *titleLabel;
@property (retain) UIColor *lightColor;
@property (retain) UIColor *darkColor;

@end
