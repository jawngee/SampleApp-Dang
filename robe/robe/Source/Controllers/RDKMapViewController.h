//
//  MapViewController.h
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDKSubMapViewController;

@interface RDKMapViewController : UIViewController <UITabBarDelegate, UITableViewDataSource> {
    
    IBOutlet UITableView *mapTableView;
}

@property (strong, nonatomic) RDKSubMapViewController *subMapViewController;


@end
