//
//  HomeViewController.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKHomeViewController.h"
#import "RDKHomeTableViewCell.h"

@implementation RDKHomeViewController

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
    [homeTableView release];
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
	return 3;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//	return @"";
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	return 123;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"TableViewCell";
    
	RDKHomeTableViewCell *__cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (__cell == nil) {
        __cell = [[[RDKHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if ([indexPath row] == 0) {
        __cell.imageViewCell.image = [UIImage imageNamed:@"cell-image-1.png"];
        __cell.titleLable.text = @"古罗马新创世纪运动与时装的超现实演绎";
        __cell.desciptionLable.text = @"— RDK 2011春夏新品静态展";
        __cell.createTimeLable.text = @"星期二,七月 19th, 2011";
    }
    
    if ([indexPath row] == 1) {
        __cell.imageViewCell.image = [UIImage imageNamed:@"cell-image-2.png"];
        __cell.titleLable.text = @"古罗马新创世纪运动与时装的超现实演绎";
        __cell.desciptionLable.text = @"— RDK 2011春夏新品静态展";
        __cell.createTimeLable.text = @"星期二,七月 19th, 2011";
    }
    
    if ([indexPath row] == 2) {
        __cell.imageViewCell.image = [UIImage imageNamed:@"cell-image-3.png"];
        __cell.titleLable.text = @"古罗马新创世纪运动与时装的超现实演绎";
        __cell.desciptionLable.text = @"— RDK 2011春夏新品静态展";
        __cell.createTimeLable.text = @"星期二,七月 19th, 2011";
    }
		
	return __cell;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
    homeTableView = nil;
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
