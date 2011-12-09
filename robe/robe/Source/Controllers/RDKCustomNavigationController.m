//
//  RDKCustomNavigationController.m
//  robe
//
//  Created by Trung Dang on 11/28/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKCustomNavigationController.h"
#import "SCAppUtils.h"


//@implementation UINavigationBar (UINavigationBarCategory)  
//
//- (void)drawRect:(CGRect)rect  
//{  
//    UIImage *image = [UIImage imageNamed:@"topbar-background-image.png"];  
//    
//    [image drawInRect:rect];  
//}  
//
//@end  

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
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    return [super popViewControllerAnimated:animated];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:tvc];
    [SCAppUtils customizeNavigationController:self];
//    [self setNavController:nc];

    
//    UIImageView *topBarBackground=[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topbar-background-image.png"]] autorelease];
//    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 4.9) 
//    {
//        //iOS 5
//        [self.navigationBar insertSubview:topBarBackground atIndex:2];
//    }
//    else 
//    {
//        //iOS 4.whatever and below
//        [self.navigationBar insertSubview:topBarBackground atIndex:2];
//        
//    }

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
