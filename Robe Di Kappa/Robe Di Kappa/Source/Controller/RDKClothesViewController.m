//
//  ClothesViewController.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKClothesViewController.h"

#import "RDKClothesTableViewCell.h"
#import "RDKProductViewController.h"

@implementation RDKClothesViewController
@synthesize productViewController = _productViewController;

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
    [_productViewController release];
    [super dealloc];
}

#pragma mark - function class

- (void)refresh:(id)sender
{
}

#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.productViewController) {
        self.productViewController = [[[RDKProductViewController alloc] initWithNibName:@"RDKProductViewController" bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:self.productViewController animated:YES];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	return 92;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"TableViewCell";
    
	RDKClothesTableViewCell *__cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (__cell == nil) {
        __cell = [[[RDKClothesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
        
    if ([indexPath row] == 0) {
        [__cell.imageViewCell setImage:[UIImage imageNamed:@"clothes-male.png"]];
        [__cell.imageViewCell setHighlightedImage:[UIImage imageNamed:@"clothes-male-cover.png"]];
        [__cell.titleLable setText:@"中性"];
    }
    
    if ([indexPath row] == 1) {
        [__cell.imageViewCell setImage:[UIImage imageNamed:@"clothes-female.png"]];
        [__cell.imageViewCell setHighlightedImage:[UIImage imageNamed:@"clothes-female-cover.png"]];
        [__cell.titleLable setText:@"女装"];
    }
    
    if ([indexPath row] == 2) {
        [__cell.imageViewCell setImage:[UIImage imageNamed:@"clothes-unisex.png"]];
        [__cell.imageViewCell setHighlightedImage:[UIImage imageNamed:@"clothes-unisex-cover.png"]];
        [__cell.titleLable setText:@"中性"];
    }
    
	return __cell;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /** create custom refresh button */
    UIImage *refreshImage = [UIImage imageNamed:@"global-refresh-button.png"];
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshButton setImage:refreshImage forState:UIControlStateNormal];
    [refreshButton setFrame:CGRectMake(0.0, 0.0, refreshImage.size.width, refreshImage.size.height)];
    [refreshButton addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];    
    [refreshButton setContentEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
    
    UIBarButtonItem *refreshBarButton = [[UIBarButtonItem alloc] initWithCustomView:refreshButton];
    self.navigationItem.rightBarButtonItem = refreshBarButton;
    [refreshBarButton release];    
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
