//
//  jmImage.m
//  jmDiap
//
//  Created by Julien MEYER on 10/07/10.
//  Copyright 2010 jmApp.com All rights reserved.
//

#import "jmImage.h"


@implementation jmImage


- (id) initWithName:(NSString*)imagename 
{
	if(self = [super initWithImage:[UIImage imageNamed:imagename]])
	{
		[self setUserInteractionEnabled:NO];
		
		originalRect = self.frame;
		ratio = self.frame.size.width / self.frame.size.height;
	}
    return self;
}

- (void) scaleToFitRect:(CGRect)rect
{
	CGFloat newwidth, newheight;
	if(ratio >= 1.0) 
    {
		newwidth = rect.size.width;
		newheight = rect.size.width/ratio;
	}
	else 
    {
		newwidth = rect.size.height*ratio;
		newheight = rect.size.height;
	}
	
//	CGRect fullScreenRect = [[UIScreen mainScreen] applicationFrame];
//	CGFloat xoffset = (fullScreenRect.size.width - newwidth) / 2.0;
//	CGFloat yoffset = (fullScreenRect.size.height - newheight) / 2.0;
	
//	self.frame = CGRectMake(xoffset, yoffset, newwidth, newheight);
    self.frame = CGRectMake(0, 0, newwidth, newheight);
}

- (void) centerImage
{
//	CGRect fullScreenRect = [[UIScreen mainScreen] applicationFrame];
//	CGFloat xoffset = (fullScreenRect.size.width - self.frame.size.width) / 2.0;
//	CGFloat yoffset = (fullScreenRect.size.height - self.frame.size.height) / 2.0;
//	self.frame = CGRectMake(xoffset, yoffset, self.frame.size.width, self.frame.size.height);
    self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

- (void) scaleToOriginalRect
{
//	CGRect fullScreenRect = [[UIScreen mainScreen] applicationFrame];
//	CGFloat xoffset = (fullScreenRect.size.width - originalRect.size.width) / 2.0;
//	CGFloat yoffset = (fullScreenRect.size.height - originalRect.size.height) / 2.0;
//	self.frame = CGRectMake(xoffset, yoffset, originalRect.size.width, originalRect.size.height);
    self.frame = CGRectMake(0, 0, originalRect.size.width, originalRect.size.height);
}

- (void) setOffset:(float)xoff:(float)yoff
{
	CGRect r = self.frame;
	r.origin.x = xoff;
	r.origin.y = yoff;
	self.frame = r;
}

- (void) addOffset:(float)xoff:(float)yoff
{
	CGRect r = self.frame;
	r.origin.x += xoff;
	r.origin.y += yoff;
	self.frame = r;
	[self boundOffset];
}

- (void) boundOffset
{
	CGRect r = self.frame;
	CGRect fullScreenRect = [[UIScreen mainScreen] applicationFrame];
	if(fullScreenRect.size.width > r.size.width) 
    {
		if(r.origin.x < 0)
        {
			r.origin.x = 0;
		}
		else if(r.origin.x > fullScreenRect.size.width - r.size.width) 
        {
			r.origin.x = fullScreenRect.size.width - r.size.width;
		}
	}
	else 
    {
		if(r.origin.x > 0) 
        {
			r.origin.x = 0;
		}
		else if(r.origin.x < fullScreenRect.size.width - r.size.width) 
        {
			r.origin.x = fullScreenRect.size.width - r.size.width;
		}
	}
	if(fullScreenRect.size.height > r.size.height) 
    {
		if(r.origin.y < 0) 
        {
			r.origin.y = 0;
		}
		else if(r.origin.y > fullScreenRect.size.height - r.size.height) 
        {
			r.origin.y = fullScreenRect.size.height - r.size.height;
		}
	}
	else 
    {
		if(r.origin.y > 0) 
        {
			r.origin.y = 0;
		}
		else if(r.origin.y < fullScreenRect.size.height - r.size.height) 
        {
			r.origin.y = fullScreenRect.size.height - r.size.height;
		}
	}
	self.frame = r;
}

- (float) getRatio 
{
	return ratio;
}

- (void) dealloc 
{
    [super dealloc];
}


@end
