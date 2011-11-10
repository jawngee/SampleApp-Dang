//
//  OverlayViewController.h
//  SampleNoteApplication
//
//  Created by Trung Dang on 11/10/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;

@interface OverlayViewController : UIViewController {

	MasterViewController *rvController;
}

@property (nonatomic, retain) MasterViewController *rvController;

@end
