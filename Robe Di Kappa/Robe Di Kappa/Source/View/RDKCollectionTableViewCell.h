//
//  RDKClothesItemTableViewCell.h
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RDKClothesItemTableViewCellDelegate

- (void)itemClick:(id)sender;

@end

@interface RDKCollectionTableViewCell : UITableViewCell {
    
}

@property (strong, nonatomic) NSMutableArray *cellList;
@property (retain, nonatomic) id <RDKClothesItemTableViewCellDelegate> delegate;

@property (strong, nonatomic) UIImageView *imageViewCell_1;
@property (strong, nonatomic) UIImageView *imageViewCell_2;
@property (strong, nonatomic) UIImageView *imageViewCell_3;

@property (strong, nonatomic) UIImage *image_1;
@property (strong, nonatomic) UIImage *image_2;
@property (strong, nonatomic) UIImage *image_3;

- (void)unselectAllItem:(id)sender;

@end
