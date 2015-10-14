//
//  CinemaTableViewCell.m
//  豌豆
//
//  Created by lanou3g on 15/9/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CinemaTableViewCell.h"

@implementation CinemaTableViewCell
 

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.myView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.contentView.frame) + 30, 120)];
        self.myView.backgroundColor = [UIColor colorWithRed:196 / 255.0 green:216/ 255.0 blue:223/ 255.0 alpha:1];
        self.myView.layer.cornerRadius = 5;
        [self.contentView addSubview:_myView];
        
//        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, CGRectGetWidth(self.myView.frame) - 10, 30)];
////        self.titleLabel.backgroundColor = [UIColor redColor];
//        self.titleLabel.text = @"sgsgdggsgasdg";
//        self.titleLabel.font = [UIFont systemFontOfSize:22];
//        [self.myView addSubview:_titleLabel];
//        
//        self.dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame), CGRectGetWidth(self.titleLabel.frame), 50)];
////        self.dataLabel.backgroundColor = [UIColor greenColor];
//        self.dataLabel.text = @"s老规矩来上课刚回来开始就就凉快圣诞节快乐SDK涉及到廊坊拉斯科拉几十块了积分历史记录是按时缴费了 ";
//        self.dataLabel.font = [UIFont systemFontOfSize:14];
//        self.dataLabel.numberOfLines = 0;
//        [self.myView addSubview:_dataLabel];
//        
//        self.numLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.dataLabel.frame), CGRectGetMaxY(self.dataLabel.frame) + 10, CGRectGetWidth(self.dataLabel.frame), 20)];
//        self.numLabel.text = @"124253463747";
//        self.numLabel.font = [UIFont systemFontOfSize:14];
//        [self.myView addSubview:_numLabel];
        
        
    }
    
    
    return self;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, CGRectGetWidth(self.myView.frame) - 10, 30)];
        //        self.titleLabel.backgroundColor = [UIColor redColor];
//        self.titleLabel.text = @"sgsgdggsgasdg";
        self.titleLabel.font = [UIFont systemFontOfSize:22];
        [self.myView addSubview:_titleLabel];
    }
    return _titleLabel;
}

-(UILabel *)dataLabel{
    
    if (_dataLabel == nil) {
        self.dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame), CGRectGetWidth(self.titleLabel.frame), 50)];
        //        self.dataLabel.backgroundColor = [UIColor greenColor];
//        self.dataLabel.text = @"s老规矩来上课刚回来开始就就凉快圣诞节快乐SDK涉及到廊坊拉斯科拉几十块了积分历史记录是按时缴费了 ";
        self.dataLabel.font = [UIFont systemFontOfSize:14];
        self.dataLabel.numberOfLines = 0;
        [self.myView addSubview:_dataLabel];
    }
    return _dataLabel;
}

-(UILabel *)numLabel
{
    if (_numLabel == nil) {
        self.numLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.dataLabel.frame), CGRectGetMaxY(self.dataLabel.frame) + 10, CGRectGetWidth(self.dataLabel.frame), 20)];
//        self.numLabel.text = @"124253463747";
        self.numLabel.font = [UIFont systemFontOfSize:14];
        [self.myView addSubview:_numLabel];
    }
    return _numLabel;
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
