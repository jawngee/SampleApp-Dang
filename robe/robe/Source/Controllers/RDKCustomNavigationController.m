//
//  RDKCustomNavigationController.m
//  robe
//
//  Created by Trung Dang on 11/28/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKCustomNavigationController.h"

@implementation RDKCustomNavigationController
@synthesize refreshBarButtonItem = _refreshBarButtonItem;

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
    NSLog(@"THE FUCK DUDE");
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [super dealloc];
    [_refreshBarButtonItem release];
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{  
//    if (self.topViewController == nil)
//    {
//        [super pushViewController:viewController animated:animated];
//        return;
//    }

    [super pushViewController:viewController animated:animated];
//    viewController.navigationItem.rightBarButtonItem = _refreshBarButtonItem;
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *viewController = [super popViewControllerAnimated:animated];
//    viewController.navigationItem.rightBarButtonItem = _refreshBarButtonItem;
    return viewController;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *topBarBackground=[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topbar-background-image.png"]] autorelease];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 4.9) 
    {
        //iOS 5
        [self.navigationBar insertSubview:topBarBackground atIndex:1];
    }
    else 
    {
        //iOS 4.whatever and below
        [self.navigationBar insertSubview:topBarBackground atIndex:0];
    }
    
    UIImage *refreshImage = [UIImage imageNamed:@"refresh-button.png"];
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshButton setImage:refreshImage forState:UIControlStateNormal];
    [refreshButton setFrame:CGRectMake(0.0, 0.0, refreshImage.size.width, refreshImage.size.height)];
    [refreshButton addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];
    [refreshButton setContentEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];

    _refreshBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:refreshButton];

}


- (void)viewDidUnload
{
    NSLog(@"UNLOAD BIATCH");
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
