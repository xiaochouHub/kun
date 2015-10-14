//
//  ImageDownloader.h
//  UIlesson17_图片加载
//
//  Created by lanou3g on 15/9/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^imageBlock)(NSData *data);


@interface ImageDownloader : NSObject

+ (void)getLoadingImageWithUrl:(NSURL *)url imageBlock:(imageBlock)ib;




@end
