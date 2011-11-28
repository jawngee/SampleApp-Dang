//
//  AppDelegate.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "AppDelegate.h"

#import "RDKHomeViewController.h"
#import "RDKCalendarViewController.h"
#import "RDKClothesViewController.h"
#import "RDKBagViewController.h"
#import "RDKMapViewController.h"
#import "RDKCustomNavigationController.h"
#import "RDKCustomTabBarController.h"


@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize homeNavigationController = _homeNavigationController;
@synthesize calendarNavigationController = _calendarNavigationController;
@synthesize clothesNavigationController = _clothesNavigationController;
@synthesize bagNavigationController = _bagNavigationController;
@synthesize mapNavigationController = _mapNavigationController;


- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [_homeNavigationController release];
    [_calendarNavigationController release];
    [_clothesNavigationController release];
    [_bagNavigationController release];
    [_mapNavigationController release];
    
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    /** Override point for customization after application launch */
    UIViewController *homeViewController = [[[RDKHomeViewController alloc] initWithNibName:@"RDKHomeViewController" bundle:nil] autorelease];
    UIViewController *calendarViewController = [[[RDKCalendarViewController alloc] initWithNibName:@"RDKCalendarViewController" bundle:nil] autorelease];
    UIViewController *clothesViewController = [[[RDKClothesViewController alloc] initWithNibName:@"RDKClothesViewController" bundle:nil] autorelease];
    UIViewController *bagViewController = [[[RDKBagViewController alloc] initWithNibName:@"RDKBagViewController" bundle:nil] autorelease];
    UIViewController *mapViewController = [[[RDKMapViewController alloc] initWithNibName:@"RDKMapViewController" bundle:nil] autorelease];
    
    /** create navigation controller for all UIViewController */
    self.homeNavigationController = [[[RDKCustomNavigationController alloc] initWithRootViewController:homeViewController] autorelease];    
    self.calendarNavigationController = [[[RDKCustomNavigationController alloc] initWithRootViewController:calendarViewController] autorelease];
    self.clothesNavigationController = [[[RDKCustomNavigationController alloc] initWithRootViewController:clothesViewController] autorelease];
    self.bagNavigationController = [[[RDKCustomNavigationController alloc] initWithRootViewController:bagViewController] autorelease];
    self.mapNavigationController = [[[RDKCustomNavigationController alloc] initWithRootViewController:mapViewController] autorelease];

    /** create tab bar controller */
    self.tabBarController = [[[RDKCustomTabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:self.homeNavigationController, self.calendarNavigationController, self.clothesNavigationController, self.bagNavigationController, self.mapNavigationController, nil];
    
//    for(UIView *view in self.tabBarController.tabBar.subviews) {  
//        if([view isKindOfClass:[UILabel class]]) {  
//            [view removeFromSuperview];  
//        }  
//    }  
        
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottombar-background.png"]];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 4.9) {
        //iOS 5
        [self.tabBarController.tabBar insertSubview:imageView atIndex:1];
    }
    else {
        //iOS 4.whatever and below
        [self.tabBarController.tabBar insertSubview:imageView atIndex:0];
    }
    
    [imageView release];
    
//    for (UIView *view in self.tabBarController.tabBar.subviews)
//    {      
//        if ([NSStringFromClass([view class]) isEqualToString:@"UITabBarButton"])
//        {
//            for (UIView *subview in view.subviews)
//            {                                    
//                if ([subview isKindOfClass:[UILabel class]])
//                {
//                    UILabel *label = (UILabel *)subview;
//                    [label removeFromSuperview];
//                }
//                
//                if ([subview isKindOfClass:[UIImageView class]])
//                {
//                    UIImageView *imageView = (UIImageView *)subview;
//                    NSLog(@"w=%f, h=%f", imageView.frame.size.width, imageView.frame.size.height);
//                }
//            }
//        }
//    }      
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
