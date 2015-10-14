//
//  StyleViewController.m
//  豌豆
//
//  Created by lanou3g on 15/9/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "StyleViewController.h"
#import "StyleCollectionViewController.h"
#import "MovieTableViewController.h"
@interface StyleViewController ()

@property (nonatomic,strong)MovieTableViewController *mc;
@property (nonatomic,strong)StyleCollectionViewController *sv;
@property (nonatomic,assign)BOOL isClick;

@property (nonatomic,strong)UIActivityIndicatorView *active;

@end

@implementation StyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

self.active = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
self.active.center = CGPointMake(CGRectGetMaxX(self.view.frame) / 2, CGRectGetMaxY(self.view.frame) / 2);
[self.active startAnimating];
self.active.color = [UIColor blackColor];
[self.view addSubview:self.active];

[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction) userInfo:nil repeats:NO];

    
    
    self.isClick = NO;
    
    self.navigationItem.title = @"电影";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_list@2x.png"] style:(UIBarButtonItemStylePlain) target:self action:@selector(rightAction:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav@2x.png"] forBarMetrics:UIBarMetricsDefault];
    _mc = [[MovieTableViewController alloc]init];
    
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayOut.itemSize = CGSizeMake(95, 140);
    
    flowLayOut.minimumInteritemSpacing = 10;
    
    flowLayOut.minimumLineSpacing = 40;
    
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    flowLayOut.sectionInset = UIEdgeInsetsMake(20, 10 , 50, 20);
    
    _sv = [[StyleCollectionViewController alloc]initWithCollectionViewLayout:flowLayOut];
    _mc.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    _sv.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    
    
    // Do any additional setup after loading the view.
}

-(void)timeAction
{
    
    [self.active stopAnimating];
    [self addChildViewController:_mc];
    [self addChildViewController:_sv];
    [self.view addSubview:_mc.view];
}


// 实现右按钮方法
-(void)rightAction:(UIBarButtonItem *)sender
{
    StyleCollectionViewController *style1 = [[StyleCollectionViewController alloc]init];
    
    // 实现点击后图标的相互切换
    if (self.isClick == NO) {
        self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"btn_nav_collection@2x.png"];
        
        [UIView transitionFromView:_mc.view toView:_sv.view duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
            
            
        }];
        
        self.isClick = YES;
    }
    else if (self.isClick == YES)
    {
        self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"btn_nav_list@2x.png"];
        
        [UIView transitionFromView:_sv.view toView:_mc.view duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            
            
        }];
        
        self.isClick = NO;
    }
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
