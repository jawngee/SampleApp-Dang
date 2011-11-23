//
//  HomeViewController.h
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

/** home view controller */
@interface RDKHomeViewController : UIViewController <UITabBarDelegate, UITableViewDataSource> {
    
    /** home table view */
    IBOutlet UITableView *homeTableView;
}

@end
