//
//  MasterViewController.h
//  demo
//
//  Created by Trung Dang on 11/9/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class OverlayViewController;

@interface MasterViewController : UITableViewController {
    NSMutableArray *listOfItems;

    NSMutableArray *copyListOfItems;
	IBOutlet UISearchBar *searchBar;
	BOOL searching;
	BOOL letUserSelectRow;
	
	OverlayViewController *ovController;

}

@property (strong, nonatomic) DetailViewController *detailViewController;

- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;


@end
