//
//  CustomTabBarItem.m
//  robe
//
//  Created by Trung Dang on 11/18/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "CustomTabBarItem.h"

@implementation CustomTabBarItem

@synthesize customHighlightedImage;
@synthesize customStdImage;

- (void) dealloc
{
    [customHighlightedImage release]; customHighlightedImage=nil;
    [customStdImage release]; customStdImage=nil;   
    [super dealloc];
}

-(UIImage *) selectedImage
{
    return self.customHighlightedImage;
}

-(UIImage *) unselectedImage
{
    return self.customStdImage;
}

@end