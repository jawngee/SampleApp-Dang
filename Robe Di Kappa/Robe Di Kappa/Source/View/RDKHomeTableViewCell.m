//
//  HomeTableViewCell.m
//  robe
//
//  Created by Trung Dang on 11/18/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKHomeTableViewCell.h"

#import "RDKNewsItem.h"

@interface RDKHomeTableViewCell (Private)

- (void)buildCell;

@end


@implementation RDKHomeTableViewCell
@synthesize icon = _icon;
@synthesize headline = _headline;
@synthesize subheader = _subheader;
@synthesize bi_line = _bi_line;
@synthesize newsItem = _newsItem;

- (void)dealloc
{
    [_icon release];
    [_headline release];
    [_subheader release];
    [_bi_line release];
    [_newsItem release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style newsItem:(RDKNewsItem *)newsItem reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /** Initialization code */
        [self setNewsItem:newsItem];
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
    
    /** declare icon for image */
    self.icon = [[[UIImageView alloc] initWithFrame:CGRectMake(8, 12, 133, 94)] autorelease];
    
    /** delare headline lable */
    CGSize headLineSize = [self.newsItem.headline sizeWithFont:[UIFont boldSystemFontOfSize:12]
                                             constrainedToSize:CGSizeMake(170, 999) 
                                                 lineBreakMode:UILineBreakModeWordWrap];

    NSLog(@"HEIGH HEADER: %f", headLineSize.height);
    
    self.headline = [[[UILabel alloc] initWithFrame:CGRectMake(145, 12, 170, headLineSize.height)] autorelease];
    [self.headline setTextColor:[UIColor colorWithRed:92.0/255.0 green:92.0/255.0 blue:92.0/255.0 alpha:1.0]];
    [self.headline setBackgroundColor:[UIColor clearColor]];
    [self.headline setFont:[UIFont boldSystemFontOfSize:12]];
    [self.headline setLineBreakMode:UILineBreakModeWordWrap];
    [self.headline setHighlightedTextColor:[UIColor whiteColor]];
    [self.headline setText:self.newsItem.headline];
    [self.headline setNumberOfLines:0];

    /** declare subheader lable */
    CGSize subheaderSize = [self.newsItem.subheader sizeWithFont:[UIFont systemFontOfSize:12]
                                               constrainedToSize:CGSizeMake(170, 999) 
                                                   lineBreakMode:UILineBreakModeWordWrap];
    
    NSLog(@"HEIGH SUBHEADER: %f", subheaderSize.height);
    
    self.subheader = [[[UILabel alloc] initWithFrame:CGRectMake(145, 15+headLineSize.height, 170, subheaderSize.height)] autorelease];
    [self.subheader setTextColor:[UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]];
    [self.subheader setBackgroundColor:[UIColor clearColor]];
    [self.subheader setFont:[UIFont systemFontOfSize:12]];
    [self.subheader setLineBreakMode:UILineBreakModeWordWrap];
    [self.subheader setHighlightedTextColor:[UIColor whiteColor]];
    [self.subheader setText:self.newsItem.subheader];
    [self.subheader setNumberOfLines:0];
        
    /** create bi-line lable */
    CGSize bi_lineSize = [self.newsItem.bi_line sizeWithFont:[UIFont systemFontOfSize:12]
                                           constrainedToSize:CGSizeMake(170, 999) 
                                               lineBreakMode:UILineBreakModeWordWrap];

    self.bi_line = [[[UILabel alloc] initWithFrame:CGRectMake(145, 92, 170, bi_lineSize.height)] autorelease];
    [self.bi_line setTextColor:[UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]];
    [self.bi_line setBackgroundColor:[UIColor clearColor]];
    [self.bi_line setFont:[UIFont systemFontOfSize:12]];
    [self.bi_line setLineBreakMode:UILineBreakModeWordWrap];
    [self.bi_line setTextAlignment:UITextAlignmentRight];
    [self.bi_line setHighlightedTextColor:[UIColor whiteColor]];
    [self.bi_line setText:self.newsItem.bi_line];
    [self.bi_line setNumberOfLines:0];

    [self addSubview:self.icon];
    [self addSubview:self.headline];
    [self addSubview:self.subheader];
    [self addSubview:self.bi_line];
}

@end
