//
//  HomeViewController.h
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IconDownloader.h"
#import "RDKDataManager.h"

/** home view controller */
@interface RDKHomeViewController : UIViewController <UITabBarDelegate, UITableViewDataSource, UIScrollViewDelegate, RDKDataManagerDelegate, IconDownloaderDelegate> 

@property (strong, nonatomic) NSMutableArray *newsArray;
@property (strong, nonatomic) NSMutableDictionary *imageDownloadsInProgress;
@property (strong, nonatomic) IBOutlet UITableView *homeTableView;

- (void)appImageDidLoad:(NSIndexPath *)indexPath;

@end
