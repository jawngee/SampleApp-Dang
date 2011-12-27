//
//  RDKLocationsItem.m
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/22/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import "RDKLocationsItem.h"

@implementation RDKLocationsItem
@synthesize longtitude;
@synthesize latitude;
@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize content = _content;
@synthesize icon = _icon;
@synthesize iconImage = _iconImage;

-(id)initWithItem:(NSDictionary *)locationsDictionary
{
    self = [super init];
    
    if (self) {
        [self setLongtitude:[[locationsDictionary objectForKey:@"long"] doubleValue]];
        [self setLongtitude:[[locationsDictionary objectForKey:@"lat"] doubleValue]];
        [self setTitle:[locationsDictionary objectForKey:@"title"]];
        [self setSubtitle:[locationsDictionary objectForKey:@"subtitle"]];
        [self setContent:[locationsDictionary objectForKey:@"content"]];
        [self setIcon:[locationsDictionary objectForKey:@"icon"]];
    }
    
    return self;
}

#pragma mark - View lifecycle

-(void)dealloc
{
    [_title release];
    [_subtitle release];
    [_content release];
    [_icon release];
    [_iconImage release];
    [super dealloc];
}

@end
