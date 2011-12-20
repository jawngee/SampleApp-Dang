/*
 * Copyright (c) 2010-2010 Sebastian Celis
 * All rights reserved.
 */

#import "SCAppUtils.h"

@implementation SCAppUtils

+ (void)customizeNavigationController:(UINavigationController *)navigationController
{
    UINavigationBar *navigationBar = [navigationController navigationBar];
    //[navBar setTintColor:kSCNavigationBarTintColor];
    
    if ([navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        [navigationBar setBackgroundImage:[UIImage imageNamed:@"global-header-bar-background.png"] forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        UIImageView *imageView = (UIImageView *)[navigationBar viewWithTag:kSCNavigationBarBackgroundImageTag];
        if (imageView == nil)
        {
            imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global-header-bar-background.png"]];
            [imageView setTag:kSCNavigationBarBackgroundImageTag];
            [navigationBar insertSubview:imageView atIndex:0];
            [imageView release];
        }
    }
}

@end
