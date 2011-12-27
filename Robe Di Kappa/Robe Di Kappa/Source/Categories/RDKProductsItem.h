//
//  RDKProductsItem.h
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/25/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDKProductsItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *rsp;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) UIImage *iconImage;
@property (strong, nonatomic) NSArray *colors;

-(id)initWithItem:(NSDictionary *)productsDictionary;

@end
