//
//  ViewController.m
//  CoolButton
//
//  Created by Trung Dang on 11/15/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "ViewController.h"

#import "CoolButton.h"


@implementation ViewController
@synthesize button = _button;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.button = nil;
}

- (void)dealloc
{
    [_button release];
    _button = nil;
    
    [super dealloc];
}

- (IBAction)hueValueChanged:(id)sender {
    
    UISlider *slider = (UISlider *)sender;
    _button.hue = slider.value;
    
}

- (IBAction)saturationValueChanged:(id)sender {
    
    UISlider *slider = (UISlider *)sender;
    _button.saturation = slider.value;
    
}

- (IBAction)brightnessValueChanged:(id)sender {
    
    UISlider *slider = (UISlider *)sender;
    _button.brightness = slider.value;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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

@end
