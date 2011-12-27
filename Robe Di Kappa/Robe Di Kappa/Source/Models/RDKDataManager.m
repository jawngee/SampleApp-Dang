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
@synthesize newsArray = _newsArray;
@synthesize locationsArray = _locationsArray;
@synthesize productsArray = _productsArray;

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
        self.newsArray = [[[NSMutableArray alloc] init] autorelease];
        self.locationsArray = [[[NSMutableArray alloc] init] autorelease];
        self.productsArray = [[[NSMutableArray alloc] init] autorelease];
    }
    
    return self;
}

#pragma mark - private function

-(void)getNews
{
    /** declare dictionary varibale for file manager */
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *homeDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:@"Home"];
    NSString *newsDataFile = [homeDirectory stringByAppendingPathComponent:@"NewsData.dat"];
    
    /** declare url string for ASIHTTPRequest */
    NSString *newsString = [NSString stringWithString:_newsUrl];
    NSURL *newsUrl = [NSURL URLWithString:[newsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    /** check data file is exist in cache */
    if ([fileManager fileExistsAtPath:newsDataFile]) 
    {
        NSDictionary *fileAttributesDictionary = [fileManager attributesOfItemAtPath:newsDataFile error:nil];
        NSDate *fileModificationDate = [fileAttributesDictionary valueForKey:NSFileModificationDate];
        NSDate *oneHourFromcurrentDate = [[NSDate date] dateByAddingTimeInterval:-3600];
        NSComparisonResult dateComarisonResult = [oneHourFromcurrentDate compare:fileModificationDate];
        
        if (dateComarisonResult == NSOrderedDescending) 
        {
            ASIHTTPRequest *newsRequest = [ASIHTTPRequest requestWithURL:newsUrl];
            [newsRequest setDidFinishSelector:@selector(getNewsFinished:)];
            [newsRequest setDidFailSelector:@selector(getNewsFailed:)];
            [newsRequest setDelegate:self];
            [newsRequest startAsynchronous];
        }
        else
        {
            /** declare array for convert dictionary to array */
            NSData *newsFileData = [[NSData alloc] initWithContentsOfFile:newsDataFile];
            NSString *newsFileString = [[NSString alloc] initWithData:newsFileData encoding:NSUTF8StringEncoding];
            NSArray *newsArray = [newsFileString objectFromJSONString];
            
            /** release variable never use again */
            [newsFileString release];
            [newsFileData release];

            NSLog(@"NUMBER OF ITEM FROM NEWS DATA FILE: %d", [newsArray count]);
            
            /** init array variable */
            [self.newsArray removeAllObjects];
            [self.newsArray addObjectsFromArray:newsArray];
            
            /** call delegate for home view */
            if ([self.delegate respondsToSelector:@selector(getNewsFinished:)])
                [self.delegate getNewsFinished:self];
        }
    } 
    else 
    {
        ASIHTTPRequest *newsRequest = [ASIHTTPRequest requestWithURL:newsUrl];
        [newsRequest setDidFinishSelector:@selector(getNewsFinished:)];
        [newsRequest setDidFailSelector:@selector(getNewsFailed:)];
        [newsRequest setDelegate:self];
        [newsRequest startAsynchronous];
    }
}

-(void)getLocations
{
    /** declare dictionary varibale for file manager */
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *homeDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:@"Map"];
    NSString *newsDataFile = [homeDirectory stringByAppendingPathComponent:@"LocationsData.dat"];
    
    /** declare url string for ASIHTTPRequest */
    NSString *newsString = [NSString stringWithString:_locationUrl];
    NSURL *newsUrl = [NSURL URLWithString:[newsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    /** check data file is exist in cache */
    if ([fileManager fileExistsAtPath:newsDataFile]) 
    {
        NSDictionary *fileAttributesDictionary = [fileManager attributesOfItemAtPath:newsDataFile error:nil];
        NSDate *fileModificationDate = [fileAttributesDictionary valueForKey:NSFileModificationDate];
        NSDate *oneHourFromcurrentDate = [[NSDate date] dateByAddingTimeInterval:-3600];
        NSComparisonResult dateComarisonResult = [oneHourFromcurrentDate compare:fileModificationDate];
        
        if (dateComarisonResult == NSOrderedDescending) 
        {
            ASIHTTPRequest *newsRequest = [ASIHTTPRequest requestWithURL:newsUrl];
            [newsRequest setDidFinishSelector:@selector(getLocationsFinished:)];
            [newsRequest setDidFailSelector:@selector(getLocationsFailed:)];
            [newsRequest setDelegate:self];
            [newsRequest startAsynchronous];
        }
        else
        {
            /** declare array for convert dictionary to array */
            NSData *newsFileData = [[NSData alloc] initWithContentsOfFile:newsDataFile];
            NSString *newsFileString = [[NSString alloc] initWithData:newsFileData encoding:NSUTF8StringEncoding];
            NSArray *newsArray = [newsFileString objectFromJSONString];
            
            /** release variable never use again */
            [newsFileString release];
            [newsFileData release];
            
            NSLog(@"NUMBER OF ITEM FROM LOCATIONS DATA FILE: %d", [newsArray count]);
            
            /** init array variable */
            [self.locationsArray removeAllObjects];
            [self.locationsArray addObjectsFromArray:newsArray];
            
            /** call delegate for map view */
            if ([self.delegate respondsToSelector:@selector(getLocationsFinished:)])
                [self.delegate getLocationsFinished:self];
        }
    } 
    else 
    {
        ASIHTTPRequest *newsRequest = [ASIHTTPRequest requestWithURL:newsUrl];
        [newsRequest setDidFinishSelector:@selector(getLocationsFinished:)];
        [newsRequest setDidFailSelector:@selector(getLocationsFailed:)];
        [newsRequest setDelegate:self];
        [newsRequest startAsynchronous];
    }
}

-(void)getProducts
{
    /** declare dictionary varibale for file manager */
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *homeDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:@"Clothes"];
    NSString *newsDataFile = [homeDirectory stringByAppendingPathComponent:@"ProductsData.dat"];
    
    /** declare url string for ASIHTTPRequest */
    NSString *newsString = [NSString stringWithString:_productUrl];
    NSURL *newsUrl = [NSURL URLWithString:[newsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    /** check data file is exist in cache */
    if ([fileManager fileExistsAtPath:newsDataFile]) 
    {
        NSDictionary *fileAttributesDictionary = [fileManager attributesOfItemAtPath:newsDataFile error:nil];
        NSDate *fileModificationDate = [fileAttributesDictionary valueForKey:NSFileModificationDate];
        NSDate *oneHourFromcurrentDate = [[NSDate date] dateByAddingTimeInterval:-3600];
        NSComparisonResult dateComarisonResult = [oneHourFromcurrentDate compare:fileModificationDate];
        
        if (dateComarisonResult == NSOrderedDescending) 
        {
            ASIHTTPRequest *newsRequest = [ASIHTTPRequest requestWithURL:newsUrl];
            [newsRequest setDidFinishSelector:@selector(getProductsFinished:)];
            [newsRequest setDidFailSelector:@selector(getProductsFailed:)];
            [newsRequest setDelegate:self];
            [newsRequest startAsynchronous];
        }
        else
        {
            /** declare array for convert dictionary to array */
            NSData *newsFileData = [[NSData alloc] initWithContentsOfFile:newsDataFile];
            NSString *newsFileString = [[NSString alloc] initWithData:newsFileData encoding:NSUTF8StringEncoding];
            NSArray *newsArray = [newsFileString objectFromJSONString];
            
            /** release variable never use again */
            [newsFileString release];
            [newsFileData release];
            
            NSLog(@"NUMBER OF ITEM FROM PRODUCTS DATA FILE: %d", [newsArray count]);
            
            /** init array variable */
            [self.productsArray removeAllObjects];
            [self.productsArray addObjectsFromArray:newsArray];
            
            /** call delegate for home view */
            if ([self.delegate respondsToSelector:@selector(getProductsFinished:)])
                [self.delegate getProductsFinished:self];
        }
    } 
    else 
    {
        ASIHTTPRequest *newsRequest = [ASIHTTPRequest requestWithURL:newsUrl];
        [newsRequest setDidFinishSelector:@selector(getProductsFinished:)];
        [newsRequest setDidFailSelector:@selector(getProductsFailed:)];
        [newsRequest setDelegate:self];
        [newsRequest startAsynchronous];
    }
}


#pragma mark - ASIHTTPRequestDelegate

-(void)getNewsFinished:(ASIHTTPRequest *)request
{
    /** declare variable for parsing json */
    NSData *newsFileData = [request responseData];
    NSString *responseString = [request responseString];
    NSArray *newsArray = [responseString objectFromJSONString];
    
    NSLog(@"NUMBER OF ITEM FROM LOCATIONS WEB SERVICE: %d", [newsArray count]);
    
    /** declare dictionary varibale for file manager */
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *homeDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:@"Home"];
    NSString *newsDataFile = [homeDirectory stringByAppendingPathComponent:@"NewsData.dat"];
    
    /** save data file content into cache */
    [fileManager createFileAtPath:newsDataFile contents:newsFileData attributes:nil]; 
    
    /** init array variable */
    [self.newsArray removeAllObjects];
    [self.newsArray addObjectsFromArray:newsArray];
    
    /** call delegate for home view */
    if ([self.delegate respondsToSelector:@selector(getNewsFinished:)])
        [self.delegate getNewsFinished:self];
}

-(void)getNewsFailed:(ASIHTTPRequest *)request
{
    NSLog(@"GET NEWS FAIL");
}

-(void)getLocationsFinished:(ASIHTTPRequest *)request
{
    /** declare variable for parsing json */
    NSData *newsFileData = [request responseData];
    NSString *responseString = [request responseString];
    NSArray *newsArray = [responseString objectFromJSONString];
    
    NSLog(@"NUMBER OF ITEM FROM LOCATION WEB SERVICE: %d", [newsArray count]);
    
    /** declare dictionary varibale for file manager */
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *homeDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:@"Map"];
    NSString *newsDataFile = [homeDirectory stringByAppendingPathComponent:@"LocationsData.dat"];
    
    /** save data file content into cache */
    [fileManager createFileAtPath:newsDataFile contents:newsFileData attributes:nil]; 
    
    /** init array variable */
    [self.locationsArray removeAllObjects];
    [self.locationsArray addObjectsFromArray:newsArray];
    
    /** call delegate for map view */
    if ([self.delegate respondsToSelector:@selector(getLocationsFinished:)])
        [self.delegate getLocationsFinished:self];
}

-(void)getLocationsFailed:(ASIHTTPRequest *)request
{
    NSLog(@"GET LOCATIONS FAIL");
}

-(void)getProductsFinished:(ASIHTTPRequest *)request
{
    /** declare variable for parsing json */
    NSData *newsFileData = [request responseData];
    NSString *responseString = [request responseString];
    NSArray *newsArray = [responseString objectFromJSONString];
    
    NSLog(@"NUMBER OF ITEM FROM PRODUCTS WEB SERVICE: %d", [newsArray count]);
    
    /** declare dictionary varibale for file manager */
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *homeDirectory = [[cacheDirectory objectAtIndex:0] stringByAppendingPathComponent:@"Clothes"];
    NSString *newsDataFile = [homeDirectory stringByAppendingPathComponent:@"ProductsData.dat"];
    
    /** save data file content into cache */
    [fileManager createFileAtPath:newsDataFile contents:newsFileData attributes:nil]; 
    
    /** init array variable */
    [self.productsArray removeAllObjects];
    [self.productsArray addObjectsFromArray:newsArray];
    
    /** call delegate for map view */
    if ([self.delegate respondsToSelector:@selector(getProductsFinished:)])
        [self.delegate getProductsFinished:self];
}

-(void)getProductsFailed:(ASIHTTPRequest *)request
{
    NSLog(@"GET PRODUCTS FAIL");
}

#pragma mark - View lifecycle

-(void)dealloc
{
    [_newsArray release];
    [_locationsArray release];
    [_productsArray release];
    [super dealloc];
}

@end
