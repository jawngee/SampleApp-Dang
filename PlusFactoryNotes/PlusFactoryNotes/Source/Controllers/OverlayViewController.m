//
//  OverlayViewController.m
//  SampleNoteApplication
//
//  Created by Trung Dang on 11/10/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "OverlayViewController.h"
#import "PFNHomeViewController.h"

@implementation OverlayViewController

@synthesize rvController;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[rvController doneSearching_Clicked:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[rvController release];
    [super dealloc];
}


@end
