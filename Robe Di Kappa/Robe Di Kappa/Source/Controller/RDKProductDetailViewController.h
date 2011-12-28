//
//  RDKClothesDetailViewController.h
//  robe
//
//  Created by Trung Dang on 12/1/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDKProductsItem;

@interface RDKProductDetailViewController : UIViewController

@property (strong, nonatomic) UIImageView *productImageView;
@property (strong, nonatomic) RDKProductsItem *productsItem;
@property (strong, nonatomic) NSMutableArray *thumbArray;

@end
