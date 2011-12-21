//
//  RDKNewsItem.h
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/21/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDKNewsItem : NSObject

@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *headline;
@property (strong, nonatomic) NSString *subheader;
@property (strong, nonatomic) NSString *bi_line;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) UIImage *iconImage;

-(id)initWithItem:(NSDictionary *)newsDictionary;

@end
