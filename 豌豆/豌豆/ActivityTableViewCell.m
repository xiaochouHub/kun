//
//  ActivityTableViewCell.m
//  豌豆
//
//  Created by lanou3g on 15/9/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 最底大View
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.contentView.frame) + 30, 160)];
        self.bigView.backgroundColor = [UIColor colorWithRed:196 / 255.0 green:216/ 255.0 blue:223/ 255.0 alpha:1];
        self.bigView.layer.cornerRadius = 5;
        [self.contentView addSubview:_bigView];
        
        // 最上边的title
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, CGRectGetWidth(self.bigView.frame) - 10, 30)];
//        self.titleLabel.backgroundColor = [UIColor lightGrayColor];
        //self.titleLabel.text = @"阿什利哈萨克绿化带过来海水倒灌啊涉及到了开始就";
        [self.bigView addSubview:_titleLabel];
        
        // 在大的View上的白色小View
        self.smallView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame) - 2, CGRectGetMaxY(self.titleLabel.frame) , CGRectGetWidth(self.titleLabel.frame) + 4, CGRectGetHeight(self.bigView.frame) - CGRectGetHeight(self.titleLabel.frame) - 8)];
        self.smallView.backgroundColor = [UIColor whiteColor];
        self.smallView.layer.cornerRadius = 5;
        [self.bigView addSubview:_smallView];
        
        // 时间灰色图标
        self.timeImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
//        self.timeImage.backgroundColor = [UIColor blackColor];
        self.timeImage.image = [UIImage imageNamed:@"icon_date.png"];
        [self.smallView addSubview:_timeImage];
        
        // 地点灰色图标
        self.addressImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.timeImage.frame), CGRectGetMaxY(self.timeImage.frame) + 5, CGRectGetWidth(self.timeImage.frame), CGRectGetHeight(self.timeImage.frame))];
//        self.addressImage.backgroundColor = [UIColor blackColor];
        self.addressImage.image = [UIImage imageNamed:@"icon_spot"];
        [self.smallView addSubview:_addressImage];
       
        // 类型灰色图标
        self.typeImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.addressImage.frame), CGRectGetMaxY(self.addressImage.frame) + 5, CGRectGetWidth(self.addressImage.frame), CGRectGetHeight(self.addressImage.frame))];
//        self.typeImage.backgroundColor = [UIColor blackColor];
        self.typeImage.image = [UIImage imageNamed:@"icon_catalog"];
        [self.smallView addSubview:_typeImage];
        
        // 时间Label
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.timeImage.frame) + 5, CGRectGetMinY(self.timeImage.frame) , 200, CGRectGetHeight(self.timeImage.frame))];
//        self.timeLabel.backgroundColor = [UIColor blackColor];
        //self.timeLabel.text = @"34t534te g3434tegergerty34egdsh";
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        [self.smallView addSubview:_timeLabel];
        
        // 地点Label
        self.addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.addressImage.frame) + 5, CGRectGetMinY(self.addressImage.frame), 200, CGRectGetHeight(self.addressImage.frame))];
        //self.addressLabel.text = @"hsooawhsfhkshdkfhalsghwoitoi";
        self.addressLabel.font = [UIFont systemFontOfSize:14];
        [self.smallView addSubview:_addressLabel];
        
        //类型Label 之一 类型两个字
        self.typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.typeImage.frame) + 5,CGRectGetMinY(self.typeImage.frame) , 40, CGRectGetHeight(self.typeImage.frame))];
        self.typeLabel.text = @"类型:";
        self.typeLabel.font = [UIFont systemFontOfSize:14];
//        self.typeLabel.backgroundColor = [UIColor blueColor];
        [self.smallView addSubview:_typeLabel];
        
        //类型Label 之二 数据Label
        self.typeDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.typeLabel.frame), CGRectGetMinY(self.typeLabel.frame), 150, CGRectGetHeight(self.typeLabel.frame))];
        //self.typeDataLabel.text = @"ergdsgdfhdfssrydsrtdhdfhj";
        self.typeDataLabel.font = [UIFont systemFontOfSize:14];
//        self.typeDataLabel.backgroundColor = [UIColor greenColor];
        [self.smallView addSubview:_typeDataLabel];
        
        // 感兴趣Label
        self.interestLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.timeImage.frame) + 7, CGRectGetMaxY(self.typeLabel.frame) +15, 45, CGRectGetHeight(self.addressLabel.frame))];
//        self.interestLabel.backgroundColor = [UIColor greenColor];
        self.interestLabel.text = @"感兴趣:";
        self.interestLabel.font = [UIFont systemFontOfSize:12];
        [self.smallView addSubview:_interestLabel];
        
        self.interestDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.interestLabel.frame), CGRectGetMinY(self.interestLabel.frame), 50, CGRectGetHeight(self.interestLabel.frame))];
//        self.interestDataLabel.text = @"12345";
        self.interestDataLabel.font = [UIFont systemFontOfSize:12];
        self.interestDataLabel.textColor = [UIColor redColor];
        [self.smallView addSubview:_interestDataLabel];
        
        // 参加
        self.joinLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.interestDataLabel.frame), CGRectGetMinY(self.interestDataLabel.frame), 30, CGRectGetHeight(self.interestDataLabel.frame))];
        self.joinLabel.text = @"参加:";
        self.joinLabel.font = [UIFont systemFontOfSize:12];
        [self.smallView addSubview:_joinLabel];
        
        self.joinDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.joinLabel.frame), CGRectGetMinY(self.joinLabel.frame), 50, CGRectGetHeight(self.joinLabel.frame))];
//        self.joinDataLabel.text = @"12345";
        self.joinDataLabel.textColor = [UIColor redColor];
        self.joinDataLabel.font = [UIFont systemFontOfSize:12];
        [self.smallView addSubview:_joinDataLabel];
        
        // 图片
        self.myImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.addressLabel.frame)+20, CGRectGetMinY(self.timeImage.frame) - 5, 80, 110)];
        self.myImage.backgroundColor = [UIColor blackColor];
        [self.smallView addSubview:_myImage];
        
        
        
        
    }
    
    return self;
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
