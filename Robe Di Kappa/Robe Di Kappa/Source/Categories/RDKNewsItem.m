//
//  RDKNewsItem.m
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/21/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import "RDKNewsItem.h"

@implementation RDKNewsItem
@synthesize date = _date;
@synthesize headline = _headline;
@synthesize subheader = _subheader;
@synthesize bi_line = _bi_line;
@synthesize url = _url;
@synthesize icon = _icon;
@synthesize iconImage = _iconImage;

-(id)initWithItem:(NSDictionary *)newsDictionary
{
    self = [super init];
    
    if (self) {
        [self setDate:[newsDictionary objectForKey:@"date"]];
        [self setHeadline:[newsDictionary objectForKey:@"headline"]];
        [self setSubheader:[newsDictionary objectForKey:@"subheader"]];
        [self setBi_line:[newsDictionary objectForKey:@"bi-line"]];
        [self setUrl:[newsDictionary objectForKey:@"url"]];
        [self setIcon:[newsDictionary objectForKey:@"icon"]];
    }
    
    return self;
}

#pragma mark - View lifecycle

-(void)dealloc
{
    [_date release];
    [_headline release];
    [_subheader release];
    [_bi_line release];
    [_url release];
    [_icon release];
    [_iconImage release];
    [super dealloc];
}

@end
