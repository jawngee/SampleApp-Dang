//
//  RDKDataManager.m
//  robe
//
//  Created by Trung Dang on 12/13/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKDataManager.h"

#import "ASIHTTPRequest.h"
#import "JSONKit.h"

#define _newsUrl @"http://localhost/robe/news"
#define _locationUrl @"http://localhost/robe/locations"
#define _productUrl @"http://localhost/robe/products"

@implementation RDKDataManager
@synthesize delegate = _delegate;
@synthesize jsonDataArray = _jsonDataArray;

static RDKDataManager *gInstance = nil;

#pragma mark - init 

+(RDKDataManager *)share
{
    static BOOL initialized = NO;
    
    if(!initialized)
    {
        initialized = YES;
        gInstance = [[RDKDataManager alloc] init];
    }
    
    return gInstance;
}

-(id)init
{
    self = [super init];
    
    if (self) {
        self.jsonDataArray = [[[NSMutableArray alloc] init] autorelease];
    }
    
    return self;
}

#pragma mark - private function

-(BOOL)getJsonData:(NSString *)directory fileName:(NSString *)fileName urlString:(NSString *)urlString
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *subDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:directory];
    NSString *jsonDataFile = [subDirectory stringByAppendingPathComponent:fileName];
    
    /** declare url string for ASIHTTPRequest */
    NSString *jsonString = [NSString stringWithString:urlString];
    NSURL *jsonUrl = [NSURL URLWithString:[jsonString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    /** check data file is exist in cache */
    if ([fileManager fileExistsAtPath:jsonDataFile]) 
    {
        NSDictionary *fileAttributesDictionary = [fileManager attributesOfItemAtPath:jsonDataFile error:nil];
        NSDate *fileModificationDate = [fileAttributesDictionary valueForKey:NSFileModificationDate];
        NSDate *oneHourFromcurrentDate = [[NSDate date] dateByAddingTimeInterval:-3600];
        NSComparisonResult dateComarisonResult = [oneHourFromcurrentDate compare:fileModificationDate];
        
        if (dateComarisonResult == NSOrderedDescending) 
        {
            ASIHTTPRequest *newsRequest = [ASIHTTPRequest requestWithURL:jsonUrl];
            [newsRequest setDidFinishSelector:@selector(getJsonDataFinished:)];
            [newsRequest setDidFailSelector:@selector(getJsonDataFailed:)];
            [newsRequest setDelegate:self];

            if ([@"Home" isEqualToString:directory]) {
                [newsRequest setTag:1];
            }
            
            if ([@"Map" isEqualToString:directory]) {
                [newsRequest setTag:2];
            }
            
            if ([@"Clothes" isEqualToString:directory]) {
                [newsRequest setTag:3];
            }

            [newsRequest startAsynchronous];
        }
        else
        {
            return NO;
        }
    } 
    else 
    {
        ASIHTTPRequest *newsRequest = [ASIHTTPRequest requestWithURL:jsonUrl];
        [newsRequest setDidFinishSelector:@selector(getJsonDataFinished:)];
        [newsRequest setDidFailSelector:@selector(getJsonDataFailed:)];
        [newsRequest setDelegate:self];
        
        if ([@"Home" isEqualToString:directory]) {
            [newsRequest setTag:1];
        }
        
        if ([@"Map" isEqualToString:directory]) {
            [newsRequest setTag:2];
        }
        
        if ([@"Clothes" isEqualToString:directory]) {
            [newsRequest setTag:3];
        }

        [newsRequest startAsynchronous];
    }
    
    return YES;
}

-(void)getNews
{
    NSString *directory = [NSString stringWithString:@"Home"];
    NSString *fileName = [NSString stringWithString:@"NewsData.dat"];

    BOOL isSuccess = [self getJsonData:directory fileName:fileName urlString:_newsUrl];
    
    if (isSuccess == NO) {
        /** declare array for convert dictionary to array */
        NSArray *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *subDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:directory];
        NSString *jsonDataFile = [subDirectory stringByAppendingPathComponent:fileName];

        NSData *fileData = [[NSData alloc] initWithContentsOfFile:jsonDataFile];
        NSString *fileString = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
        NSArray *dataArray = [fileString objectFromJSONString];
        
        /** release variable never use again */
        [fileString release];
        [fileData release];
        
        /** init array variable */
        [self.jsonDataArray removeAllObjects];
        [self.jsonDataArray addObjectsFromArray:dataArray];
        
        /** call delegate for home view */
        if ([self.delegate respondsToSelector:@selector(getJsonDataFinished:)])
            [self.delegate getJsonDataFinished:self];
    }
}

-(void)getLocations
{
    NSString *directory = [NSString stringWithString:@"Map"];
    NSString *fileName = [NSString stringWithString:@"LocationsData.dat"];
    
    BOOL isSuccess = [self getJsonData:directory fileName:fileName urlString:_locationUrl];
    
    if (isSuccess == NO) {
        /** declare array for convert dictionary to array */
        NSArray *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *subDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:directory];
        NSString *jsonDataFile = [subDirectory stringByAppendingPathComponent:fileName];
        
        NSData *fileData = [[NSData alloc] initWithContentsOfFile:jsonDataFile];
        NSString *fileString = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
        NSArray *dataArray = [fileString objectFromJSONString];
        
        /** release variable never use again */
        [fileString release];
        [fileData release];
        
        /** init array variable */
        [self.jsonDataArray removeAllObjects];
        [self.jsonDataArray addObjectsFromArray:dataArray];
        
        /** call delegate for home view */
        if ([self.delegate respondsToSelector:@selector(getJsonDataFinished:)])
            [self.delegate getJsonDataFinished:self];
    }
}

-(void)getProducts
{
    NSString *directory = [NSString stringWithString:@"Clothes"];
    NSString *fileName = [NSString stringWithString:@"ProductsData.dat"];
    
    BOOL isSuccess = [self getJsonData:directory fileName:fileName urlString:_productUrl];
    
    if (isSuccess == NO) {
        /** declare array for convert dictionary to array */
        NSArray *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *subDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:directory];
        NSString *jsonDataFile = [subDirectory stringByAppendingPathComponent:fileName];
        
        NSData *fileData = [[NSData alloc] initWithContentsOfFile:jsonDataFile];
        NSString *fileString = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
        NSArray *dataArray = [fileString objectFromJSONString];
        
        /** release variable never use again */
        [fileString release];
        [fileData release];
        
        /** init array variable */
        [self.jsonDataArray removeAllObjects];
        [self.jsonDataArray addObjectsFromArray:dataArray];
        
        /** call delegate for home view */
        if ([self.delegate respondsToSelector:@selector(getJsonDataFinished:)])
            [self.delegate getJsonDataFinished:self];
    }
}


#pragma mark - ASIHTTPRequestDelegate

-(void)getJsonDataFinished:(ASIHTTPRequest *)request
{
    /** declare variable for parsing json */
    NSData *fileData = [request responseData];
    NSString *responseString = [request responseString];
    NSArray *dataArray = [responseString objectFromJSONString];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);

    if ([request tag] == 1) {
        NSString *homeDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:@"Home"];
        NSString *newsDataFile = [homeDirectory stringByAppendingPathComponent:@"NewsData.dat"];
        
        /** save data file content into cache */
        [fileManager createFileAtPath:newsDataFile contents:fileData attributes:nil]; 
    }
    
    if ([request tag] == 2) {
        NSString *homeDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:@"Map"];
        NSString *newsDataFile = [homeDirectory stringByAppendingPathComponent:@"LocationsData.dat"];
        
        /** save data file content into cache */
        [fileManager createFileAtPath:newsDataFile contents:fileData attributes:nil]; 
    }
    
    if ([request tag] == 3) {
        NSString *homeDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:@"Clothes"];
        NSString *newsDataFile = [homeDirectory stringByAppendingPathComponent:@"ProductsData.dat"];
        
        /** save data file content into cache */
        [fileManager createFileAtPath:newsDataFile contents:fileData attributes:nil]; 
    }
    
    /** init array variable */
    [self.jsonDataArray removeAllObjects];
    [self.jsonDataArray addObjectsFromArray:dataArray];
    
    /** call delegate for home view */
    if ([self.delegate respondsToSelector:@selector(getJsonDataFinished:)])
        [self.delegate getJsonDataFinished:self];

}

#pragma mark - View lifecycle

-(void)dealloc
{
    [_jsonDataArray release];
    [_delegate release];
    [super dealloc];
}

@end
