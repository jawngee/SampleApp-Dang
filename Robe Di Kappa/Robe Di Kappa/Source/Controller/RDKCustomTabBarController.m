//
//  RDKCustomTabBarController.m
//  robe
//
//  Created by Trung Dang on 11/28/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKCustomTabBarController.h"

#import "RDKCustomTabBarItem.h"

@implementation RDKCustomTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /** set tab bar frame */
//    CGRect tabBarFrame = self.tabBar.frame;
//    tabBarFrame.size.height = 40;
//    tabBarFrame.origin.y -= 40;
//    self.tabBar.frame = tabBarFrame;
    
    /** set background image for tab bar */
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global-footer-bar-background.png"]];

    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 4.9) 
    {
        //iOS 5
        [self.tabBar insertSubview:imageView atIndex:1];
    }
    else 
    {
        //iOS 4.whatever and below
        [self.tabBar insertSubview:imageView atIndex:0];
    }
    
    [imageView release];
}


- (void)setViewControllers:(NSArray *)viewControllers
{
    [super setViewControllers:viewControllers];
    
    RDKCustomTabBarItem *customHomeTabBarItem = [[RDKCustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
    [customHomeTabBarItem setCustomStdImage:[UIImage imageNamed:@"global-unselected-home-icon.png"]];
    [customHomeTabBarItem setCustomHighlightedImage:[UIImage imageNamed:@"global-selected-home-icon.png"]];
    [customHomeTabBarItem setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];
    
    RDKCustomTabBarItem *customCalendarTabBarItem = [[RDKCustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
    [customCalendarTabBarItem setCustomStdImage:[UIImage imageNamed:@"global-unselected-calendar-icon.png"]];
    [customCalendarTabBarItem setCustomHighlightedImage:[UIImage imageNamed:@"global-selected-calendar-icon.png"]];
    [customCalendarTabBarItem setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];

    RDKCustomTabBarItem *customClothesTabBarItem = [[RDKCustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
    [customClothesTabBarItem setCustomStdImage:[UIImage imageNamed:@"global-unselected-clothes-icon.png"]];
    [customClothesTabBarItem setCustomHighlightedImage:[UIImage imageNamed:@"global-selected-clothes-icon.png"]];
    [customClothesTabBarItem setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];

    RDKCustomTabBarItem *customBagTabBarItem = [[RDKCustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
    [customBagTabBarItem setCustomStdImage:[UIImage imageNamed:@"global-unselected-shopping-icon.png"]];
    [customBagTabBarItem setCustomHighlightedImage:[UIImage imageNamed:@"global-selected-shopping-icon.png"]];
    [customBagTabBarItem setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];

    RDKCustomTabBarItem *customMapTabBarItem = [[RDKCustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
    [customMapTabBarItem setCustomStdImage:[UIImage imageNamed:@"global-unselected-map-icon.png"]];
    [customMapTabBarItem setCustomHighlightedImage:[UIImage imageNamed:@"global-selected-map-icon.png"]];
    [customMapTabBarItem setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];

    [[self.viewControllers objectAtIndex:0] setTabBarItem:customHomeTabBarItem];
    [[self.viewControllers objectAtIndex:1] setTabBarItem:customCalendarTabBarItem];
    [[self.viewControllers objectAtIndex:2] setTabBarItem:customClothesTabBarItem];
    [[self.viewControllers objectAtIndex:3] setTabBarItem:customBagTabBarItem];
    [[self.viewControllers objectAtIndex:4] setTabBarItem:customMapTabBarItem];

    [customHomeTabBarItem release];
    [customCalendarTabBarItem release];
    [customClothesTabBarItem release];
    [customBagTabBarItem release];
    [customMapTabBarItem release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
