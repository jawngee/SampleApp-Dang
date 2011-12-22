//
//  RDKDataManager.h
//  robe
//
//  Created by Trung Dang on 12/13/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDKDataManagerDelegate

@optional

-(void)getNewsFinished:(id)sender;
-(void)getLocationsFinished:(id)sender;

@end

@interface RDKDataManager : NSObject

<<<<<<< HEAD
@property (strong, nonatomic) id <RDKDataManagerDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *newsArray;
@property (strong, nonatomic) NSMutableArray *locationsArray;
=======
@property (retain, nonatomic) NSObject<RDKDataManagerDelegate> *delegate;
@property (strong , nonatomic) NSMutableArray *newsArray;
>>>>>>> 0ffa637488c7ecbae2e358a8ed87c655f8676cff

+(RDKDataManager *)share;
-(void)getNews;
-(void)getLocations;

@end
