//
//  RDKCustomNavigationController.h
//  robe
//
//  Created by Trung Dang on 11/28/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDKCustomNavigationController : UINavigationController {
    
    UIBarButtonItem *_refreshBarButtonItem;
}

@property (nonatomic, strong) UIBarButtonItem *refreshBarButtonItem;

@end
