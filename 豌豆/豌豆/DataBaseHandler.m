//
//  DataBaseHandler.m
//  豌豆
//
//  Created by lanou3g on 15/9/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DataBaseHandler.h"
#import "sqlite3.h"
#import "UserNameAndPassword.h"

static DataBaseHandler *dbhandler = nil;


@implementation DataBaseHandler

+(instancetype)shareDataBase
{
    if (dbhandler == nil) {
        dbhandler = [[DataBaseHandler alloc]init];
    }
    return dbhandler;
    
}

static sqlite3 *sql1 = nil;

-(void)openDataBase
{
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *dbPath = [documentPath stringByAppendingString:@"/user.sqlite"];
    
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
    NSString *sqlStr = @"CREATE TABLE IF NOT EXISTS USERNAME (username TEXT PRIMARY KEY NOT NULL,password TEXT)";
    
    int temp = sqlite3_exec(sql1, sqlStr.UTF8String, NULL, NULL, NULL);
    
    if (temp == SQLITE_OK) {
        NSLog(@"创建表成功");
    }
    else
    {
        NSLog(@"创建表失败");
    }
}

-(void)insertStudent:(UserNameAndPassword *)data
{
    NSString *sqlStr = [NSString stringWithFormat:@"INSERT INTO USERNAME (username,password) VALUES ('%@','%@')",data.userName,data.passWord];
    
    int temp = sqlite3_exec(sql1, sqlStr.UTF8String, NULL, NULL, NULL);
    
    if (temp == SQLITE_OK) {
        NSLog(@"添加数据成功");
    }
    else
    {
        NSLog(@"添加数据失败");
    }
    
    
}
-(NSArray *)findUserByUserName:(NSString *)name
{
    NSString *sqlStr = [NSString stringWithFormat:@"SELECT * FROM USERNAME WHERE username = '%@'",name];
    
    sqlite3_stmt *stmt = nil;
    
    int temp = sqlite3_prepare_v2(sql1, sqlStr.UTF8String, -1, &stmt, NULL);
    
    NSMutableArray *userArray = [NSMutableArray array];
    
    if (temp == SQLITE_OK) {
        sqlite3_bind_text(stmt, 0, name.UTF8String, -1,NULL);
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            NSString *tempName = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            NSString *tempPass = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            
            UserNameAndPassword *userPass = [[UserNameAndPassword alloc]init];
            
            userPass.userName = tempName;
            
            userPass.passWord = tempPass;
            
            [userArray addObject:userPass];
        }
        sqlite3_finalize(stmt);
        NSLog(@"查询成功");
        
    }
    
    
    for (UserNameAndPassword *user in userArray) {
        NSLog(@"%@ , %@",user.userName,user.passWord);
    }
    
    
    
    return userArray;
}

-(NSArray *)findAll
{
    // 1 SQL
    NSString *sqlStr = @"SELECT * FROM USERNAME";
    
    // 2 准备一个伴随指针
    sqlite3_stmt *stmt = nil;
    
    // 3 预执行
    int temp = sqlite3_prepare_v2(sql1, sqlStr.UTF8String, -1, &stmt, NULL);
    
    NSMutableArray *studentArr = [NSMutableArray array];
    
    if (temp == SQLITE_OK) {
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            // 取出来赋值给临时变量
            
            NSString *tempName = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            
            NSString *tempPass = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            
            UserNameAndPassword *uPass = [[UserNameAndPassword alloc]init];
            
            uPass.userName = tempName;
            
            uPass.passWord = tempPass;
            
            // 添加到数组中
            [studentArr addObject:uPass];
            
            
        }
        
        NSLog(@"查询成功");
    }
    // 关闭伴随指针
    
    sqlite3_finalize(stmt);
    for (UserNameAndPassword *u in studentArr) {
        NSLog(@"%@,%@",u.userName,u.passWord);
    }
    
    
    
    
    
    return studentArr;

    
}




@end
