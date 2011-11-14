//
//  OverlayViewController.h
//  SampleNoteApplication
//
//  Created by Trung Dang on 11/10/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PFNHomeViewController;

@interface OverlayViewController : UIViewController {

	PFNHomeViewController *rvController;
}

@property (nonatomic, retain) PFNHomeViewController *rvController;

@end
