//
//  RDKCustomNavigationController.m
//  robe
//
//  Created by Trung Dang on 11/28/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKCustomNavigationController.h"

@implementation RDKCustomNavigationController

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
