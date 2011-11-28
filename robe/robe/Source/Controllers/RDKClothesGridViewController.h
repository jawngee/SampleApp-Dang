//
//  RDKClothesGridViewController.h
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDKClothesGridViewController : UIViewController <UITabBarDelegate, UITableViewDataSource> {
    
    IBOutlet UITableView *clothesItemTableView;
    NSMutableArray *cellList;
}

@end
