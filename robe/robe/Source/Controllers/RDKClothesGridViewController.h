//
//  RDKClothesGridViewController.h
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDKClothesItemTableViewCell.h"

@class RDKClothesDetailViewController;

@interface RDKClothesGridViewController : UIViewController <UITabBarDelegate, UITableViewDataSource, RDKClothesItemTableViewCellDelegate> {
    
    IBOutlet UITableView *clothesItemTableView;
    NSMutableArray *cellList;
    
}

@property (strong, nonatomic) RDKClothesDetailViewController *clothesDetailViewController;

@end
