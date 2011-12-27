//
//  RDKClothesItemTableViewCell.h
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RDKProductView.h"

@class RDKProductsItem;

@protocol RDKCollectionTableViewCellDelegate

- (void)selectProduct:(id)sender;

@end

@interface RDKCollectionTableViewCell : UITableViewCell <RDKProductViewDelegate>

@property (strong, nonatomic) NSMutableArray *productsArray;
@property (strong, nonatomic) NSObject <RDKCollectionTableViewCellDelegate> *delegate;

- (id)initWithStyle:(UITableViewCellStyle)style productsArray:(NSMutableArray *)productsArray reuseIdentifier:(NSString *)reuseIdentifier;

@end
