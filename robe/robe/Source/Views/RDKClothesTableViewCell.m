//
//  RDKClothesTableViewCell.m
//  robe
//
//  Created by Trung Dang on 11/24/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKClothesTableViewCell.h"

@interface RDKClothesTableViewCell (Private)

- (void)buildCell;

@end

@implementation RDKClothesTableViewCell
@synthesize imageViewCell = _imageViewCell;
@synthesize titleLable = _titleLable;

- (void)dealloc
{
    [_imageViewCell release];
    [_titleLable release];
    [super dealloc];
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /** Initialization code */
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
    self.backgroundColor = [UIColor clearColor];
	self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIImageView *selectedBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothes-selected-cell-background-image.png"]];
    [self setSelectedBackgroundView:selectedBackground];
    [selectedBackground release];
    
    self.imageViewCell = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 92)] autorelease];
    [self.imageViewCell setContentMode:UIViewContentModeCenter];

    self.titleLable = [[[UILabel alloc] initWithFrame:CGRectMake(140, 36, 50, 20)] autorelease];
    [self.titleLable setBackgroundColor:[UIColor clearColor]];
    [self.titleLable setFont:[UIFont boldSystemFontOfSize:16]];
    [self.titleLable setLineBreakMode:UILineBreakModeWordWrap];
    [self.titleLable setHighlightedTextColor:[UIColor whiteColor]];
    [self.titleLable setTextColor:[UIColor colorWithRed:92.0/255.0 green:92.0/255.0 blue:92.0/255.0 alpha:1.0]];
    [self.titleLable setNumberOfLines:2];
    
    [self addSubview:self.imageViewCell];
    [self addSubview:self.titleLable];
    
}


@end
