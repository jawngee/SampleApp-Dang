//
//  NewNoteViewController.h
//  SampleNoteApplication
//
//  Created by Trung Dang on 11/10/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface NewNoteViewController : UIViewController <NSFetchedResultsControllerDelegate> {
    
    IBOutlet UITextView *_noteDetail; 
}


@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
