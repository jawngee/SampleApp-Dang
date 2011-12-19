//
//  CustomScrollView.m
//  jmDiap
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKCustomScrollView.h"


@implementation RDKCustomScrollView

@synthesize maindelegate;

- (id) initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) 
	{
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
	//NSLog(@"customscrollview touches began");
	[self.maindelegate touchesBegan:touches withEvent:event];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
	//NSLog(@"customscrollview touches end");
	[self.maindelegate touchesEnded:touches withEvent:event];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
	//NSLog(@"customscrollview touches moved");
	[self.maindelegate touchesMoved:touches withEvent:event];
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event 
{
	//NSLog(@"customscrollview touches cancelled");
	[self.maindelegate touchesCancelled:touches withEvent:event];
}	

- (void)dealloc {
    [super dealloc];
}


@end
