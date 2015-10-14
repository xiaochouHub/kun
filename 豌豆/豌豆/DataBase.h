//
//  DataBase.h
//  豌豆
//
//  Created by lanou3g on 15/9/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Title;
@interface DataBase : NSObject

+(instancetype)shareDataBase;

-(void)openDataBase;

-(void)createTabel;

-(void)insertStudent:(Title *)data;

-(NSArray *)findAll;

-(void)closeDataBase;


@end
