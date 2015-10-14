//
//  AnextView.h
//  豌豆
//
//  Created by lanou3g on 15/9/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnextView : UIView

@property (nonatomic,strong)UIScrollView *bigScrollView; // 最底放的scrollView

@property (nonatomic,strong)UIView *bigView; // 在scrollView上添加View

@property (nonatomic,strong)UIImageView *myImage; // 图片
@property (nonatomic,strong)UIImageView *timeImage; // 时间图标
@property (nonatomic,strong)UIImageView *userImage; // 用户图标
@property (nonatomic,strong)UIImageView *typeImage; // 类型图标
@property (nonatomic,strong)UIImageView *addressImage; // 地点图标

@property (nonatomic,strong)UILabel *title; // 电影名(标题)
@property (nonatomic,strong)UILabel *timeLabel; // 时间
@property (nonatomic,strong)UILabel *userLabel; // 用户
@property (nonatomic,strong)UILabel *typeLabel; // 类型
@property (nonatomic,strong)UILabel *addressLabel; // 地点
@property (nonatomic,strong)UILabel *introduceLabel; // 详细信息标题
@property (nonatomic,strong)UILabel *introduceDataLabel; // 详细信息显示内容





@end
