//
//  HomeViewController.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKHomeViewController.h"

#import "RDKHomeTableViewCell.h"
#import "RDKNewsItem.h"

#define kCustomRowHeight    60.0
#define kCustomRowCount     1

@interface RDKHomeViewController ()

- (void)startIconDownload:(RDKNewsItem *)newsItem forIndexPath:(NSIndexPath *)indexPath;

@end


@implementation RDKHomeViewController
@synthesize newsArray = _newsArray;
@synthesize homeTableView = _homeTableView;
@synthesize imageDownloadsInProgress = _imageDownloadsInProgress;

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
    
    /** Release any cached data, images, etc that aren't in use. */
    NSArray *allDownloads = [self.imageDownloadsInProgress allValues];
    [allDownloads makeObjectsPerformSelector:@selector(cancelDownload)];
}

- (void)dealloc
{
    [_newsArray release];
    [_homeTableView release];
    [_imageDownloadsInProgress release];
    [super dealloc];
}

#pragma mark - function class

- (void)refresh:(id)sender
{
}

#pragma mark -
#pragma mark Table view data source

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
//	static NSString *CellIdentifier = @"LazyTableCell";
    static NSString *PlaceholderCellIdentifier = @"PlaceholderCell";
    NSString *CellIdentifier = [NSString stringWithFormat:@"TableViewCell_%d", [indexPath row]];
    
    // add a placeholder cell while waiting on table data
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

    if (cell == nil) {
        
        cell = [[[RDKHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault newsItem:newsItem reuseIdentifier:CellIdentifier] autorelease];
    }
    
    /** Leave cells empty if there's no data yet */
    if (nodeCount > 0)
	{
        /** Only load cached images; defer new downloads until scrolling ends */
        if (!newsItem.iconImage)
        {
            if (self.homeTableView.dragging == NO && self.homeTableView.decelerating == NO)
            {
                [self startIconDownload:newsItem forIndexPath:indexPath];
            }
            /** if a download is deferred or in progress, return a placeholder image */
            cell.imageView.image = [UIImage imageNamed:@"home-placeholder.png"];                
        }
        else
        {
            cell.imageViewCell.image = newsItem.iconImage;
        }
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
    for (int i=0; i<[newsArray count]; i++) {
        NSDictionary *newsDictinary = [newsArray objectAtIndex:i];
        RDKNewsItem *newsItem = [[RDKNewsItem alloc] initWithItem:newsDictinary];
        [self.newsArray addObject:newsItem];
        [newsItem release];
    }
    
    /** reload data for table view */
    [self.homeTableView reloadData];
}

-(void)getLocationsFinished:(id)sender
{
    NSLog(@"DOING NOTHING");
}

#pragma mark -
#pragma mark Table cell image support

- (void)startIconDownload:(RDKNewsItem *)newsItem forIndexPath:(NSIndexPath *)indexPath
{
    IconDownloader *iconDownloader = [self.imageDownloadsInProgress objectForKey:indexPath];
    if (iconDownloader == nil) 
    {
        iconDownloader = [[IconDownloader alloc] init];
        iconDownloader.newsItem = newsItem;
        iconDownloader.indexPathInTableView = indexPath;
        iconDownloader.delegate = self;
        [self.imageDownloadsInProgress setObject:iconDownloader forKey:indexPath];
        [iconDownloader startDownload];
        [iconDownloader release];   
    }
}

// this method is used in case the user scrolled into a set of cells that don't have their app icons yet
- (void)loadImagesForOnscreenRows
{
    if ([self.newsArray count] > 0)
    {
        NSArray *visiblePaths = [self.homeTableView indexPathsForVisibleRows];
        for (NSIndexPath *indexPath in visiblePaths)
        {
            RDKNewsItem *newsItem = [self.newsArray objectAtIndex:[indexPath row]];

            if (!newsItem.iconImage) // avoid the app icon download if the app already has an icon
            {
                [self startIconDownload:newsItem forIndexPath:indexPath];
            }
        }
    }
}

// called by our ImageDownloader when an icon is ready to be displayed
- (void)appImageDidLoad:(NSIndexPath *)indexPath
{
    IconDownloader *iconDownloader = [self.imageDownloadsInProgress objectForKey:indexPath];
    if (iconDownloader != nil)
    {
        RDKHomeTableViewCell *cell = (RDKHomeTableViewCell *) [self.homeTableView cellForRowAtIndexPath:iconDownloader.indexPathInTableView];
        
        // Display the newly loaded image
        cell.imageViewCell.image = iconDownloader.newsItem.iconImage;
    }
}


#pragma mark -
#pragma mark Deferred image loading (UIScrollViewDelegate)

// Load images for all onscreen rows when scrolling is finished
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
	{
        [self loadImagesForOnscreenRows];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self loadImagesForOnscreenRows];
}


#pragma mark - View lifecycle

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
    self.imageDownloadsInProgress = [NSMutableDictionary dictionary];
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
