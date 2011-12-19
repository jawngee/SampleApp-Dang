//
//  RDKAppDelegate.h
//  Robe Di Kappa
//
//  Created by Jon Gilkison on 11/16/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDKCustomNavigationController;
@class RDKCustomTabBarController;

@interface RDKAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
    
}

/** main window */
@property (strong, nonatomic) UIWindow *window;
/** tab bar controller */
@property (strong, nonatomic) RDKCustomTabBarController *tabBarController;

/** navigation controller for home view */
@property (strong, nonatomic) RDKCustomNavigationController *homeNavigationController;
/** navigation controller for calendar view */
@property (strong, nonatomic) RDKCustomNavigationController *calendarNavigationController;
/** navigation controller for clothes view */
@property (strong, nonatomic) RDKCustomNavigationController *clothesNavigationController;
/** navigation controller for bag view */
@property (strong, nonatomic) RDKCustomNavigationController *shoppingNavigationController;
/** navigation controller for map view */
@property (strong, nonatomic) RDKCustomNavigationController *mapNavigationController;

@end
