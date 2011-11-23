//
//  BagViewController.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKBagViewController.h"
#import "RDKCustomTabBarItem.h"

@implementation RDKBagViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.tabBarItem.image = [UIImage imageNamed:@"bag-icon.png"];
//        self.tabBarItem.title = [NSString stringWithString:@"促销信息"];
        
        RDKCustomTabBarItem *customTabBarItem = [[RDKCustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
        
        customTabBarItem.customHighlightedImage = [UIImage imageNamed:@"selected-bag-icon.png"];
        customTabBarItem.customStdImage = [UIImage imageNamed:@"unselected-bag-icon.png"];
        
        self.tabBarItem = customTabBarItem;
        
        UIEdgeInsets insets = UIEdgeInsetsMake(8, 0, -8, 0);
        [self.tabBarItem setImageInsets:insets];

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
