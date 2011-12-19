//
//  CalendarViewController.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKCalendarViewController.h"

@implementation RDKCalendarViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - function class

- (void)refresh:(id)sender
{
}

#pragma mark - View lifecycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    /** Do any additional setup after loading the view from its nib. */
    UIImage *refreshImage = [UIImage imageNamed:@"global-refresh-button.png"];
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshButton setImage:refreshImage forState:UIControlStateNormal];
    [refreshButton setFrame:CGRectMake(0.0, 0.0, refreshImage.size.width, refreshImage.size.height)];
    [refreshButton addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];    
    [refreshButton setContentEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
    
    UIBarButtonItem *refreshBarButton = [[UIBarButtonItem alloc] initWithCustomView:refreshButton];
    self.navigationItem.rightBarButtonItem = refreshBarButton;
    [refreshBarButton release];
    
    
    /** create scroll view */
    UIImage *image_1 = [UIImage imageNamed:@"calendar-image-1.jpg"];
    UIImage *image_2 = [UIImage imageNamed:@"calendar-image-2.jpg"];	
	UIImage *image_3 = [UIImage imageNamed:@"calendar-image-3.jpg"];	
    
    NSArray *imageArray = [[NSArray alloc] initWithObjects:image_1, image_2, image_3, nil];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 367)];
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.autoresizesSubviews = YES;
    
	for (int i=0; i < [imageArray count]; i++) {
		UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*320, 0, 320, 367)]; 
		[imageView setImage:[imageArray objectAtIndex:i]];
		[scrollView addSubview:imageView];
		[imageView release];
	}
    
    // Set the contentSize equal to the size of the UIImageView
    // scrollView.contentSize = imageView.scrollview.size;
	scrollView.contentSize = CGSizeMake([imageArray count] * 320, 367);
    [imageArray release];
    
	// Finally, add the UIScrollView to the controller's view
    [self.view addSubview:scrollView];	
    [scrollView release];
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
