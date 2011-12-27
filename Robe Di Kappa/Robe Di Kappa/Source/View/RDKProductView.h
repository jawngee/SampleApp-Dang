//
//  RDKRectangleView.h
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/27/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDKProductsItem;

@protocol RDKProductViewDelegate

- (void)selectProduct:(id)sender;

@end

@interface RDKProductView : UIView

@property (strong, nonatomic) RDKProductsItem *productsItem;
@property (strong, nonatomic) NSObject <RDKProductViewDelegate> *delegate;

- (id)initWithFrame:(CGRect)frame productsItem:(RDKProductsItem *)productsItem;

@end
