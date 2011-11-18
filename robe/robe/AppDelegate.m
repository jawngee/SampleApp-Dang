//
//  AppDelegate.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeViewController.h"
#import "CalendarViewController.h"
#import "ClothesViewController.h"
#import "BagViewController.h"
#import "MapViewController.h"


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
    UIViewController *homeViewController = [[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil] autorelease];
    UIViewController *calendarViewController = [[[CalendarViewController alloc] initWithNibName:@"CalendarViewController" bundle:nil] autorelease];
    UIViewController *clothesViewController = [[[ClothesViewController alloc] initWithNibName:@"ClothesViewController" bundle:nil] autorelease];
    UIViewController *bagViewController = [[[BagViewController alloc] initWithNibName:@"BagViewController" bundle:nil] autorelease];
    UIViewController *mapViewController = [[[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil] autorelease];
    
    /** create home navigation controller */
    self.homeNavigationController = [[[UINavigationController alloc] initWithRootViewController:homeViewController] autorelease];
    self.homeNavigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.calendarNavigationController = [[[UINavigationController alloc] initWithRootViewController:calendarViewController] autorelease];
    self.calendarNavigationController.navigationBar.tintColor = [UIColor blackColor];

    self.clothesNavigationController = [[[UINavigationController alloc] initWithRootViewController:clothesViewController] autorelease];
    self.clothesNavigationController.navigationBar.tintColor = [UIColor blackColor];

    self.bagNavigationController = [[[UINavigationController alloc] initWithRootViewController:bagViewController] autorelease];
    self.bagNavigationController.navigationBar.tintColor = [UIColor blackColor];

    self.mapNavigationController = [[[UINavigationController alloc] initWithRootViewController:mapViewController] autorelease];
    self.mapNavigationController.navigationBar.tintColor = [UIColor blackColor];

    /** create tab bar controller */
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:self.homeNavigationController, self.calendarNavigationController, self.clothesNavigationController, self.bagNavigationController, self.mapNavigationController, nil];
    
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:[UIImage imageNamed:@"home-icon.png"] tag:1];
    NSArray *itemArray = [[NSArray alloc] initWithObjects:homeItem, nil];
    
    UIView *backgroundTabbarView = [[UIView alloc] initWithFrame:CGRectMake(0, 425, 320, 52)];
    [backgroundTabbarView setBackgroundColor:[UIColor greenColor]];
    
//    self.tabBarController.toolbarItems = itemArray;
//    [self.tabBarController.tabBar setItems:itemArray];
//    [[self.tabBarController tabBar] insertSubview:backgroundTabbarView atIndex:0];
//    [self.tabBarController.view addSubview:backgroundTabbarView];
    
    UITabBar *customTabbar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 425, 320, 52)];
    [customTabbar setItems:itemArray];
    

//    [self.tabBarController.view addSubview:customTabbar];
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
