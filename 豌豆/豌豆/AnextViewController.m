//
//  AnextViewController.m
//  豌豆
//
//  Created by lanou3g on 15/9/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "AnextViewController.h"
#import "AnextView.h"
#import "ImageDownloader.h"
#import "LoginViewController.h"
#import "DataBase.h"
#import "Title.h"
@interface AnextViewController ()

@property (nonatomic,strong)AnextView *anext;

@property (nonatomic,strong)UIActivityIndicatorView *active;

@end

@implementation AnextViewController

-(void)loadView
{
    
    
    self.anext = [[AnextView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = _anext;
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
    
    
    
    // 添加左右键的功能
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_share.png"] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    
//
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)timeAction
{
    [self.active stopAnimating];
    [self p_data];
}

-(void)p_data
{
    // 请求数据
    NSURL *url = [NSURL URLWithString:self.activity.image];
    
    [ImageDownloader getLoadingImageWithUrl:url imageBlock:^(NSData *data) {
        self.anext.myImage.image = [UIImage imageWithData:data];
    }];
    
    // 页面中所有控件的赋值
    
    self.anext.title.text = self.activity.title;
    
    NSString *time = [NSString stringWithString:[self.activity.begin_time substringWithRange:NSMakeRange(5, 11)]];
    NSString *time2 = [time stringByAppendingString:@" -- "];
    NSString *time3 = [time2 stringByAppendingString:[self.activity.end_time substringWithRange:NSMakeRange(5, 11)]];
    self.anext.timeLabel.text = time3;
    
    self.anext.userLabel.text = [self.activity.owner objectForKey:@"name"];
    
    self.anext.typeLabel.text = self.activity.category_name;
    
    self.anext.addressLabel.text = self.activity.address;
    
    self.navigationItem.title = self.activity.title;
    
    self.anext.introduceDataLabel.text = self.activity.content;
    
    // 设置详细信息的自适应高度
    CGFloat tempHeight = [self heightForString:self.anext.introduceDataLabel.text];
    
    CGRect tempRect = self.anext.introduceDataLabel.frame;
    
    tempRect.size.height = tempHeight;
    
    self.anext.introduceDataLabel.frame = tempRect;
    
    self.anext.bigScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.anext.frame), CGRectGetHeight(self.anext.myImage.frame) + CGRectGetHeight(self.anext.introduceDataLabel.frame) + 300);
    
}


// 左右键功能
-(void)leftAction:(UIBarButtonItem *)sender
{
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)rightAction:(UIBarButtonItem *)sender
{
    LoginViewController *login = [[LoginViewController alloc]init];
    
    DataBase *dbh = [[DataBase alloc]init];
    
    dbh = [DataBase shareDataBase];
    
    Title *userdata = [[Title alloc]init];

    [dbh openDataBase];
    
    [dbh createTabel];
    
//    for (int i = 0; i < [dbh findAll].count; i ++)
//    {
//    
//    if ([[dbh findAll][i] isEqualToString:userdata.title] ) {
//        UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"收藏失败!" message:@"请继续浏览" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//        
//        [a show];
//    }
//    else if(![[dbh findAll][i] isEqualToString:userdata.title])
//    {
        UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"收藏成功!" message:@"请继续浏览" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            userdata.title = self.anext.title.text;
            [dbh insertStudent:userdata];
            [a show];
//    }
    
//    }
    
//    [self.navigationController pushViewController:login animated:YES];

}


// 自适应高度函数
-(CGFloat)heightForString:(NSString *)aString
{
    
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:15.0]};
    
    CGRect rect = [aString boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.anext.introduceDataLabel.frame), 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return rect.size.height;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
