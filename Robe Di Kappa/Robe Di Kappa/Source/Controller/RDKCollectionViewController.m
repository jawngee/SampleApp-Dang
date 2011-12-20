//
//  RDKClothesGridViewController.m
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKCollectionViewController.h"
#import "RDKProductListViewController.h"

@implementation RDKCollectionViewController
@synthesize productListViewController = _productListViewController;

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
    [_productListViewController release];
    [cellList release];
    [super dealloc];
}

#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark -
#pragma mark RDKClothesItemTableViewCellDelegate

- (void)itemClick:(id)sender
{
    /** transmit to another screen */
    if (!self.productListViewController) {
        self.productListViewController = [[[RDKProductListViewController alloc] initWithNibName:@"RDKProductListViewController" bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:self.productListViewController animated:YES];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	return 123;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"TableViewCell_%d", [indexPath row]];
    
	RDKCollectionTableViewCell *__cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (__cell == nil) {
        __cell = [[[RDKCollectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
        __cell.cellList = cellList;
        __cell.delegate = self;
        
        [cellList addObject:__cell];
        
        if ([indexPath row] == 0) {
            __cell.image_1 = [UIImage imageNamed:@"clothes-item-1.png"];
            __cell.image_2 = [UIImage imageNamed:@"clothes-item-2.png"];
            __cell.image_3 = [UIImage imageNamed:@"clothes-item-3.png"];
        }
        
        if ([indexPath row] == 1) {
            __cell.image_1 = [UIImage imageNamed:@"clothes-item-3.png"];
            __cell.image_2 = [UIImage imageNamed:@"clothes-item-1.png"];
            __cell.image_3 = [UIImage imageNamed:@"clothes-item-2.png"];
        }
        
        if ([indexPath row] == 2) {
            __cell.image_1 = [UIImage imageNamed:@"clothes-item-2.png"];
            __cell.image_2 = [UIImage imageNamed:@"clothes-item-1.png"];
            __cell.image_3 = [UIImage imageNamed:@"clothes-item-3.png"];
        }
        
        if ([indexPath row] == 3) {
            __cell.image_1 = [UIImage imageNamed:@"clothes-item-3.png"];
            __cell.image_2 = [UIImage imageNamed:@"clothes-item-2.png"];
            __cell.image_3 = [UIImage imageNamed:@"clothes-item-1.png"];
        }
        
        if ([indexPath row] == 4) {
            __cell.image_1 = [UIImage imageNamed:@"clothes-item-1.png"];
        }
    }

	return __cell;
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
    
    /** init cell list */
    cellList = [[NSMutableArray alloc] init];
    
    UIImage *backImage = [UIImage imageNamed:@"global-back-button.png"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0.0, 0.0, backImage.size.width, backImage.size.height)];
    [backButton addTarget:self action:@selector(backButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setContentEdgeInsets:UIEdgeInsetsMake(0, 8, 0, -8)];
    
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = backBarButton;
    [backBarButton release];
}

- (void)backButtonPress:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
