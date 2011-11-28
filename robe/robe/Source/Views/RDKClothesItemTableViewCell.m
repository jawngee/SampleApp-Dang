//
//  RDKClothesItemTableViewCell.m
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKClothesItemTableViewCell.h"

@interface RDKClothesItemTableViewCell (Private)

- (void)buildCell;

@end


@implementation RDKClothesItemTableViewCell
@synthesize imageViewCell_1 = _imageViewCell_1;
@synthesize imageViewCell_2 = _imageViewCell_2;
@synthesize imageViewCell_3 = _imageViewCell_3;

@synthesize cellList = _cellList;


- (void)dealloc
{
    [_cellList release];
    
    [_imageViewCell_1 release];
    [_imageViewCell_2 release];
    [_imageViewCell_3 release];
    [super dealloc];
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
//    if (selected == NO) {
//        [self.imageViewCell_1 setBackgroundColor:[UIColor clearColor]];
//        [self.imageViewCell_2 setBackgroundColor:[UIColor clearColor]];
//        [self.imageViewCell_3 setBackgroundColor:[UIColor clearColor]];
//    }
}

- (void)unselectAllItem:(id)sender
{
    [self.imageViewCell_1 setBackgroundColor:[UIColor clearColor]];
    [self.imageViewCell_2 setBackgroundColor:[UIColor clearColor]];
    [self.imageViewCell_3 setBackgroundColor:[UIColor clearColor]];
}

- (void)itemFress_1:(id)sender 
{
    [self.imageViewCell_1 setBackgroundColor:[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:210.0/255.0 alpha:1.0]];
    [self.imageViewCell_2 setBackgroundColor:[UIColor clearColor]];
    [self.imageViewCell_3 setBackgroundColor:[UIColor clearColor]];
    
    for (int i=0; i<[self.cellList count]; i++) {
        if (self != [self.cellList objectAtIndex:i]) {
            [[self.cellList objectAtIndex:i] unselectAllItem:self];
        }
    }
}

- (void)itemFress_2:(id)sender 
{
    [self.imageViewCell_2 setBackgroundColor:[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:210.0/255.0 alpha:1.0]];
    [self.imageViewCell_1 setBackgroundColor:[UIColor clearColor]];
    [self.imageViewCell_3 setBackgroundColor:[UIColor clearColor]];
    
    for (int i=0; i<[self.cellList count]; i++) {
        if (self != [self.cellList objectAtIndex:i]) {
            [[self.cellList objectAtIndex:i] unselectAllItem:self];
        }
    }

}

- (void)itemFress_3:(id)sender 
{
    [self.imageViewCell_3 setBackgroundColor:[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:210.0/255.0 alpha:1.0]];
    [self.imageViewCell_1 setBackgroundColor:[UIColor clearColor]];
    [self.imageViewCell_2 setBackgroundColor:[UIColor clearColor]];
    
    for (int i=0; i<[self.cellList count]; i++) {
        if (self != [self.cellList objectAtIndex:i]) {
            [[self.cellList objectAtIndex:i] unselectAllItem:self];
        }
    }

}


- (void)buildCell
{
    self.backgroundColor = [UIColor clearColor];
	self.accessoryType = UITableViewCellAccessoryNone;
    
    self.imageViewCell_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 107, 123)];    
    [self.imageViewCell_1 setContentMode:UIViewContentModeCenter];
    
    self.imageViewCell_2 = [[UIImageView alloc] initWithFrame:CGRectMake(108, 0, 107, 123)];    
    [self.imageViewCell_2 setContentMode:UIViewContentModeCenter];

    self.imageViewCell_3 = [[UIImageView alloc] initWithFrame:CGRectMake(215, 0, 106, 123)];    
    [self.imageViewCell_3 setContentMode:UIViewContentModeCenter];
    
    UIView *seperateView_1 = [[UIView alloc] initWithFrame:CGRectMake(107, 0, 1, 123)];
    [seperateView_1 setBackgroundColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    
    UIView *seperateView_2 = [[UIView alloc] initWithFrame:CGRectMake(214, 0, 1, 123)];
    [seperateView_2 setBackgroundColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    
    UIButton *itemButton_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemButton_1 setFrame:CGRectMake(0, 0, 107, 123)];
    [itemButton_1 setBackgroundColor:[UIColor clearColor]];
    [itemButton_1 addTarget:self action:@selector(itemFress_1:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *itemButton_2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemButton_2 setFrame:CGRectMake(108, 0, 107, 123)];
    [itemButton_2 setBackgroundColor:[UIColor clearColor]];
    [itemButton_2 addTarget:self action:@selector(itemFress_2:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *itemButton_3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemButton_3 setFrame:CGRectMake(215, 0, 106, 123)];
    [itemButton_3 setBackgroundColor:[UIColor clearColor]];
    [itemButton_3 addTarget:self action:@selector(itemFress_3:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:self.imageViewCell_1];
    [self addSubview:self.imageViewCell_2];
    [self addSubview:self.imageViewCell_3];
    
    [self addSubview:seperateView_1];
    [self addSubview:seperateView_2];
    
    [self addSubview:itemButton_1];
    [self addSubview:itemButton_2];
    [self addSubview:itemButton_3];
    
    [seperateView_1 release];
    [seperateView_2 release];
}


@end
