//
//  PFNAppDelegate.m
//  PlusFactoryNotes
//
//  Created by Jon Gilkison on 11/10/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import "PFNAppDelegate.h"
#import "PFNHomeViewController.h"
#import "FMDatabase.h"

#import "PFNNote.h"

@implementation PFNAppDelegate

#pragma mark - Properties

@synthesize window = _window;
@synthesize viewController = _viewController;

#pragma mark - Init/Dealloc

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

#pragma mark - UIApplicationDelegate methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Install the sqlite database to the user's document folder
    [FMDatabase installDatabase:[[NSBundle mainBundle] pathForResource:@"notes" ofType:@"db"] force:NO];
    
    // Boilerplate startup code
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.viewController = [[[UINavigationController alloc] init] autorelease];
    self.window.rootViewController = self.viewController;

    // Push the home view controller
    PFNHomeViewController *mainView=[[[PFNHomeViewController alloc] initWithNibName:@"PFNHomeViewController" bundle:nil] autorelease];
    [self.viewController pushViewController:mainView animated:NO];
    
    // Rock out
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
