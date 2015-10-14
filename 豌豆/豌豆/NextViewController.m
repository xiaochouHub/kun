//
//  NextViewController.m
//  豌豆
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NextViewController.h"
#import "NextView.h"
#import "Next.h"
#import "ImageDownloader.h"
#import "LoginViewController.h"
@interface NextViewController ()

@property (nonatomic,strong)NextView *nv;

@property (nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)Next *nextModel;

 @property (nonatomic,strong)UIActivityIndicatorView *active;

@end

@implementation NextViewController
-(void)loadView
{
    self.nv = [[NextView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = _nv;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   

self.active = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
self.active.center = CGPointMake(CGRectGetMaxX(self.view.frame) / 2, CGRectGetMaxY(self.view.frame) / 2);
[self.active startAnimating];
self.active.color = [UIColor blackColor];
[self.view addSubview:self.active];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction) userInfo:nil repeats:NO];

    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_share.png"] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    
    
//    [self showData];
    
}

-(void)timeAction
{
    
    [self.active stopAnimating];
    [self p_data];
}


-(void)p_data
{
    
    NSString *str = self.movieid;
    
    NSString *urlStr = [NSString stringWithFormat:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchmovie.php?movieId=%@",str];
    
    NSURL *url = [[NSURL alloc]initWithString:urlStr];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       
        NSDictionary *dict  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *dic = [dict objectForKey:@"result"];
        
        self.nextModel = [[Next alloc]init];
        
        [self.nextModel setValuesForKeysWithDictionary:dic];
        
        NSURL *url = [NSURL URLWithString:self.nextModel.poster];
        
        [ImageDownloader getLoadingImageWithUrl:url imageBlock:^(NSData *data) {
            
            self.nv.myImage.image = [UIImage imageWithData:data];
            
        }];
        
        self.nv.gradeDataLabel.text = self.nextModel.rating;
        
        NSString *comment = [NSString stringWithFormat:@"(%@评论)",self.nextModel.rating_count];
        
        self.nv.commentLabel.text = comment;
        
        self.nv.dateLabel.text = self.nextModel.release_date;
        
        self.nv.timeLabel.text = self.nextModel.runtime;
        
        self.nv.typeLabel.text = self.nextModel.genres;
        
        self.nv.countryLabel.text = self.nextModel.film_locations;
        
        self.nv.producerDataLabel.text = self.nextModel.actors;
        
        self.nv.plotDataLabel.text = self.nextModel.plot_simple;
        
        CGFloat tempHeight = [self heightForString:self.nv.plotDataLabel.text];
        
        CGRect tempRect = self.nv.plotDataLabel.frame;
        
        tempRect.size.height = tempHeight;
        
        self.nv.plotDataLabel.frame = tempRect;
        
        self.nv.bigScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.nv.frame), CGRectGetHeight(self.nv.myImage.frame) + CGRectGetHeight(self.nv.plotDataLabel.frame) + 400);
        
        self.navigationItem.title = self.nextModel.title;
        
        
    }];
//    NSLog(@"%@",self.nextModel.poster);
}
//-(void)showData
//{
//    self.nv.myImage.image = [UIImage imageNamed:self.nextModel.poster];
//    
//    NSLog(@"%@",self.nextModel.poster);
//    
//    self.nv.gradeDataLabel.text = self.nextModel.rating;
//    
//    NSString *comment = [NSString stringWithFormat:@"(%@评论)",self.nextModel.rating_count];
//    
//    self.nv.commentLabel.text = comment;
//    
//    self.nv.dateLabel.text = self.nextModel.release_date;
//    
//    self.nv.timeLabel.text = self.nextModel.runtime;
//    
//    self.nv.typeLabel.text = self.nextModel.genres;
//    
//    self.nv.countryLabel.text = self.nextModel.film_locations;
//    
//    self.nv.producerDataLabel.text = self.nextModel.actors;
//    
//    self.nv.plotDataLabel.text = self.nextModel.plot_simple;
//    
//}


-(void)leftAction:(UIBarButtonItem *)sender
{
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [self.navigationController popToRootViewControllerAnimated:YES]; 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)rightAction:(UIBarButtonItem *)sender
{
    UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"收藏成功!" message:@"请继续浏览" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [a show];
    
    LoginViewController *login = [[LoginViewController alloc]init];
    
    [self.navigationController pushViewController:login animated:YES];
    
}

-(CGFloat)heightForString:(NSString *)aString
{
   
    
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:15.0]};
    
    
    
    CGRect rect = [aString boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.nv.plotDataLabel.frame), 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return rect.size.height;
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
