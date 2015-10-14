//
//  DataBaseHandler.h
//  豌豆
//
//  Created by lanou3g on 15/9/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserNameAndPassword;
@interface DataBaseHandler : NSObject

+(instancetype)shareDataBase;

-(void)openDataBase;

-(void)createTabel;

-(void)insertStudent:(UserNameAndPassword *)data;

-(NSArray *)findUserByUserName:(NSString *)name;

-(NSArray *)findAll;

-(void)closeDataBase;



@end
