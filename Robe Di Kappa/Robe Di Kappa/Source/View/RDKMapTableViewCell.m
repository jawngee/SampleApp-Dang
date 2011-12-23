//
//  RDKMapTableViewCell.m
//  robe
//
//  Created by Trung Dang on 12/6/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKMapTableViewCell.h"

#import "RDKLocationsItem.h"

@interface RDKMapTableViewCell (Private)

- (void)buildCell;

@end

@implementation RDKMapTableViewCell
@synthesize icon = _icon;
@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize content = _content;
@synthesize locationsItem = _locationsItem;

- (void)dealloc
{
    [_icon release];
    [_title release];
    [_subtitle release];
    [_content release];
    [_locationsItem release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style locationsItem:(RDKLocationsItem *)locationsItem reuseIdentifier:(NSString *)reuseIdentifier;
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /** Initialization code */
        [self setLocationsItem:locationsItem];
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
    
    UIImageView *selectedBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothes-selected-cell-background.png"]];
    [self setSelectedBackgroundView:selectedBackground];
    [selectedBackground release];
    
    /** declare icon image */
    self.icon = [[[UIImageView alloc] initWithFrame:CGRectMake(8, 15, 133, 94)] autorelease];
    
    /** delare title lable */
    CGSize titleSize = [self.locationsItem.title sizeWithFont:[UIFont boldSystemFontOfSize:15]
                                             constrainedToSize:CGSizeMake(170, 999) 
                                                 lineBreakMode:UILineBreakModeWordWrap];
    
    NSLog(@"HEIGH TITLE: %f", titleSize.height);

    self.title = [[[UILabel alloc] initWithFrame:CGRectMake(145, 12, 170, titleSize.height)] autorelease];
    [self.title setTextColor:[UIColor colorWithRed:92.0/255.0 green:92.0/255.0 blue:92.0/255.0 alpha:1.0]];
    [self.title setBackgroundColor:[UIColor clearColor]];
    [self.title setFont:[UIFont boldSystemFontOfSize:15]];
    [self.title setLineBreakMode:UILineBreakModeWordWrap];
    [self.title setHighlightedTextColor:[UIColor whiteColor]];
    [self.title setText:self.locationsItem.title];
    [self.title setNumberOfLines:0];
    
    /** declare sub title lable */
    CGSize subtitleSize = [self.locationsItem.subtitle sizeWithFont:[UIFont systemFontOfSize:12]
                                               constrainedToSize:CGSizeMake(170, 999) 
                                                   lineBreakMode:UILineBreakModeWordWrap];
    
    NSLog(@"HEIGH SUBTITLE: %f", subtitleSize.height);
    
    self.subtitle = [[[UILabel alloc] initWithFrame:CGRectMake(145, 17+subtitleSize.height, 170, subtitleSize.height)] autorelease];
    [self.subtitle setTextColor:[UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]];
    [self.subtitle setBackgroundColor:[UIColor clearColor]];
    [self.subtitle setFont:[UIFont systemFontOfSize:12]];
    [self.subtitle setLineBreakMode:UILineBreakModeWordWrap];
    [self.subtitle setHighlightedTextColor:[UIColor whiteColor]];
    [self.subtitle setText:self.locationsItem.subtitle];
    [self.subtitle setNumberOfLines:0];
    
    /** create bi-line lable */
    CGSize contentSize = [self.locationsItem.content sizeWithFont:[UIFont systemFontOfSize:10]
                                           constrainedToSize:CGSizeMake(170, 999) 
                                               lineBreakMode:UILineBreakModeWordWrap];
    
    NSLog(@"HEIGH CONTENT: %f", contentSize.height);

    self.content = [[[UILabel alloc] initWithFrame:CGRectMake(145, 85, 170, contentSize.height)] autorelease];
    [self.content setTextColor:[UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]];
    [self.content setBackgroundColor:[UIColor clearColor]];
    [self.content setFont:[UIFont boldSystemFontOfSize:10]];
    [self.content setLineBreakMode:UILineBreakModeWordWrap];
    [self.content setTextAlignment:UITextAlignmentLeft];
    [self.content setHighlightedTextColor:[UIColor whiteColor]];
    [self.content setText:self.locationsItem.content];
    [self.content setNumberOfLines:0];
    
    [self addSubview:self.icon];
    [self addSubview:self.title];
    [self addSubview:self.subtitle];
    [self addSubview:self.content];
}

@end
