//
//  MasterViewController.h
//  CoolTable
//
//  Created by Trung Dang on 11/15/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController {
    
    NSMutableArray *_thingsToLearn;
    NSMutableArray *_thingsLearned;
    
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (copy) NSMutableArray *thingsToLearn;
@property (copy) NSMutableArray *thingsLearned;

@end
