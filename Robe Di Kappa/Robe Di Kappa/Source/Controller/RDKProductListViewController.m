//
//  RDKProductListViewController.m
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/19/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import "RDKProductListViewController.h"

#import "RDKProductDetailViewController.h"

@implementation RDKProductListViewController
@synthesize productsArray = _productsArray;
@synthesize productDetailViewArray = _productDetailViewArray;

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

- (void)dealloc
{
    [_productsArray release];
    [_productDetailViewArray release];
    [super dealloc];
}

#pragma mark -
#pragma mark Private Methods

- (void)pushBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /** create custom back button */
    UIImage *backImage = [UIImage imageNamed:@"global-back-button.png"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0.0, 0.0, backImage.size.width, backImage.size.height)];
    [backButton addTarget:self action:@selector(pushBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setContentEdgeInsets:UIEdgeInsetsMake(0, 8, 0, -8)];
    
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = backBarButton;
    [backBarButton release];

    /** create scroll view */
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 367)];
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.autoresizesSubviews = YES;
    
    NSLog(@"COUNT VIEW: %d", [self.productsArray count]);
    
    /** create product detail view array */
	for (int i=0; i < [self.productsArray count]; i++) 
    {
        /** declare product detail view */
        RDKProductDetailViewController *productDetailView = [[RDKProductDetailViewController alloc] init];
        [productDetailView setProductsItem:[self.productsArray objectAtIndex:i]];
        [productDetailView.view setFrame:CGRectMake(i*320, 0, 320, 367)];
        
        /** add product detail view into scroll view */
        [scrollView addSubview:productDetailView.view];
        /** add product detail view into array */
		[self.productDetailViewArray addObject:productDetailView];
        
        /** release product detail view */
//		[productDetailView release];
	}
    
    // Set the contentSize equal to the size of the UIImageView
    // scrollView.contentSize = imageView.scrollview.size;
	scrollView.contentSize = CGSizeMake([self.productsArray count] * 320, 367);
    
	// Finally, add the UIScrollView to the controller's view
    [self.view addSubview:scrollView];	
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
