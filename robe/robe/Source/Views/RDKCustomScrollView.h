//
//  CustomScrollView.h
//  jmDiap
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RDKCustomScrollView : UIScrollView
{
	id maindelegate;
}

@property(retain, nonatomic) id maindelegate;

@end
