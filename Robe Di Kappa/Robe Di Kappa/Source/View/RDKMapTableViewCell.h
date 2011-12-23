//
//  RDKMapTableViewCell.h
//  robe
//
//  Created by Trung Dang on 12/6/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDKLocationsItem;

@interface RDKMapTableViewCell : UITableViewCell {
    
}

@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UILabel *subtitle;
@property (strong, nonatomic) UILabel *content;
@property (strong, nonatomic) RDKLocationsItem *locationsItem;

- (id)initWithStyle:(UITableViewCellStyle)style locationsItem:(RDKLocationsItem *)locationsItem reuseIdentifier:(NSString *)reuseIdentifier;

@end
