//
//  HomeViewController.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKHomeViewController.h"

#import "UIImageView+WebCache.h"
#import "RDKHomeTableViewCell.h"
#import "RDKNewsItem.h"

#define kCustomRowHeight    60.0
#define kCustomRowCount     1

@implementation RDKHomeViewController
@synthesize newsArray = _newsArray;
@synthesize homeTableView = _homeTableView;

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
    /** Releases the view if it doesn't have a superview. */
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [_newsArray release];
    [_homeTableView release];
    [super dealloc];
}

#pragma mark - function class

- (void)refresh:(id)sender
{
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    NSLog(@"NUMBER OF ROW: %d", [self.newsArray count]);
    
	int count = [self.newsArray count];
	
	/** ff there's no data yet, return enough rows to fill the screen */
    if (count == 0)
	{
        return kCustomRowCount;
    }
    
    return count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    int count = [self.newsArray count];
	
	/** ff there's no data yet, return enough rows to fill the screen */
    if (count == 0)
	{
        return kCustomRowHeight;
    }
    
    return 123;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"TableViewCell";
    static NSString *PlaceholderCellIdentifier = @"PlaceholderCell";
    
    /** add a placeholder cell while waiting on table data */
    int nodeCount = [self.newsArray count];
	
    /** create cell when there is no item */
	if (nodeCount == 0 && indexPath.row == 0)
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
	
    RDKHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    RDKNewsItem *newsItem = [self.newsArray objectAtIndex:[indexPath row]];

    if (cell == nil) 
    {
        cell = [[[RDKHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault newsItem:newsItem reuseIdentifier:CellIdentifier] autorelease];
    }
    
    /** Leave cells empty if there's no data yet */
    if (nodeCount > 0)
	{
        [cell.icon setImageWithURL:[NSURL URLWithString:newsItem.icon] placeholderImage:nil];
    }
		
    return cell;
}

#pragma mark - RDKDataManagerDelegate

-(void)getNewsFinished:(id)sender
{
    /** declare array for pass data from data manager */
    NSArray *newsArray = [RDKDataManager share].newsArray;
    
    /** init new array with data from data manager */
    [self.newsArray removeAllObjects];
    
    /** convert to news array */
    for (int i=0; i<[newsArray count]; i++) 
    {
        /** declare news item */
        RDKNewsItem *newsItem = [[RDKNewsItem alloc] initWithItem:[newsArray objectAtIndex:i]];
        
        /** add news item to news array */
        [self.newsArray addObject:newsItem];
        
        /** release item */
        [newsItem release];
    }
    
    /** reload data for table view */
    [self.homeTableView reloadData];
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
    
    UIImage *refreshImage = [UIImage imageNamed:@"global-refresh-button.png"];
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshButton setImage:refreshImage forState:UIControlStateNormal];
    [refreshButton setFrame:CGRectMake(0.0, 0.0, refreshImage.size.width, refreshImage.size.height)];
    [refreshButton addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];
    [refreshButton setContentEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
    
    UIBarButtonItem *refreshBarButton = [[UIBarButtonItem alloc] initWithCustomView:refreshButton];
    self.navigationItem.rightBarButtonItem = refreshBarButton;
    [refreshBarButton release];
    
    /** init image download progress */
    self.newsArray = [[[NSMutableArray alloc] init] autorelease];
    
    /** set data manager deleagte and get news fron web service */
    [[RDKDataManager share] setDelegate:self];
    [[RDKDataManager share] getNews];
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
