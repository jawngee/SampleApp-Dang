//
//  RDKProductDetailViewController.m
//  robe
//
//  Created by Trung Dang on 12/12/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKProductViewController.h"

#import "RDKProductTableViewCell.h"
#import "RDKCollectionViewController.h"

@implementation RDKProductViewController
@synthesize collectionViewController = _collectionViewController;

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
}

- (void)dealloc
{
    [_collectionViewController release];
    [super dealloc];
}

#pragma mark - function class

- (void)refresh:(id)sender
{
}

- (void)backButtonPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.collectionViewController) {
        self.collectionViewController = [[[RDKCollectionViewController alloc] initWithNibName:@"RDKCollectionViewController" bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:self.collectionViewController animated:YES];
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
    
	RDKProductTableViewCell *__cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (__cell == nil) {
        __cell = [[[RDKProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if ([indexPath row] == 0) {
        [__cell.imageViewCell setImage:[UIImage imageNamed:@"clothes-clothes.png"]];
        [__cell.imageViewCell setHighlightedImage:[UIImage imageNamed:@"clothes-clothes-cover.png"]];
        [__cell.titleLable setText:@"上衣"];
    }
    
    if ([indexPath row] == 1) {
        [__cell.imageViewCell setImage:[UIImage imageNamed:@"clothes-trousers.png"]];
        [__cell.imageViewCell setHighlightedImage:[UIImage imageNamed:@"clothes-trousers-cover.png"]];
        [__cell.titleLable setText:@"裤子"];
    }
    
    if ([indexPath row] == 2) {
        [__cell.imageViewCell setImage:[UIImage imageNamed:@"clothes-shoe.png"]];
        [__cell.imageViewCell setHighlightedImage:[UIImage imageNamed:@"clothes-shoe-cover.png"]];
        [__cell.titleLable setText:@"鞋子"];
    }
    
    if ([indexPath row] == 3) {
        [__cell.imageViewCell setImage:[UIImage imageNamed:@"clothes-bag.png"]];
        [__cell.imageViewCell setHighlightedImage:[UIImage imageNamed:@"clothes-bag-cover.png"]];
        [__cell.titleLable setText:@"配饰"];
    }
    
	return __cell;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
