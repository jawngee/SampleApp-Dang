//
//  RDKClothesItemTableViewCell.h
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDKClothesItemTableViewCell : UITableViewCell {
    
}

@property (strong, nonatomic) NSMutableArray *cellList;

@property (strong, nonatomic) UIImageView *imageViewCell_1;
@property (strong, nonatomic) UIImageView *imageViewCell_2;
@property (strong, nonatomic) UIImageView *imageViewCell_3;

- (void)unselectAllItem:(id)sender;

@end
