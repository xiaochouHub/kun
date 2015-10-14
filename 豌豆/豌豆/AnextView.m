//
//  AnextView.m
//  豌豆
//
//  Created by lanou3g on 15/9/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "AnextView.h"

@implementation AnextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_data];
    }
    return self;
}
-(void)p_data
{
    self.bigScrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    
//    self.bigScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) * 2);
    
    [self addSubview:_bigScrollView];
    
    self.bigView = [[UIView alloc]initWithFrame:self.frame];
    [self.bigScrollView addSubview:_bigView];
    
    
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, CGRectGetWidth(self.frame) - 40, 50)];
//    self.title.backgroundColor = [UIColor grayColor];
    self.title.text = @"罗马与巴洛克艺术";
    self.title.font = [UIFont systemFontOfSize:18];
    self.title.numberOfLines = 0;
    [self.bigView addSubview:_title];
    
    
    self.myImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.title.frame), CGRectGetMaxY(self.title.frame) + 10, 100 , 150)];
    self.myImage.backgroundColor = [UIColor lightGrayColor];
    [self.bigView addSubview:_myImage];
    
    
    self.timeImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.myImage.frame) + 10, CGRectGetMinY(self.myImage.frame), 20, 20)];
    self.timeImage.image = [UIImage imageNamed:@"icon_date_blue.png"];
//    self.timeImage.backgroundColor = [UIColor lightGrayColor];
    [self.bigView addSubview:_timeImage];
    
    
    self.userImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.timeImage.frame), CGRectGetMaxY(self.timeImage.frame) + 7, 20, 20)];
    self.userImage.image = [UIImage imageNamed:@"icon_sponsor_blue.png"];
    [self.bigView addSubview:_userImage];
    
    
    self.typeImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.userImage.frame), CGRectGetMaxY(self.userImage.frame) + 7, 20, 20)];
    self.typeImage.image = [UIImage imageNamed:@"icon_catalog_blue.png"];
    [self.bigView addSubview:_typeImage];
    
    
    self.addressImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.typeImage.frame), CGRectGetMaxY(self.typeImage.frame) + 7, 20, 20)];
    self.addressImage.image = [UIImage imageNamed:@"icon_spot_blue"];
    [self.bigView addSubview:_addressImage];
    
    
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.timeImage.frame) + 10, CGRectGetMinY(self.timeImage.frame), CGRectGetWidth(self.frame) - 180, 20)];
    self.timeLabel.font = [UIFont systemFontOfSize:15];
    self.timeLabel.text = @"";
//    self.timeLabel.backgroundColor = [UIColor lightGrayColor];
    [self.bigView addSubview:_timeLabel];
    
    
    self.userLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.timeLabel.frame), CGRectGetMinY(self.userImage.frame), CGRectGetWidth(self.timeLabel.frame), CGRectGetHeight(self.timeLabel.frame))];
    self.userLabel.font = [UIFont systemFontOfSize:15];
//    self.userLabel.backgroundColor = [UIColor lightGrayColor];
    [self.bigView addSubview:_userLabel];
    
    
    self.typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.timeLabel.frame), CGRectGetMinY(self.typeImage.frame), CGRectGetWidth(self.userLabel.frame), CGRectGetHeight(self.userLabel.frame))];
    self.typeLabel.font = [UIFont systemFontOfSize:15];
//    self.typeLabel.backgroundColor = [UIColor lightGrayColor];
    [self.bigView addSubview:_typeLabel];
    
    
    self.addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.timeLabel.frame), CGRectGetMinY(self.addressImage.frame), CGRectGetWidth(self.typeLabel.frame), CGRectGetHeight(self.typeLabel.frame) * 2)];
    
    self.addressLabel.font = [UIFont systemFontOfSize:15];
//    self.addressLabel.backgroundColor = [UIColor lightGrayColor];
    self.addressLabel.numberOfLines = 0;
    [self.bigView  addSubview:_addressLabel];
    
    
    self.introduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myImage.frame), CGRectGetMaxY(self.myImage.frame) + 15, CGRectGetWidth(self.frame) - 40, 30)];
    //self.introduceLabel.backgroundColor = [UIColor lightGrayColor];
    self.introduceLabel.text = @"活动介绍";
    self.introduceLabel.font = [UIFont systemFontOfSize:18];
    [self.bigView addSubview:_introduceLabel];
    
    
    self.introduceDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.introduceLabel.frame), CGRectGetMaxY(self.introduceLabel.frame) + 15, CGRectGetWidth(self.introduceLabel.frame), 300)];
//    self.introduceDataLabel.backgroundColor = [UIColor lightGrayColor];
    self.introduceDataLabel.font = [UIFont systemFontOfSize:15];
    self.introduceDataLabel.numberOfLines = 0;
    [self.bigView addSubview:_introduceDataLabel];
    
    
    
}






@end
