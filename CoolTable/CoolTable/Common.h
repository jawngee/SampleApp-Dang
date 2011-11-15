//
//  Common.h
//  CoolTable
//
//  Created by Trung Dang on 11/15/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <Foundation/Foundation.h>

CGRect rectFor1PxStroke(CGRect rect);

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef  endColor);
void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color);
void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);

static inline double radians (double degrees) { return degrees * M_PI/180; }
CGMutablePathRef createArcPathFromBottomOfRect(CGRect rect, CGFloat arcHeight);
