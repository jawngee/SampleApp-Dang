//
//  RDKClothesGridViewController.m
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKClothesGridViewController.h"

#import "RDKClothesItemTableViewCell.h"

@implementation RDKClothesGridViewController

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

#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did selected row");
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

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//	return @"";
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	return 123;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//	static NSString *CellIdentifier = @"TableViewCell";
    NSString *CellIdentifier = [NSString stringWithFormat:@"TableViewCell_%d", [indexPath row]];
    
	RDKClothesItemTableViewCell *__cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (__cell == nil) {
        __cell = [[[RDKClothesItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
        __cell.cellList = cellList;
        [cellList addObject:__cell];
        
    }
    
    if ([indexPath row] == 0) {
        __cell.imageViewCell_1.image = [UIImage imageNamed:@"clothes-gridview-cell-image-1.png"];
        __cell.imageViewCell_2.image = [UIImage imageNamed:@"clothes-gridview-cell-image-2.png"];
        __cell.imageViewCell_3.image = [UIImage imageNamed:@"clothes-gridview-cell-image-3.png"];        
    }
    
    if ([indexPath row] == 1) {
        __cell.imageViewCell_1.image = [UIImage imageNamed:@"clothes-gridview-cell-image-3.png"];
        __cell.imageViewCell_2.image = [UIImage imageNamed:@"clothes-gridview-cell-image-1.png"];
        __cell.imageViewCell_3.image = [UIImage imageNamed:@"clothes-gridview-cell-image-2.png"];        
    }
    
    if ([indexPath row] == 2) {
        __cell.imageViewCell_1.image = [UIImage imageNamed:@"clothes-gridview-cell-image-2.png"];
        __cell.imageViewCell_2.image = [UIImage imageNamed:@"clothes-gridview-cell-image-1.png"];
        __cell.imageViewCell_3.image = [UIImage imageNamed:@"clothes-gridview-cell-image-3.png"];        
    }
    
    if ([indexPath row] == 3) {
        __cell.imageViewCell_1.image = [UIImage imageNamed:@"clothes-gridview-cell-image-3.png"];
        __cell.imageViewCell_2.image = [UIImage imageNamed:@"clothes-gridview-cell-image-2.png"];
        __cell.imageViewCell_3.image = [UIImage imageNamed:@"clothes-gridview-cell-image-1.png"];        
    }

    if ([indexPath row] == 4) {
        __cell.imageViewCell_1.image = [UIImage imageNamed:@"clothes-gridview-cell-image-1.png"];
        __cell.imageViewCell_2.image = [UIImage imageNamed:@"clothes-gridview-cell-image-3.png"];
//        __cell.imageViewCell_3.image = [UIImage imageNamed:@"clothes-gridview-cell-image-2.png"];        
    }

    
	return __cell;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    cellList = [[NSMutableArray alloc] init];
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
