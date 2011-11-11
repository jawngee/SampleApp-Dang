//
//  DetailViewController.h
//  SampleNoteApplication
//
//  Created by Trung Dang on 11/10/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class NewNoteViewController;

@interface DetailViewController : UIViewController <NSFetchedResultsControllerDelegate, UIAlertViewDelegate> {
    
}

//@property (nonatomic) int noteNumber;
@property (strong, nonatomic) NSManagedObject *deleteNote;
@property (strong, nonatomic) NSString *nameNote;
@property (strong, nonatomic) NSString *detailNote;

//@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UITextView *noteDetailTextView;
@property (strong, nonatomic) NewNoteViewController *addNoteViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)deleteNote:(id)sender;
- (IBAction)addNewNote:(id)sender;

@end
