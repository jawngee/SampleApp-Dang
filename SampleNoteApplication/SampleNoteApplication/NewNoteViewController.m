//
//  NewNoteViewController.m
//  SampleNoteApplication
//
//  Created by Trung Dang on 11/10/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "NewNoteViewController.h"

@implementation NewNoteViewController
//@synthesize noteNumber;
@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"New Note", @"");
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
    [_noteName release];
    [_noteDetail release];
    [__fetchedResultsController release];
    [__managedObjectContext release];
    [super dealloc];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                target:self 
                                                                                action:@selector(insertNewObject)] autorelease];
    self.navigationItem.rightBarButtonItem = addButton;

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

#pragma -
#pragma text field delegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    // Any new character added is passed in as the "text" parameter
    if ([text isEqualToString:@"\n"]) {
        // Be sure to test for equality using the "isEqualToString" message
        [textView resignFirstResponder];
        
        // Return FALSE so that the final '\n' character doesn't get added
        return FALSE;
    }
    // For any other character return TRUE so that the text gets added to the view
    return TRUE;
}

#pragma -
#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (__fetchedResultsController != nil) {
        return __fetchedResultsController;
    }
    
    // Set up the fetched results controller.
    // Create the fetch request for the entity.
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"note_name" ascending:NO] autorelease];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Note"] autorelease];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	    /*
	     Replace this implementation with code to handle the error appropriately.
         
	     abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
	     */
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return __fetchedResultsController;
}  

#pragma mark -
#pragma mark UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	if (buttonIndex == 0) {
        // Create a new instance of the entity managed by the fetched results controller.
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
        NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
        
        // If appropriate, configure the new managed object.
        // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.

        NSDate *today = [NSDate date];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MMMM dd"];
        
        NSString *dateString = [dateFormat stringFromDate:today];
        [dateFormat release];
        
        [newManagedObject setValue:dateString forKey:@"note_date"];
        [newManagedObject setValue:_noteName.text forKey:@"note_name"];
        [newManagedObject setValue:_noteDetail.text forKey:@"note_detail"];
        
        // Save the context.
        NSError *error = nil;
        if (![context save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
        [self.navigationController popToRootViewControllerAnimated:YES];
	}	
}


#pragma -
#pragma class function

- (void)insertNewObject
{
    UIAlertView *__alertView = [[UIAlertView alloc] initWithTitle:nil 
														  message:NSLocalizedString(@"Please enter your note name: \n\n" ,@"") 
														 delegate:self 
												cancelButtonTitle:NSLocalizedString(@"OK", @"") 
												otherButtonTitles:NSLocalizedString(@"Cancel", @""), nil];

//    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(12,40,260,25)];
//    passwordLabel.font = [UIFont systemFontOfSize:16];
//    passwordLabel.textColor = [UIColor whiteColor];
//    passwordLabel.backgroundColor = [UIColor clearColor];
//    passwordLabel.shadowColor = [UIColor blackColor];
//    passwordLabel.shadowOffset = CGSizeMake(0,-1);
//    passwordLabel.textAlignment = UITextAlignmentCenter;
//    passwordLabel.text = @“Account Name”;
//    [passwordAlert addSubview:passwordLabel];
//    
//    UIImageView *passwordImage = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"passwordfield" ofType:@"png"]]];
//    passwordImage.frame = CGRectMake(11,79,262,31);
//    [passwordAlert addSubview:passwordImage];
    
    _noteName = [[UITextField alloc] initWithFrame:CGRectMake(16, 40, 250, 25)];
    _noteName.font = [UIFont systemFontOfSize:18];
    _noteName.backgroundColor = [UIColor whiteColor];
//    passwordField.secureTextEntry = YES;
    _noteName.keyboardAppearance = UIKeyboardAppearanceAlert;
//    passwordField.delegate = self;
    [_noteName becomeFirstResponder];
    [__alertView addSubview:_noteName];
    
//    [__alertView setTransform:CGAffineTransformMakeTranslation(0,109)];
    [__alertView show];
    [__alertView release];
// /    [passwordImage release];
//    [passwordLabel release];

}


@end
