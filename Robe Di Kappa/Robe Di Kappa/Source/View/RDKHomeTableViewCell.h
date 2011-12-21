//
//  HomeTableViewCell.h
//  robe
//
//  Created by Trung Dang on 11/18/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDKNewsItem;

@interface RDKHomeTableViewCell : UITableViewCell 

@property (strong, nonatomic) UIImageView *imageViewCell;
@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UILabel *desciptionLable;
@property (strong, nonatomic) UILabel *createTimeLable;
@property (strong, nonatomic) RDKNewsItem *newsItem;

- (id)initWithStyle:(UITableViewCellStyle)style newsItem:(RDKNewsItem *)newsItem reuseIdentifier:(NSString *)reuseIdentifier;

@end
