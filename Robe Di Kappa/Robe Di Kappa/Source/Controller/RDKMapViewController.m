//
//  MapViewController.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKMapViewController.h"

#import "RDKMapTableViewCell.h"
#import "RDKLocationViewController.h"
#import "RDKLocationsItem.h"

#define kCustomRowHeight    60.0
#define kCustomRowCount     1

@interface RDKMapViewController ()

- (void)startIconDownload:(RDKLocationsItem *)locationsItem forIndexPath:(NSIndexPath *)indexPath;

@end

@implementation RDKMapViewController
@synthesize locationViewController = _locationViewController;
@synthesize locationsArray = _locationsArray;
@synthesize mapTableView = _mapTableView;
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
    [_locationViewController release];
    [_locationsArray release];
    [_mapTableView release];
    [_imageDownloadsInProgress release];
    [super dealloc];
}

#pragma mark - function class

- (void)refresh:(id)sender
{
}

#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.locationViewController) {
        self.locationViewController = [[[RDKLocationViewController alloc] initWithNibName:@"RDKLocationViewController" bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:self.locationViewController animated:YES];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    NSLog(@"NUMBER OF ROW: %d", [self.locationsArray count]);
    
	int count = [self.locationsArray count];
	
	/** ff there's no data yet, return enough rows to fill the screen */
    if (count == 0)
	{
        return kCustomRowCount;
    }
    
    return count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    int count = [self.locationsArray count];
	
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
    
	RDKMapTableViewCell *__cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (__cell == nil) {
        __cell = [[[RDKMapTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
//    if ([indexPath row] == 0) {
//        [__cell.imageViewCell setImage:[UIImage imageNamed:@"map-cell-image-1.png"]];
//        [__cell.titleLable setText:@"北京东方新天地店"];
//        [__cell.desciptionLable setText:@"开业全场买赠优惠"];
//        [__cell.createTimeLable setText:@"地址：北京东城区东长安街1号东方新天地商场首层第四区AA61B"];
//    }
//    
//    if ([indexPath row] == 1) {
//        [__cell.imageViewCell setImage:[UIImage imageNamed:@"map-cell-image-2.png"]];
//        [__cell.titleLable setText:@"北京国贸店"];
//        [__cell.desciptionLable setText:@""];
//        [__cell.createTimeLable setText:@"地址：北京东城区东长安街1号东方新天地商场首层第四区AA61B"];
//    }
        
	return __cell;
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
