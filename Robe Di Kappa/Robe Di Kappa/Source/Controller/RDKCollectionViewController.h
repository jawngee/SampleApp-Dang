//
//  RDKClothesGridViewController.h
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDKCollectionTableViewCell.h"

@class RDKProductListViewController;

@interface RDKCollectionViewController : UIViewController <UITabBarDelegate, UITableViewDataSource, RDKClothesItemTableViewCellDelegate> {
    
    NSMutableArray *cellList;    
}

@property (strong, nonatomic) RDKProductListViewController *productListViewController;

@end
