//
//  CoolButton.h
//  CoolButton
//
//  Created by Trung Dang on 11/15/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>

@interface CoolButton : UIButton {
    CGFloat _hue;
    CGFloat _saturation;
    CGFloat _brightness;
}

@property  CGFloat hue;
@property  CGFloat saturation;
@property  CGFloat brightness;

@end
