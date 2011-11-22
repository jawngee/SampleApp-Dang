//
//  CustomScrollView.h
//  jmDiap
//
//  Created by Julien MEYER on 11/07/10.
//  Copyright 2010 jmApp.com All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomScrollView : UIScrollView
{
	id maindelegate;
}

@property(retain, nonatomic) id maindelegate;

@end
