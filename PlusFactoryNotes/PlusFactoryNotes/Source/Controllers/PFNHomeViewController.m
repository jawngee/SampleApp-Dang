//
//  PFNViewController.m
//  PlusFactoryNotes
//
//  Created by Jon Gilkison on 11/10/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import "PFNHomeViewController.h"
#import "PFNNoteEditViewController.h"

#import "PFNNote.h"
#import "OverlayViewController.h"
#import "PFNNoteViewController.h"

#pragma mark - Private

@interface PFNHomeViewController(Private)

/** Reloads the data */
-(void)reloadData;

/** Called when user clicks on new note */
-(void)newNote:(id)sender;

@end

@implementation PFNHomeViewController
@synthesize noteViewController = _noteViewController;


#pragma mark - Init/Dealloc

-(void)dealloc
{
    [notes release];
    [_noteViewController release];
    
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"Note Taker", @"");
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose 
                                                                                            target:self 
                                                                                            action:@selector(newNote:)] autorelease];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", @"") 
                                                                             style:UIBarButtonItemStyleBordered 
                                                                            target:nil 
                                                                            action:nil];
    
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
	//Add the search bar
//	notesTableView.tableHeaderView = searchBar;
	searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	
	searching = NO;
	letUserSelectRow = YES;

    [self reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self reloadData];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Reload data

-(void)reloadData
{
    if (notes!=nil)
    {
        [notes release];
        notes=nil;
    }
    
    notes=[[PFNNote all] retain];
    
    [notesTableView reloadData];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFNNote *selectedNote = nil;
    
    if(searching) {
        NSString *key=[[copyNotes allKeys] objectAtIndex:[indexPath section]];
        selectedNote=[[copyNotes objectForKey:key] objectAtIndex:[indexPath row]];
    }
	else {
        NSString *key=[[notes allKeys] objectAtIndex:[indexPath section]];
        selectedNote=[[notes objectForKey:key] objectAtIndex:[indexPath row]];
	}

    if (!self.noteViewController) {
        self.noteViewController = [[[PFNNoteViewController alloc] initWithNibName:@"PFNNoteViewController" bundle:nil] autorelease];
    }
    
    self.noteViewController.note=selectedNote;
    [self.navigationController pushViewController:self.noteViewController animated:YES];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (searching) {
        return [[copyNotes allKeys] count];
    } else {
        return [[notes allKeys] count]; 
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(searching) {
		return [[copyNotes allKeys] objectAtIndex:section];;
    } else {
        return [[notes allKeys] objectAtIndex:section];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (searching) {
        NSString *key=[[copyNotes allKeys] objectAtIndex:section];
        
        return [[copyNotes objectForKey:key] count];
    } else {
        NSString *key=[[notes allKeys] objectAtIndex:section];
        
        return [[notes objectForKey:key] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    if(searching) {
        NSString *key=[[copyNotes allKeys] objectAtIndex:[indexPath section]];
        PFNNote *note=[[copyNotes objectForKey:key] objectAtIndex:[indexPath row]];
        cell.textLabel.text = note.title;
    } else {
        NSString *key=[[notes allKeys] objectAtIndex:[indexPath section]];
        PFNNote *note=[[notes objectForKey:key] objectAtIndex:[indexPath row]];
        cell.textLabel.text = note.title;
    }

    return cell;
}

- (NSIndexPath *)tableView :(UITableView *)theTableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if(letUserSelectRow)
		return indexPath;
	else
		return nil;
}

#pragma mark -
#pragma mark Search Bar 

- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
	
	//This method is called again when the user clicks back from the detail view.
	//So the overlay is displayed on the results, which is something we do not want to happen.
	if(searching)
		return;
	
	//Add the overlay view.
	if(ovController == nil)
		ovController = [[OverlayViewController alloc] initWithNibName:@"OverlayView" bundle:[NSBundle mainBundle]];
	
//	CGFloat yaxis = self.navigationController.navigationBar.frame.size.height;
	CGFloat width = self.view.frame.size.width;
	CGFloat height = self.view.frame.size.height;
	
	//Parameters x = origion on x-axis, y = origon on y-axis.
	CGRect frame = CGRectMake(0, 0, width, height);
	ovController.view.frame = frame;	
	ovController.view.backgroundColor = [UIColor grayColor];
	ovController.view.alpha = 0.5;
	
	ovController.rvController = self;
	
	[notesTableView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
	
	searching = YES;
	letUserSelectRow = NO;
	notesTableView.scrollEnabled = NO;
	
	//Add the done button.
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
											   initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
											   target:self action:@selector(doneSearching_Clicked:)] autorelease];
	
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
    
	//Remove all objects first.	
	if([searchText length] > 0) {
		
		[ovController.view removeFromSuperview];
		searching = YES;
		letUserSelectRow = YES;
		notesTableView.scrollEnabled = YES;
		[self searchTableView];
	}
	else {
		
		[notesTableView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
		
		searching = NO;
		letUserSelectRow = NO;
		notesTableView.scrollEnabled = NO;
	}
	
	[notesTableView reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
	
	[self searchTableView];
}

- (void) searchTableView {
	
	NSString *searchText = searchBar.text;
    
    if (copyNotes!=nil)
    {
        [copyNotes release];
        copyNotes=nil;
    }
    
    copyNotes = [[PFNNote find:searchText] retain];
	
}

- (void) doneSearching_Clicked:(id)sender {
	
	searchBar.text = @"";
	[searchBar resignFirstResponder];
	
	letUserSelectRow = YES;
	searching = NO;
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose 
                                                                                            target:self 
                                                                                            action:@selector(newNote:)] autorelease];
	notesTableView.scrollEnabled = YES;
	
	[ovController.view removeFromSuperview];
	[ovController release];
	ovController = nil;
	
	[notesTableView reloadData];
}


#pragma mark - Actions

-(void)newNote:(id)sender
{
    [[self navigationController] pushViewController:[[[PFNNoteEditViewController alloc] initWithNibName:@"PFNNoteEditViewController" bundle:nil] autorelease] animated:YES];
}



@end
