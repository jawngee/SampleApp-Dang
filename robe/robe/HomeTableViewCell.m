//
//  HomeTableViewCell.m
//  robe
//
//  Created by Trung Dang on 11/18/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "HomeTableViewCell.h"

@interface HomeTableViewCell (Private)

- (void)buildCell;

@end


@implementation HomeTableViewCell
@synthesize imageViewCell = _imageViewCell;
@synthesize titleLable = _titleLable;
@synthesize desciptionLable = _desciptionLable;
@synthesize createTimeLable = _createTimeLable;

- (void)dealloc
{
    [super dealloc];
    
    [_imageViewCell release];
    [_titleLable release];
    [_desciptionLable release];
    [_createTimeLable release];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self buildCell];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)buildCell
{
    self.backgroundColor = [UIColor whiteColor];
	self.accessoryType = UITableViewCellAccessoryNone;

    self.imageViewCell = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12, 128, 94)];
    self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(145, 12, 160, 20)];
    self.desciptionLable = [[UILabel alloc] initWithFrame:CGRectMake(145, 35, 160, 20)];
    self.createTimeLable = [[UILabel alloc] initWithFrame:CGRectMake(200, 88, 105, 20)];
    
    [self addSubview:self.imageViewCell];
    [self addSubview:self.titleLable];
    [self addSubview:self.desciptionLable];
    [self addSubview:self.createTimeLable];

}

@end
