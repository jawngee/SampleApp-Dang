//
//  ClothesViewController.h
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDKClothesGridViewController;

@interface RDKClothesViewController : UIViewController <UITabBarDelegate, UITableViewDataSource> {
    
    IBOutlet UITableView *clothesTableView;
    UIBarButtonItem *_refreshBarButtonItem;

}

@property (nonatomic, strong) UIBarButtonItem *refreshBarButtonItem;
@property (strong, nonatomic) RDKClothesGridViewController *clothesGridViewController;


@end
