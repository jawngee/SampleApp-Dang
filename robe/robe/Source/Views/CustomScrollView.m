//
//  CustomScrollView.m
//  jmDiap
//
//  Created by Julien MEYER on 11/07/10.
//  Copyright 2010 jmApp.com All rights reserved.
//

#import "CustomScrollView.h"


@implementation CustomScrollView

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
