//
//  ViewController.h
//  CoolButton
//
//  Created by Trung Dang on 11/15/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoolButton;

@interface ViewController : UIViewController {
    CoolButton *_button;
}

@property (retain) IBOutlet CoolButton *button;

- (IBAction)hueValueChanged:(id)sender;
- (IBAction)saturationValueChanged:(id)sender;
- (IBAction)brightnessValueChanged:(id)sender;

@end
