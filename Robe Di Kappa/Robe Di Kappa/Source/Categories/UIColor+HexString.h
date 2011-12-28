//
//  UIColor+HexString.h
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/28/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor ()

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length;
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
