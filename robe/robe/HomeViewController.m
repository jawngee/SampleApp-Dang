//
//  HomeViewController.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomTabBarItem.h"
#import "HomeTableViewCell.h"

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.title = NSLocalizedString(@"First", @"First");
//        self.tabBarItem.image = [UIImage imageNamed:@"home-icon.png"];
//        self.tabBarItem.title = [NSString stringWithString:@"新闻"];
        
        CustomTabBarItem *customTabBarItem = [[CustomTabBarItem alloc] initWithTitle:nil image:nil tag:0];
        
        customTabBarItem.customHighlightedImage = [UIImage imageNamed:@"selected-home-icon.png"];
        customTabBarItem.customStdImage = [UIImage imageNamed:@"unselected-home-icon.png"];
        
        self.tabBarItem = customTabBarItem;
        
        UIEdgeInsets insets = UIEdgeInsetsMake(8, 0, -8, 0);
        [self.tabBarItem setImageInsets:insets];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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
	return 3;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//	return @"";
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	return 122;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"TableViewCell";
    
	HomeTableViewCell *__cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (__cell == nil) {
        __cell = [[[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if ([indexPath row] == 0) {
        __cell.imageViewCell.image = [UIImage imageNamed:@"cell-image-1.png"];
    }
    
    if ([indexPath row] == 1) {
        __cell.imageViewCell.image = [UIImage imageNamed:@"cell-image-2.png"];
    }
    
    if ([indexPath row] == 2) {
        __cell.imageViewCell.image = [UIImage imageNamed:@"cell-image-3.png"];
    }
		
	return __cell;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
	UIImageView *refeshImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"refresh-button.png"]];
	UIBarButtonItem *refreshBarButton = [[UIBarButtonItem alloc] initWithCustomView:refeshImageView];
    
//    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh-button.png"] 
//                                                                      style:UIBarButtonSystemItemDone target:self 
//                                                                     action:@selector(refresh:)];
    self.navigationItem.rightBarButtonItem = refreshBarButton;

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
