//
//  MyCollectionViewCell.m
//  豌豆
//
//  Created by lanou3g on 15/9/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
-(UIImageView *)myImage
{
    if (_myImage == nil) {
        _myImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.contentView.frame), CGRectGetMinY(self.contentView.frame), CGRectGetWidth(self.contentView.frame) + 10, CGRectGetHeight(self.contentView.frame) - 10)];
        [self.contentView addSubview:_myImage];
    }
    
    return _myImage;
    
}
-(UILabel *)titleLabel
{
    
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myImage.frame), CGRectGetMaxY(self.myImage.frame) + 20, CGRectGetWidth(self.myImage.frame), CGRectGetHeight(self.contentView.frame) - CGRectGetHeight(self.myImage.frame))];
        
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
    
    
}






@end
