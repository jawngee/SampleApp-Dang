//
//  PFNNoteEditViewController.m
//  PlusFactoryNotes
//
//  Created by Jon Gilkison on 11/10/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import "PFNNoteEditViewController.h"

#import "PFNNote.h"

@implementation PFNNoteEditViewController

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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = NSLocalizedString(@"New Note", @"");
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                            target:self 
                                                                                            action:@selector(saveNote:)] autorelease];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", @"") 
                                                                             style:UIBarButtonItemStyleBordered 
                                                                            target:nil 
                                                                            action:nil];

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

#pragma mark - Actions

-(void)saveNote:(id)sender
{
//    [[self navigationController] pushViewController:[[[PFNNoteEditViewController alloc] initWithNibName:@"PFNNoteEditViewController" 
//                                                                                                 bundle:nil] autorelease] 
//                                           animated:YES];
    
    if (![@"" isEqualToString:[noteDetail text]]) {
        PFNNote *newNote = [[PFNNote alloc] initWithBody:[noteDetail text]];
        [newNote save];
        
        [self.navigationController popToRootViewControllerAnimated:YES];

    }
}


@end
