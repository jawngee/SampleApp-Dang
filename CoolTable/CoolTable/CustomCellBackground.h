//
//  CustomCellBackground.h
//  CoolTable
//
//  Created by Trung Dang on 11/15/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellBackground : UIView {
    BOOL _lastCell;
    BOOL _selected;
}

@property  BOOL lastCell;
@property  BOOL selected;

@end
