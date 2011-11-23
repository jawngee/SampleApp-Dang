//
//  RDKCustomImage.h
//  jmDiap
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RDKCustomImage : UIImageView 
{
	CGRect originalRect;
	CGFloat ratio;
}

-(void)scaleToFitRect:(CGRect)rect;
-(void)scaleToOriginalRect;
-(float)getRatio;
-(void)centerImage;
-(void)setOffset:(float)xoff:(float)yoff;
-(void)addOffset:(float)xoff:(float)yoff;
-(void)boundOffset;

-(id)initWithName:(NSString*)imagename;

@end
