//
//  StyledPageControl.m
//  VDC
//
//  Created by Julien MEYER on 1/29/10.
//  Copyright 2010 jmApp.com All rights reserved.
//

#import "StyledPageControl.h"

@implementation StyledPageControl

- (void) setCurrentPage:(NSInteger)page {
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

- (void) setNumberOfPages:(NSInteger)pages 
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
