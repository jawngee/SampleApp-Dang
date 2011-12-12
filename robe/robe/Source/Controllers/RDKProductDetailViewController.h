//
//  RDKProductDetailViewController.h
//  robe
//
//  Created by Trung Dang on 12/12/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDKClothesGridViewController;

@interface RDKProductDetailViewController : UIViewController <UITabBarDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *productDetailTableView;
}

@property (strong, nonatomic) RDKClothesGridViewController *clothesGridViewController;


@end
