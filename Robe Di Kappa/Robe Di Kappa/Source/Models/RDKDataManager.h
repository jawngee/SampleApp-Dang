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

@end


@interface RDKDataManager : NSObject
{
    
}

@property (retain, nonatomic) NSObject<RDKDataManagerDelegate> *delegate;
@property (strong , nonatomic) NSMutableArray *newsArray;

+(RDKDataManager *)share;
-(void)getNews;

@end
