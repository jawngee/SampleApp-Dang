//
//  ClothesViewController.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKClothesViewController.h"

#import "RDKClothesTableViewCell.h"
#import "RDKClothesGridViewController.h"

@implementation RDKClothesViewController
@synthesize clothesGridViewController = _clothesGridViewController;


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
    [_clothesGridViewController release];
    [clothesTableView release];
    [super dealloc];
}

#pragma mark - function class

- (void)refresh:(id)sender
{
}

#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.clothesGridViewController) {
        self.clothesGridViewController = [[[RDKClothesGridViewController alloc] initWithNibName:@"RDKClothesGridViewController" bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:self.clothesGridViewController animated:YES];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 4;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//	return @"";
//}

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
        __cell.imageViewCell.image = [UIImage imageNamed:@"clothes-clothes-image.png"];
        [__cell.imageViewCell setHighlightedImage:[UIImage imageNamed:@"clothes-clothes-cover-image.png"]];
//        __cell.imageViewCell.frame = CGRectMake(20, 30, 35, 45);
        __cell.titleLable.text = @"上衣";
    }
    
    if ([indexPath row] == 1) {
        __cell.imageViewCell.image = [UIImage imageNamed:@"clothes-trousers-image.png"];
        [__cell.imageViewCell setHighlightedImage:[UIImage imageNamed:@"clothes-trousers-cover-image.png"]];
//        __cell.imageViewCell.frame = CGRectMake(30, 30, 19, 45);
        __cell.titleLable.text = @"裤子";
    }
    
    if ([indexPath row] == 2) {
        __cell.imageViewCell.image = [UIImage imageNamed:@"clothes-shoe-image.png"];
        [__cell.imageViewCell setHighlightedImage:[UIImage imageNamed:@"clothes-shoe-cover-image.png"]];
//        __cell.imageViewCell.frame = CGRectMake(20, 30, 32, 43);
        __cell.titleLable.text = @"鞋子";
    }
    
    if ([indexPath row] == 3) {
        __cell.imageViewCell.image = [UIImage imageNamed:@"clothes-bag-image.png"];
        [__cell.imageViewCell setHighlightedImage:[UIImage imageNamed:@"clothes-bag-cover-image.png"]];
//        __cell.imageViewCell.frame = CGRectMake(20, 25, 36, 45);
        __cell.titleLable.text = @"配饰";
    }

	return __cell;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /** create custom refresh button */
    UIImage *refreshImage = [UIImage imageNamed:@"refresh-button.png"];
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
    self.clothesGridViewController = nil;
    clothesTableView = nil;
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
