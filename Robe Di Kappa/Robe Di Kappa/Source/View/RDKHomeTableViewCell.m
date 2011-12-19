//
//  HomeTableViewCell.m
//  robe
//
//  Created by Trung Dang on 11/18/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKHomeTableViewCell.h"

@interface RDKHomeTableViewCell (Private)

- (void)buildCell;

@end


@implementation RDKHomeTableViewCell
@synthesize imageViewCell = _imageViewCell;
@synthesize titleLable = _titleLable;
@synthesize desciptionLable = _desciptionLable;
@synthesize createTimeLable = _createTimeLable;

- (void)dealloc
{
    [_imageViewCell release];
    [_titleLable release];
    [_desciptionLable release];
    [_createTimeLable release];
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
    
    /** Configure the view for the selected state */
}

- (void)buildCell
{
    self.backgroundColor = [UIColor clearColor];
	self.accessoryType = UITableViewCellAccessoryNone;
    
    UIImageView *selectedBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home-selected-cell-background.png"]];
    [self setSelectedBackgroundView:selectedBackground];
    [selectedBackground release];
    
    self.imageViewCell = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 12, 128, 94)] autorelease];
    self.titleLable = [[[UILabel alloc] initWithFrame:CGRectMake(145, 12, 170, 30)] autorelease];
    self.desciptionLable = [[[UILabel alloc] initWithFrame:CGRectMake(145, 45, 170, 20)] autorelease];
    self.createTimeLable = [[[UILabel alloc] initWithFrame:CGRectMake(170, 92, 145, 20)] autorelease];
    
    [self.titleLable setBackgroundColor:[UIColor clearColor]];
    [self.titleLable setFont:[UIFont boldSystemFontOfSize:12]];
    [self.titleLable setLineBreakMode:UILineBreakModeWordWrap];
    [self.titleLable setHighlightedTextColor:[UIColor whiteColor]];
    [self.titleLable setTextColor:[UIColor colorWithRed:92.0/255.0 green:92.0/255.0 blue:92.0/255.0 alpha:1.0]];
    [self.titleLable setNumberOfLines:2];
    
    [self.desciptionLable setBackgroundColor:[UIColor clearColor]];
    [self.desciptionLable setFont:[UIFont systemFontOfSize:12]];
    [self.desciptionLable setLineBreakMode:UILineBreakModeWordWrap];
    [self.desciptionLable setHighlightedTextColor:[UIColor whiteColor]];
    [self.desciptionLable setTextColor:[UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]];
    [self.desciptionLable setNumberOfLines:2];
    
    [self.createTimeLable setBackgroundColor:[UIColor clearColor]];
    [self.createTimeLable setFont:[UIFont boldSystemFontOfSize:12]];
    [self.createTimeLable setLineBreakMode:UILineBreakModeWordWrap];
    [self.createTimeLable setTextAlignment:UITextAlignmentRight];
    [self.createTimeLable setHighlightedTextColor:[UIColor whiteColor]];
    [self.createTimeLable setTextColor:[UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]];
    [self.createTimeLable setNumberOfLines:2];

    [self addSubview:self.imageViewCell];
    [self addSubview:self.titleLable];
    [self addSubview:self.desciptionLable];
    [self addSubview:self.createTimeLable];
}

@end
