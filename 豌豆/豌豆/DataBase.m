//
//  DataBase.m
//  豌豆
//
//  Created by lanou3g on 15/9/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DataBase.h"
#import "sqlite3.h"
#import "Title.h"

static DataBase *titleData = nil;

@implementation DataBase

+(instancetype)shareDataBase
{
    if (titleData == nil) {
        titleData = [[DataBase alloc]init];
    }
    return titleData;
}

static sqlite3 *sql1 = nil;

-(void)openDataBase
{
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *dbPath = [documentPath stringByAppendingString:@"/title.sqlite"];
    
    NSLog(@"%@",dbPath);
    
    int temp = sqlite3_open(dbPath.UTF8String, &sql1);
    
    if (temp == SQLITE_OK) {
        NSLog(@"数据库打开成功");
    }
    else
    {
        NSLog(@"数据库打开失败");
    }
    
}

-(void)createTabel
{
    NSString *sqlStr = @"CREATE TABLE IF NOT EXISTS TITLE (title TEXT PRIMARY KEY NOT NULL)";
    
    int temp = sqlite3_exec(sql1, sqlStr.UTF8String, NULL, NULL, NULL);
    
    if (temp == SQLITE_OK) {
        NSLog(@"创建表成功");
    }
    else
    {
        NSLog(@"创建表失败");
        
    }
    
    
}

-(void)insertStudent:(Title *)data
{
    NSString *sqlStr = [NSString stringWithFormat:@"INSERT INTO TITLE (title) VALUES ('%@')",data.title];
    
    int temp = sqlite3_exec(sql1, sqlStr.UTF8String, NULL, NULL, NULL);
    
    if (temp == SQLITE_OK) {
        NSLog(@"添加数据成功");
    }
    else
    {
        NSLog(@"添加数据失败");
    }
    
}

-(NSArray *)findAll
{
    NSString *sqlStr = @"SELECT * FORM TITLE";
    
    sqlite3_stmt *stmt = nil;
    
    int temp = sqlite3_prepare_v2(sql1, sqlStr.UTF8String, -1, &stmt, NULL);
    
    NSMutableArray *titleArr = [NSMutableArray array];
    
    if (temp == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_OK) {
            NSString *tempTitle = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            
            Title *t = [[Title alloc]init];
            
            
            t.title = tempTitle;
            
            [titleArr addObject:t];
        }
        NSLog(@"111");
    }
    sqlite3_finalize(stmt);
    for (Title *t in titleArr) {
        NSLog(@"%@",t.title);
    }
    return titleArr;
}



@end
