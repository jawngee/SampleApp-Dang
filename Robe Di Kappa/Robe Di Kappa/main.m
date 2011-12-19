//
//  main.m
//  Robe Di Kappa
//
//  Created by Jon Gilkison on 11/16/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SCClassUtils.h"
#import "RDKAppDelegate.h"

int main(int argc, char *argv[])
{
    [SCClassUtils swizzleSelector:@selector(insertSubview:atIndex:)
                          ofClass:[UINavigationBar class]
                     withSelector:@selector(scInsertSubview:atIndex:)];
    [SCClassUtils swizzleSelector:@selector(sendSubviewToBack:)
                          ofClass:[UINavigationBar class]
                     withSelector:@selector(scSendSubviewToBack:)];

    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([RDKAppDelegate class]));
    }
}
