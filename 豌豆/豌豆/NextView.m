//
//  NextView.m
//  豌豆
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NextView.h"

@implementation NextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView];
    }
    return self;
}
-(void)p_setupView
{
    _bigScrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    _bigScrollView.backgroundColor = [UIColor whiteColor];
    
    
    [self addSubview:_bigScrollView];
    
    _bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    _bigView.backgroundColor = [UIColor whiteColor];
    
    [_bigScrollView addSubview:_bigView];
    
    _myImage = [[UIImageView alloc]initWithFrame:CGRectMake(25, 25, 100, 150)];
    _myImage.backgroundColor = [UIColor grayColor];
    [_bigView addSubview:_myImage];
    
    _gradeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.myImage.frame) + 30, CGRectGetMinY(self.myImage.frame), 40, 20)];
    _gradeLabel.text = @"评分:";
    _gradeLabel.font = [UIFont systemFontOfSize:15];
//    _gradeLabel.backgroundColor = [UIColor whiteColor];
    [_bigView addSubview:_gradeLabel];
    
    _gradeDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.gradeLabel.frame), CGRectGetMinY(self.gradeLabel.frame), 40, CGRectGetHeight(self.gradeLabel.frame))];
//    _gradeDataLabel.backgroundColor = [UIColor redColor];
    _gradeDataLabel.font = [UIFont systemFontOfSize:15];
  //  _gradeDataLabel.text = @"9.9";
    [_bigView addSubview:_gradeDataLabel];
    
    _commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.gradeDataLabel.frame), CGRectGetMinY(self.gradeDataLabel.frame), 100, CGRectGetHeight(self.gradeDataLabel.frame))];
//    _commentLabel.backgroundColor = [UIColor blueColor];
  //  _commentLabel.text = @"(1234评论)";
    _commentLabel.font = [UIFont systemFontOfSize:15];
    [_bigView addSubview:_commentLabel];
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.gradeLabel.frame), CGRectGetMaxY(self.gradeLabel.frame) + 10, 100, CGRectGetHeight(self.gradeLabel.frame))];
//    _dateLabel.backgroundColor = [UIColor whiteColor];
  //  _dateLabel.text = @"20121212";
    _dateLabel.font = [UIFont systemFontOfSize:15];
    [_bigView addSubview:_dateLabel];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.gradeLabel.frame), CGRectGetMaxY(self.dateLabel.frame) + 10, 100, CGRectGetHeight(self.gradeLabel.frame))];
//    _timeLabel.backgroundColor = [UIColor whiteColor];
  //  _timeLabel.text = @"120分钟";
    _timeLabel.font = [UIFont systemFontOfSize:15];
    [_bigView addSubview:_timeLabel];
    
    _typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.gradeLabel.frame), CGRectGetMaxY(self.timeLabel.frame) + 10, 150, CGRectGetHeight(self.timeLabel.frame))];
//    _typeLabel.backgroundColor = [UIColor whiteColor];
   // _typeLabel.text = @"惊悚/恐怖/悬疑";
    _typeLabel.font = [UIFont systemFontOfSize:15];
    [_bigView addSubview:_typeLabel];
    
    _countryLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.gradeLabel.frame), CGRectGetMaxY(self.typeLabel.frame) + 10, 100, CGRectGetHeight(self.typeLabel.frame))];
//    _countryLabel.backgroundColor = [UIColor whiteColor];
   // _countryLabel.text = @"中国";
    _countryLabel.font = [UIFont systemFontOfSize:15];
    [_bigView addSubview:_countryLabel];
    
    _producerLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myImage.frame), CGRectGetMaxY(self.myImage.frame) + 30, 100, 20)];
//    _producerLabel.backgroundColor = [UIColor whiteColor];
    _producerLabel.text = @"制作人";
    _producerLabel.font = [UIFont systemFontOfSize:19];
    [_bigView addSubview:_producerLabel];
    
    _producerDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.producerLabel.frame), CGRectGetMaxY(self.producerLabel.frame) + 5, CGRectGetWidth(self.frame) - 50, 50)];
//    _producerDataLabel.backgroundColor = [UIColor whiteColor];
   // _producerDataLabel.text = @"制作人 删繁就简爱上了对方就阿什利放假阿拉山口加分拉萨的减肥";
    _producerDataLabel.font = [UIFont systemFontOfSize:15];
    _producerDataLabel.numberOfLines = 0;
    [_bigView addSubview:_producerDataLabel];
    
    _plotLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myImage.frame), CGRectGetMaxY(self.producerDataLabel.frame) + 10, CGRectGetWidth(self.producerLabel.frame), CGRectGetHeight(self.producerLabel.frame))];
//    _plotLabel.backgroundColor = [UIColor whiteColor];
    _plotLabel.text = @"电影情节";
    _plotLabel.font = [UIFont systemFontOfSize:19];
    [_bigView addSubview:_plotLabel];
    
    _plotDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myImage.frame), CGRectGetMaxY(self.plotLabel.frame) + 5, CGRectGetWidth(self.producerDataLabel.frame), 200)];
//    _plotDataLabel.backgroundColor = [UIColor whiteColor];
    // NSString *str = [NSString stringWithFormat:@"流里看见爱思考和高考还上课上试试空间数据库规划阿斯顿个客户说顾客来哈市十大歌的管理局是克里斯多感慨劳斯莱斯仅仅是离开世界观里看见爱思考和高考还上课上试试空间数据库规划阿斯顿个客户说顾客来哈市十大歌手大咖嘎斯噶"];
    //_plotDataLabel.text =str;
    _plotDataLabel.numberOfLines = 0;
    _plotDataLabel.font = [UIFont systemFontOfSize:15];
    
   
    
//    CGFloat tempHeight = [self heightForString:_plotDataLabel.text];
//    
//    CGRect tempRect = self.plotDataLabel.frame;
//    
//    tempRect.size.height = tempHeight;
//    
//    self.plotDataLabel.frame = tempRect;
    
    [_bigView addSubview:_plotDataLabel];
    
//    _bigScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.myImage.frame) + CGRectGetHeight(self.plotDataLabel.frame) + 400);
    
    
}
//-(CGFloat)heightForString:(NSString *)aString
//{
//    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:15.0]};
//    
//    CGRect rect = [aString boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.plotDataLabel.frame), 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
//    
//    return rect.size.height;
//    
//    
//}









@end
