//
//  RDKClothesGridViewController.h
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RDKCollectionTableViewCell.h"
#import "RDKDataManager.h"

@class RDKProductListViewController;

@interface RDKCollectionViewController : UIViewController <UITabBarDelegate, UITableViewDataSource, RDKCollectionTableViewCellDelegate, RDKDataManagerDelegate> 

@property (strong, nonatomic) RDKProductListViewController *productListViewController;
@property (strong, nonatomic) IBOutlet UITableView *collectionTableView;
@property (strong, nonatomic) NSMutableArray *collectionArray;

@end
