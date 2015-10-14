//
//  ActivityTableViewCell.h
//  豌豆
//
//  Created by lanou3g on 15/9/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityTableViewCell : UITableViewCell

@property (nonatomic,strong)UIView *bigView; // 设置最底放的View
@property (nonatomic,strong)UIView *smallView; // bigView上放着的蓝色View
@property (nonatomic,strong)UIImageView *myImage; // 图片
@property (nonatomic,strong)UIImageView *timeImage;
@property (nonatomic,strong)UIImageView *addressImage;
@property (nonatomic,strong)UIImageView *typeImage;

@property (nonatomic,strong)UILabel *titleLabel; // 标题
@property (nonatomic,strong)UILabel *timeLabel; // 时间
@property (nonatomic,strong)UILabel *addressLabel; // 地址
@property (nonatomic,strong)UILabel *typeLabel;
@property (nonatomic,strong)UILabel *typeDataLabel; // 类型
@property (nonatomic,strong)UILabel *interestLabel;
@property (nonatomic,strong)UILabel *interestDataLabel; // 兴趣
@property (nonatomic,strong)UILabel *joinLabel;
@property (nonatomic,strong)UILabel *joinDataLabel; // 加入






@end
