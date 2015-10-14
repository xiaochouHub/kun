//
//  Activity.h
//  豌豆
//
//  Created by lanou3g on 15/9/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject

@property (nonatomic,strong)NSString *title; // titleLabel
@property (nonatomic,strong)NSString *begin_time;
@property (nonatomic,strong)NSString *end_time; // timeLabel
@property (nonatomic,strong)NSString *address; //addressLabel
@property (nonatomic,strong)NSString *category_name; // typeDataLabel
@property (nonatomic,strong)NSString *image; // myImage
@property (nonatomic,assign)NSInteger wisher_count; // interestDataLabel
@property (nonatomic,assign)NSInteger participant_count; // joinDataLabel

@property (nonatomic,strong)NSString *content;
@property (nonatomic,strong)NSDictionary *owner;






@end
