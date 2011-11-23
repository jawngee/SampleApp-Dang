//
//  StyledPageControl.m
//  VDC
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKStyledPageControl.h"

@implementation RDKStyledPageControl

-(void)setCurrentPage:(NSInteger)page 
{
	[super setCurrentPage:page];
	
	NSString* imgActive = [[NSBundle mainBundle] pathForResource:@"pagecontrol-active.png" ofType:nil];
	NSString* imgInactive = [[NSBundle mainBundle] pathForResource:@"pagecontrol-unactive.png" ofType:nil];
    
	for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) 
	{
		UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
		if (subviewIndex == page) 
			[subview setImage:[UIImage imageWithContentsOfFile:imgActive]];
		else 
			[subview setImage:[UIImage imageWithContentsOfFile:imgInactive]];
	}
}

-(void)setNumberOfPages:(NSInteger)pages 
{
	[super setNumberOfPages:pages];
	
	NSString* img = [[NSBundle mainBundle] pathForResource:@"pagecontrol-unactive.png" ofType:nil];
    
	for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) 
	{
		UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
		[subview setImage:[UIImage imageWithContentsOfFile:img]];
	}
}



@end
