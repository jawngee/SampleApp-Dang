//
//  RDKProductsItem.m
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/25/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import "RDKProductsItem.h"

@implementation RDKProductsItem
@synthesize title = _title;
@synthesize description = _description;
@synthesize rsp = _rsp;
@synthesize icon = _icon;
@synthesize iconImage = _iconImage;
@synthesize colors = _colors;

-(id)initWithItem:(NSDictionary *)productsDictionary
{
    self = [super init];
    
    if (self) {
        [self setTitle:[productsDictionary objectForKey:@"title"]];
        [self setDescription:[productsDictionary objectForKey:@"description"]];
        [self setRsp:[productsDictionary objectForKey:@"rsp"]];
        [self setIcon:[productsDictionary objectForKey:@"icon"]];
        [self setColors:[productsDictionary objectForKey:@"colors"]];
    }
    
    return self;
}

#pragma mark - View lifecycle

-(void)dealloc
{
    [_title release];
    [_description release];
    [_rsp release];
    [_icon release];
    [_iconImage release];
    [_colors release];
    [super dealloc];
}

@end
