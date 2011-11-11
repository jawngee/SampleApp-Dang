//
//  MasterViewController.h
//  SampleNoteApplication
//
//  Created by Trung Dang on 11/10/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class DetailViewController;
@class OverlayViewController;
@class NewNoteViewController;

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
    
    NSMutableArray *listOfItems;
    NSMutableArray *listDate;
	NSMutableArray *copyListOfItems;
    
	IBOutlet UISearchBar *searchBar;
    
	BOOL searching;
	BOOL letUserSelectRow;
	
	OverlayViewController *ovController;

}

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NewNoteViewController *addNoteViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;


@end
