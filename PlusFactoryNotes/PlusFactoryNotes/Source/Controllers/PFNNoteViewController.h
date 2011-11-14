//
//  PFNNoteViewController.h
//  PlusFactoryNotes
//
//  Created by Jon Gilkison on 11/10/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PFNNote;

@interface PFNNoteViewController : UIViewController {
    IBOutlet UITextView *noteDetail;
}

@property (strong, nonatomic) PFNNote *note;

@end
