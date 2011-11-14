//
//  PFNNoteViewController.m
//  PlusFactoryNotes
//
//  Created by Jon Gilkison on 11/10/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import "PFNNoteViewController.h"

#import "PFNNote.h"
#import "PFNNoteEditViewController.h"

@implementation PFNNoteViewController
@synthesize note;

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [noteDetail setText:[note body]];
    
    [self.navigationItem setTitle:[note.body substringToIndex:MIN(15,[note.body length])]];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

-(IBAction)deleteNote:(id)sender
{
    [self.note remove];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(IBAction)addNote:(id)sender
{
    [[self navigationController] pushViewController:[[[PFNNoteEditViewController alloc] initWithNibName:@"PFNNoteEditViewController" bundle:nil] autorelease] animated:YES]; 
}


@end
