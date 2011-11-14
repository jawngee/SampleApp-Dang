//
//  PFNViewController.h
//  PlusFactoryNotes
//
//  Created by Jon Gilkison on 11/10/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OverlayViewController;
@class PFNNoteViewController;

@interface PFNHomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
    NSDictionary *notes;
	NSDictionary *copyNotes;
        
	BOOL searching;
	BOOL letUserSelectRow;
	
	OverlayViewController *ovController;

    IBOutlet UITableView *notesTableView;
    IBOutlet UISearchBar *searchBar;

}

@property (strong, nonatomic) PFNNoteViewController *noteViewController;

- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;

@end
