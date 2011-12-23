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

@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *headline;
@property (strong, nonatomic) UILabel *subheader;
@property (strong, nonatomic) UILabel *bi_line;
@property (strong, nonatomic) RDKNewsItem *newsItem;

- (id)initWithStyle:(UITableViewCellStyle)style newsItem:(RDKNewsItem *)newsItem reuseIdentifier:(NSString *)reuseIdentifier;

@end
