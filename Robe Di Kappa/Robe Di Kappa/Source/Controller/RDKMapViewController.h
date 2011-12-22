//
//  MapViewController.h
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IconDownloader.h"
#import "RDKDataManager.h"

@class RDKLocationViewController;

@interface RDKMapViewController : UIViewController <UITabBarDelegate, UITableViewDataSource, UIScrollViewDelegate, RDKDataManagerDelegate, IconDownloaderDelegate> 


@property (strong, nonatomic) NSMutableArray *locationsArray;
@property (strong, nonatomic) NSMutableDictionary *imageDownloadsInProgress;
@property (strong, nonatomic) IBOutlet UITableView *mapTableView;
@property (strong, nonatomic) RDKLocationViewController *locationViewController;

- (void)appImageDidLoad:(NSIndexPath *)indexPath;


@end
