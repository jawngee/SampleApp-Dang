//
//  RDKClothesDetailViewController.m
//  robe
//
//  Created by Trung Dang on 12/1/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKProductDetailViewController.h"

#import "UIImageView+WebCache.h"
#import "RDKProductsItem.h"
#import "RDKColorButton.h"

@implementation RDKProductDetailViewController
@synthesize productImageView = _productImageView;
@synthesize productsItem = _productsItem;
@synthesize thumbArray = _thumbArray;

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
    [_thumbArray release];
    [_productsItem release];
    [_productImageView release];
    [super dealloc];
}

#pragma mark -
#pragma mark - private function

- (void)colorButtonPress:(id)sender
{
    
}

- (void)silverButtonPress:(id)sender
{
    [self.productImageView setImage:[UIImage imageNamed:@"clothes-silver-bag.png"]];
}

- (void)orangeButtonPress:(id)sender
{
    [self.productImageView setImage:[UIImage imageNamed:@"clothes-orange-bag.png"]];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 280, 320, 105)];
    
    /** declare back ground image */
    UIImageView *bottomBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 105)];
    [bottomBackgroundImageView setImage:[UIImage imageNamed:@"clothes-footer-background.png"]];
    
    /** declare title lable */ 
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 150, 15)];
    [titleLable setBackgroundColor:[UIColor clearColor]];
    [titleLable setFont:[UIFont boldSystemFontOfSize:14]];
    [titleLable setLineBreakMode:UILineBreakModeWordWrap];
    [titleLable setTextColor:[UIColor whiteColor]];
    [titleLable setText:self.productsItem.title];
    
    /** declare description lable */
    UILabel *descriptionLable = [[UILabel alloc] initWithFrame:CGRectMake(5, 35, 150, 15)];
    [descriptionLable setTextColor:[UIColor colorWithRed:209.0/255.0 green:209.0/255.0 blue:209.0/255.0 alpha:1.0]];
    [descriptionLable setBackgroundColor:[UIColor clearColor]];
    [descriptionLable setFont:[UIFont systemFontOfSize:11]];
    [descriptionLable setLineBreakMode:UILineBreakModeWordWrap];
    [descriptionLable setText:self.productsItem.description];
    
    /** declare rsp lable */
    UILabel *colorLable = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 35, 15)];
    [colorLable setTextColor:[UIColor colorWithRed:209.0/255.0 green:209.0/255.0 blue:209.0/255.0 alpha:1.0]];
    [colorLable setBackgroundColor:[UIColor clearColor]];
    [colorLable setFont:[UIFont systemFontOfSize:11]];
    [colorLable setLineBreakMode:UILineBreakModeWordWrap];
    [colorLable setText:self.productsItem.rsp];
    
    /** add all of them into bottom view */
    [bottomView addSubview:bottomBackgroundImageView];
    [bottomView addSubview:titleLable];
    [bottomView addSubview:descriptionLable];
    [bottomView addSubview:colorLable];

    /** add color button into bottom view */
    for (int i=0; i < [self.productsItem.colors count]; i++) 
    {
        /** declare color button */
        RDKColorButton *colorButton = [[RDKColorButton alloc] initWithFrame:CGRectMake(i*30+40, 55, 25, 25)];
        [colorButton addTarget:self action:@selector(colorButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        [colorButton setColor:[[self.productsItem.colors objectAtIndex:i] valueForKey:@"color"]];
        
        /** add color button into bottom view */
        [bottomView addSubview:colorButton];
        
        /** release color button */
        [colorButton release];
    }
    
    NSArray *viewArray = [[NSArray alloc] initWithArray:[[self.productsItem.colors objectAtIndex:0] valueForKey:@"views"]];
    
    for (int i=0; i < [viewArray count]; i++) 
    {
        UIImageView *thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*50+170, 35, 44, 44)];
        [thumbImageView setBackgroundColor:[UIColor clearColor]];
        [thumbImageView setContentMode:UIViewContentModeCenter];
        [thumbImageView setImageWithURL:[NSURL URLWithString:[[viewArray objectAtIndex:i] valueForKey:@"thumbnail"]] placeholderImage:nil];
        
        [bottomView addSubview:thumbImageView];
        
        [thumbImageView release];
    }

    self.productImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)] autorelease];
    [self.productImageView setBackgroundColor:[UIColor clearColor]];
    [self.productImageView setContentMode:UIViewContentModeCenter];
    [self.productImageView setImage:[UIImage imageNamed:@"clothes-silver-bag.png"]];

    UIImageView *shadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 210, 320, 50)];
    [shadowImageView setBackgroundColor:[UIColor clearColor]];
    [shadowImageView setContentMode:UIViewContentModeCenter];
    [shadowImageView setImage:[UIImage imageNamed:@"clothes-bag-shadow.png"]];

    [self.view addSubview:bottomView];
    [self.view addSubview:self.productImageView];
    [self.view addSubview:shadowImageView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

//- (void)backButtonPress:(id)sender
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
