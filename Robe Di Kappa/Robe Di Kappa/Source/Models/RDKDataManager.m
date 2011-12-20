//
//  RDKDataManager.m
//  robe
//
//  Created by Trung Dang on 12/13/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKDataManager.h"

@implementation RDKDataManager

static RDKDataManager *gInstance = nil;

+(void)initialize
{
    static BOOL initialized = NO;
    
    if(!initialized)
    {
        initialized = YES;
        gInstance = [[RDKDataManager alloc] init];
    }
}

-(NSArray *)getNewsList
{
    NSArray *newsList = [[[NSArray alloc] init] autorelease];
    return newsList;
}

-(NSArray *)getCollectionImageList
{
    NSArray *collectionImageList = [[[NSArray alloc] init] autorelease];
    return collectionImageList;
}

-(NSArray *)getProductList
{
    NSArray *productList = [[[NSArray alloc] init] autorelease];
    return productList;
}

-(NSArray *)getEventImageList
{
    NSArray *eventImageList = [[[NSArray alloc] init] autorelease];
    return eventImageList;
}

@end
