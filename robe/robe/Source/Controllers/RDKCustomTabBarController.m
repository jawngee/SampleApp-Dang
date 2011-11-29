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
    
    //    for(UIView *view in self.tabBarController.tabBar.subviews) {  
    //        if([view isKindOfClass:[UILabel class]]) {  
    //            [view removeFromSuperview];  
    //        }  
    //    }  
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottombar-background.png"]];
    
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
    
}


- (void)setViewControllers:(NSArray *)viewControllers
{
    [super setViewControllers:viewControllers];
    
    RDKCustomTabBarItem *customHomeTabBarItem = [[RDKCustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
    [customHomeTabBarItem setCustomStdImage:[UIImage imageNamed:@"unselected-home-icon.png"]];
    [customHomeTabBarItem setCustomHighlightedImage:[UIImage imageNamed:@"selected-home-icon.png"]];
    [customHomeTabBarItem setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];
    
    RDKCustomTabBarItem *customCalendarTabBarItem = [[RDKCustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
    [customCalendarTabBarItem setCustomStdImage:[UIImage imageNamed:@"unselected-calendar-icon.png"]];
    [customCalendarTabBarItem setCustomHighlightedImage:[UIImage imageNamed:@"selected-calendar-icon.png"]];
    [customCalendarTabBarItem setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];

    RDKCustomTabBarItem *customClothesTabBarItem = [[RDKCustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
    [customClothesTabBarItem setCustomStdImage:[UIImage imageNamed:@"unselected-clothes-icon.png"]];
    [customClothesTabBarItem setCustomHighlightedImage:[UIImage imageNamed:@"selected-clothes-icon.png"]];
    [customClothesTabBarItem setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];

    RDKCustomTabBarItem *customBagTabBarItem = [[RDKCustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
    [customBagTabBarItem setCustomStdImage:[UIImage imageNamed:@"unselected-bag-icon.png"]];
    [customBagTabBarItem setCustomHighlightedImage:[UIImage imageNamed:@"selected-bag-icon.png"]];
    [customBagTabBarItem setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];

    RDKCustomTabBarItem *customMapTabBarItem = [[RDKCustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
    [customMapTabBarItem setCustomStdImage:[UIImage imageNamed:@"unselected-map-icon.png"]];
    [customMapTabBarItem setCustomHighlightedImage:[UIImage imageNamed:@"selected-map-icon.png"]];
    [customMapTabBarItem setImageInsets:UIEdgeInsetsMake(8, 0, -8, 0)];

    [[self.viewControllers objectAtIndex:0] setTabBarItem:customHomeTabBarItem];
    [[self.viewControllers objectAtIndex:1] setTabBarItem:customCalendarTabBarItem];
    [[self.viewControllers objectAtIndex:2] setTabBarItem:customClothesTabBarItem];
    [[self.viewControllers objectAtIndex:3] setTabBarItem:customBagTabBarItem];
    [[self.viewControllers objectAtIndex:4] setTabBarItem:customMapTabBarItem];

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
