//
//  RDKLocationsItem.h
//  Robe Di Kappa
//
//  Created by Trung Dang on 12/22/11.
//  Copyright (c) 2011 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDKLocationsItem : NSObject

@property (nonatomic) double longtitude;
@property (nonatomic) double latitude;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) UIImage *iconImage;

-(id)initWithItem:(NSDictionary *)locationsDictionary;

@end
