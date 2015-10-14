//
//  ImageDownloader.m
//  UIlesson17_图片加载
//
//  Created by lanou3g on 15/9/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ImageDownloader.h"



@implementation ImageDownloader

+ (void)getLoadingImageWithUrl:(NSURL *)url imageBlock:(imageBlock)ib
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        ib (data);
        
    }];
    
}






@end
