//
//  RDKDataManager.h
//  robe
//
//  Created by Trung Dang on 12/13/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDKDataManager : NSObject


+(void)initialize;

-(NSArray *)getNewsList;
-(NSArray *)getCollectionImageList;
-(NSArray *)getProductList;
-(NSArray *)getEventImageList;

@end
