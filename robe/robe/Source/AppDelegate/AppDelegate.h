//
//  AppDelegate.h
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

/** application delegate */
@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate> {
    
}

/** main window */
@property (strong, nonatomic) UIWindow *window;
/** tab bar controller */
@property (strong, nonatomic) UITabBarController *tabBarController;

/** navigation controller for home view */
@property (strong, nonatomic) UINavigationController *homeNavigationController;
/** navigation controller for calendar view */
@property (strong, nonatomic) UINavigationController *calendarNavigationController;
/** navigation controller for clothes view */
@property (strong, nonatomic) UINavigationController *clothesNavigationController;
/** navigation controller for bag view */
@property (strong, nonatomic) UINavigationController *bagNavigationController;
/** navigation controller for map view */
@property (strong, nonatomic) UINavigationController *mapNavigationController;


@end