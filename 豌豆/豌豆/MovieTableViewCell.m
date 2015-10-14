//
//  MovieTableViewCell.m
//  豌豆
//
//  Created by lanou3g on 15/9/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setupView];
    }
    return self;
}


-(void)p_setupView
{
    _bigView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.contentView.frame)+30, 130)];
    
    _bigView.backgroundColor = [UIColor colorWithRed:196 / 255.0 green:216/ 255.0 blue:223/ 255.0 alpha:1];
    
    _bigView.layer.cornerRadius = 5;
    
    [self.contentView addSubview:_bigView];
    
//    _myImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 80, 120)];
//    
//    _myImage.backgroundColor = [UIColor redColor];
//    
////    _myImage.image = [UIImage imageNamed:@"movie.png"];
//    
//    [_bigView addSubview:_myImage];
//    
//    _myLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.myImage.frame) + 20, CGRectGetMinY(self.myImage.frame), CGRectGetWidth(self.bigView.frame) - CGRectGetWidth(self.myImage.frame) - 10, CGRectGetHeight(self.myImage.frame))];
//    
//    _myLabel.text = @"2423435wetasgesdfasdfasfr6234";
//    
//    [self.bigView addSubview:_myLabel];
    
}





//-(UIView *)bigView
//{
//    if (_bigView == nil) {
//        _bigView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.contentView.frame) - 20, 100)];
//        
//        _bigView.backgroundColor = [UIColor grayColor];
//        
//        [self.contentView addSubview:_bigView];
//    }
//    
//    return _bigView;
//    
//}
//
//
-(UIImageView *)myImage
{
    if (_myImage == nil) {
        
        _myImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 80, 120)];
        //
        //    _myImage.backgroundColor = [UIColor redColor];
        //
        ////    _myImage.image = [UIImage imageNamed:@"movie.png"];
        //
            [_bigView addSubview:_myImage];

    }
    return _myImage;
    
}

-(UILabel *)myLabel
{
    
    if (_myLabel == nil) {
        
        _myLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.myImage.frame) + 20, CGRectGetMinY(self.myImage.frame), CGRectGetWidth(self.bigView.frame) - CGRectGetWidth(self.myImage.frame) - 10, CGRectGetHeight(self.myImage.frame))];
        //
        //    _myLabel.text = @"2423435wetasgesdfasdfasfr6234";
        //
        _myLabel.font = [UIFont systemFontOfSize:21];
            [self.bigView addSubview:_myLabel];
        
    }
    return _myLabel;
    
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
