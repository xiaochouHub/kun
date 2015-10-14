//
//  NextView.h
//  豌豆
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextView : UIView

@property(nonatomic,strong)UIScrollView *bigScrollView;
@property (nonatomic,strong)UIView *bigView;

@property (nonatomic,strong)UIImageView *myImage;

@property (nonatomic,strong)UILabel *gradeLabel;
@property (nonatomic,strong)UILabel *gradeDataLabel; // 评分
@property (nonatomic,strong)UILabel *commentLabel; // 评论
@property (nonatomic,strong)UILabel *dateLabel;// 日期
@property (nonatomic,strong)UILabel *timeLabel;// 时间
@property (nonatomic,strong)UILabel *typeLabel;// 类型
@property (nonatomic,strong)UILabel *countryLabel;// 国家
@property (nonatomic,strong)UILabel *producerLabel; // 制作人
@property (nonatomic,strong)UILabel *producerDataLabel;
@property (nonatomic,strong)UILabel *plotLabel; // 情节
@property (nonatomic,strong)UILabel *plotDataLabel;



@end
