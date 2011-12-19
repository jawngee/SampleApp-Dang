//
//  RDKProductDetailViewController.h
//  robe
//
//  Created by Trung Dang on 12/12/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDKCollectionViewController;

@interface RDKProductViewController : UIViewController <UITabBarDelegate, UITableViewDataSource>
{
    
}

@property (strong, nonatomic) RDKCollectionViewController *collectionViewController;


@end
