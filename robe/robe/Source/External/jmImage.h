//
//  jmImage.h
//  jmDiap
//
//  Created by Julien MEYER on 10/07/10.
//  Copyright 2010 jmApp.com All rights reserved.
//

#import <UIKit/UIKit.h>


@interface jmImage : UIImageView 
{
	CGRect		originalRect;
	CGFloat		ratio;
}

- (void)		scaleToFitRect:(CGRect)rect;
- (void)		scaleToOriginalRect;
- (float)		getRatio;
- (void)		centerImage;
- (void)		setOffset:(float)xoff:(float)yoff;
- (void)		addOffset:(float)xoff:(float)yoff;
- (void)		boundOffset;

- (id) initWithName:(NSString*)imagename;

@end
