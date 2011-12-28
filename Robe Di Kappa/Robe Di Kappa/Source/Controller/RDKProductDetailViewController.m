//
//  RDKClothesDetailViewController.m
//  robe
//
//  Created by Trung Dang on 12/1/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKProductDetailViewController.h"

#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "RDKProductsItem.h"
#import "RDKColorButton.h"

@implementation RDKProductDetailViewController
@synthesize productImageView = _productImageView;
@synthesize thumbButtonArray = _thumbButtonArray;
@synthesize colorButtonArray = _colorButtonArray;
@synthesize productsItem = _productsItem;

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
    [_productsItem release];
    [_thumbButtonArray release];
    [_colorButtonArray release];
    [_productImageView release];
    [super dealloc];
}

#pragma mark -
#pragma mark - private function

- (void)colorButtonPress:(id)sender
{
    RDKColorButton *colorButton = (RDKColorButton *)sender;
    
    int index = [self.colorButtonArray indexOfObject:colorButton];
    
    NSArray *viewArray = [[NSArray alloc] initWithArray:[[self.productsItem.colors objectAtIndex:index] valueForKey:@"views"]];
    
    for (int i=0; i < [self.thumbButtonArray count]; i++) 
    {
        UIButton *thumbButton = [self.thumbButtonArray objectAtIndex:i];
        [thumbButton setImageWithURL:[NSURL URLWithString:[[viewArray objectAtIndex:i] valueForKey:@"thumbnail"]] placeholderImage:nil];
        
        NSLog(@"THUMB: %@", [[viewArray objectAtIndex:i] valueForKey:@"thumbnail"]);
    }
    
    [self.productImageView setImageWithURL:[NSURL URLWithString:[[viewArray objectAtIndex:0] valueForKey:@"image"]] placeholderImage:nil];

    [viewArray release];
}

- (void)thumbButtonPress:(id)sender
{
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.thumbButtonArray = [[NSMutableArray alloc] init];
    self.colorButtonArray = [[NSMutableArray alloc] init];
    
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
    
    /** release variable */
    [bottomBackgroundImageView release];
    [titleLable release];
    [descriptionLable release];
    [colorLable release];
    
    /** add color button into bottom view */
    for (int i=0; i < [self.productsItem.colors count]; i++) 
    {
        /** declare color button */
        RDKColorButton *colorButton = [[RDKColorButton alloc] initWithFrame:CGRectMake(i*30+40, 55, 25, 25)];
        [colorButton addTarget:self action:@selector(colorButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        [colorButton setColor:[[self.productsItem.colors objectAtIndex:i] valueForKey:@"color"]];
        
        /** add color button into bottom view */
        [bottomView addSubview:colorButton];
        [self.colorButtonArray addObject:colorButton];
        
        /** release color button */
        [colorButton release];
    }
    
    NSArray *viewArray = [[NSArray alloc] initWithArray:[[self.productsItem.colors objectAtIndex:0] valueForKey:@"views"]];
    
    for (int i=0; i < [viewArray count]; i++) 
    {
        UIButton *thumbButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [thumbButton setFrame:CGRectMake(i*50+170, 35, 44, 44)];
        [thumbButton setImageWithURL:[NSURL URLWithString:[[viewArray objectAtIndex:i] valueForKey:@"thumbnail"]] placeholderImage:nil];
        [thumbButton addTarget:self action:@selector(thumbButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        /** add thumb button into bottom view */
        [bottomView addSubview:thumbButton];
        /** add thumb button into thumb array */
        [self.thumbButtonArray addObject:thumbButton];
    }

    self.productImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)] autorelease];
    [self.productImageView setBackgroundColor:[UIColor clearColor]];
    [self.productImageView setContentMode:UIViewContentModeCenter];
    [self.productImageView setImageWithURL:[NSURL URLWithString:[[viewArray objectAtIndex:0] valueForKey:@"image"]] placeholderImage:nil];

    UIImageView *shadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 210, 320, 50)];
    [shadowImageView setBackgroundColor:[UIColor clearColor]];
    [shadowImageView setContentMode:UIViewContentModeCenter];
    [shadowImageView setImage:[UIImage imageNamed:@"clothes-bag-shadow.png"]];

    [self.view addSubview:bottomView];
    [self.view addSubview:self.productImageView];
    [self.view addSubview:shadowImageView];
    
    [shadowImageView release];
    [bottomView release];
    [viewArray release];
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
