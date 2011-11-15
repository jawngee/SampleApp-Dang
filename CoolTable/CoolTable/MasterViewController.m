//
//  MasterViewController.m
//  CoolTable
//
//  Created by Trung Dang on 11/15/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "CustomCellBackground.h"

#import "CustomHeader.h"
#import "CustomFooter.h"


@implementation MasterViewController
@synthesize thingsToLearn = _thingsToLearn;
@synthesize thingsLearned = _thingsLearned;

@synthesize detailViewController = _detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Core Graphic", @"Master");
    }
    return self;
}
							
- (void)dealloc
{
    [_thingsToLearn release];
    _thingsToLearn = nil;
    [_thingsLearned release];
    _thingsLearned = nil;
    
    [_detailViewController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_bg.jpg"]];
    backgroundImage.frame = [[UIScreen mainScreen] bounds];

//    [self.tableView setBackgroundView:backgroundImage];
    [self.tableView setBackgroundColor:[UIColor blackColor]];
    
    self.thingsToLearn = [NSMutableArray arrayWithObjects:@"Drawing Rects", @"Drawing Gradients", @"Drawing Arcs", nil];
    self.thingsLearned = [NSMutableArray arrayWithObjects:@"Table Views", @"UIKit", @"Objective-C", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.thingsToLearn = nil;
    self.thingsLearned = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return YES;
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return _thingsToLearn.count;
    } else {
        return _thingsLearned.count;
    }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
        cell.backgroundView = [[[CustomCellBackground alloc] init] autorelease];
        cell.selectedBackgroundView = [[[CustomCellBackground alloc] init] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        ((CustomCellBackground *)cell.selectedBackgroundView).selected = YES;

    }

    // Configure the cell.
    NSString *entry;
    
    if (indexPath.section == 0) {
        entry = [_thingsToLearn objectAtIndex:indexPath.row];
        
        ((CustomCellBackground *)cell.backgroundView).lastCell = indexPath.row == _thingsToLearn.count - 1;
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = indexPath.row == _thingsToLearn.count - 1;
        
    } else {
        entry = [_thingsLearned objectAtIndex:indexPath.row];
        
        ((CustomCellBackground *)cell.backgroundView).lastCell = indexPath.row == _thingsLearned.count - 1;
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = indexPath.row == _thingsLearned.count - 1;
    }        
    
    cell.textLabel.highlightedTextColor = [UIColor blackColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = entry;
    
    return cell;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Things We'll Learn";
    } else {
        return @"Things Already Covered";
    }
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    CustomHeader *header = [[[CustomHeader alloc] init] autorelease]; 
    header.titleLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    if (section == 1) {
        header.lightColor = [UIColor colorWithRed:147.0/255.0 green:105.0/255.0 blue:216.0/255.0 alpha:1.0];
        header.darkColor = [UIColor colorWithRed:72.0/255.0 green:22.0/255.0 blue:137.0/255.0 alpha:1.0];
    }
    
    return header;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[[CustomFooter alloc] init] autorelease];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil] autorelease];
    }
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
