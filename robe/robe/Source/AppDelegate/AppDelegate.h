//
//  AppDelegate.h
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) UINavigationController *homeNavigationController;
@property (strong, nonatomic) UINavigationController *calendarNavigationController;
@property (strong, nonatomic) UINavigationController *clothesNavigationController;
@property (strong, nonatomic) UINavigationController *bagNavigationController;
@property (strong, nonatomic) UINavigationController *mapNavigationController;


@end
