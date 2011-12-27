//
//  RDKProductListViewController.h
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/19/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDKProductListViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) NSMutableArray *productsArray;
@property (strong, nonatomic) NSMutableArray *productDetailViewArray;

@end
