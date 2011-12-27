//
//  RDKClothesGridViewController.m
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKCollectionViewController.h"

#import "RDKProductListViewController.h"
#import "RDKProductsItem.h"

#define kCustomRowHeight    60.0
#define kCustomRowCount     1

@implementation RDKCollectionViewController
@synthesize previousCollectionTableViewCell = _previousCollectionTableViewCell;
@synthesize productListViewController = _productListViewController;
@synthesize collectionTableView = _collectionTableView;
@synthesize collectionArray = _collectionArray;

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
    [_previousCollectionTableViewCell release];
    [_productListViewController release];
    [_collectionTableView release];
    [_collectionArray release];
    [super dealloc];
}

#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark -
#pragma mark RDKClothesItemTableViewCellDelegate

- (void)selectProduct:(id)sender
{
    /** clear background color for previous cell */
    if (self.previousCollectionTableViewCell) {
        [self.previousCollectionTableViewCell.previousProductView setBackgroundColor:[UIColor clearColor]];
    }
    
    /** set previouse cell */
    self.previousCollectionTableViewCell = (RDKCollectionTableViewCell *)sender;
    
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
	int row = [self.collectionArray count]/3;
    int col = [self.collectionArray count]%3;
	
    NSLog(@"ROW = %d", row);
    NSLog(@"COL = %d", col);
	
	/** ff there's no data yet, return enough rows to fill the screen */
    if (row == 0 && col == 0) return kCustomRowCount;
    if (col > 0) return row + 1;
    
    return row;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	int row = [self.collectionArray count]/3;
    int col = [self.collectionArray count]%3;
    
	/** ff there's no data yet, return enough rows to fill the screen */
    if (row == 0 && col == 0) return kCustomRowHeight;
    
    return 123;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"TableViewCell";
    static NSString *PlaceholderCellIdentifier = @"PlaceholderCell";
    NSString *CellIdentifier = [NSString stringWithFormat:@"TableViewCell_%d", [indexPath row]];
    /** add a placeholder cell while waiting on table data */
	int row = [self.collectionArray count]/3;
    int col = [self.collectionArray count]%3;
	
    /** create cell when there is no item */
	if (row == 0 && col == 0 && indexPath.row == 0)
	{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PlaceholderCellIdentifier];
        
        if (cell == nil)
		{
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:PlaceholderCellIdentifier] autorelease];   
            cell.detailTextLabel.textAlignment = UITextAlignmentCenter;
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
		cell.detailTextLabel.text = @"Loading … ";
		
		return cell;
    }
	
    RDKCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) 
    {
        int count = [indexPath row] * 3;
        
        NSMutableArray *productsArray = [[NSMutableArray alloc] init]; 
        
        for (int i=0; count < [self.collectionArray count] && i < 3; i++) 
        {
            [productsArray addObject:[self.collectionArray objectAtIndex:count++]];
        }

        cell = [[[RDKCollectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault productsArray:productsArray reuseIdentifier:CellIdentifier] autorelease];
        
        [cell setDelegate:self];
        
        [productsArray release];
    }
    
    /** Leave cells empty if there's no data yet */
//    if (nodeCount > 0)
//	{
//        [cell.icon setImageWithURL:[NSURL URLWithString:newsItem.icon] placeholderImage:nil];
//    }
    
    return cell;
}

#pragma mark - RDKDataManagerDelegate

-(void)getProductsFinished:(id)sender
{
    /** declare array for pass data from data manager */
    NSArray *productsArray = [RDKDataManager share].productsArray;
    
    /** init new array with data from data manager */
    [self.collectionArray removeAllObjects];
    
    /** convert to news array */
    for (int i=0; i<[productsArray count]; i++) 
    {
        /** declare news item */
        RDKProductsItem *productsItem = [[RDKProductsItem alloc] initWithItem:[productsArray objectAtIndex:i]];
        
        /** add news item to news array */
        [self.collectionArray addObject:productsItem];
        
        /** release item */
        [productsItem release];
    }
    
    /** reload data for table view */
    [self.collectionTableView reloadData];
}

#pragma mark -
#pragma mark Private Methods

- (void)pushBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /** set data manager deleagte and get news fron web service */
    [[RDKDataManager share] setDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /** init cell list */
//    cellList = [[NSMutableArray alloc] init];
    
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
    
    /** init image download progress */
    self.collectionArray = [[[NSMutableArray alloc] init] autorelease];
    
    /** set data manager deleagte and get news fron web service */
    [[RDKDataManager share] setDelegate:self];
    [[RDKDataManager share] getProducts];

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
