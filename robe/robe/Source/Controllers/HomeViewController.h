//
//  HomeViewController.h
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

/** What is this? */
@interface HomeViewController : UIViewController <UITabBarDelegate, UITableViewDataSource> {
    
    /** What is this */
    IBOutlet UITableView *homeTableView;
}

@end
