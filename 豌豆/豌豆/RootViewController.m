//
//  RootViewController.m
//  豌豆
//
//  Created by lanou3g on 15/9/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RootViewController.h"
#import "StyleCollectionViewController.h"
#import "ActivityTableViewController.h"
#import "MovieTableViewController.h"
#import "CinemaTableViewController.h"
#import "UserTableViewController.h"
#import "NextViewController.h"
#import "StyleViewController.h"
@interface RootViewController ()<UITabBarControllerDelegate>


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 活动
    ActivityTableViewController *activity = [[ActivityTableViewController alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController *activityNC = [[UINavigationController alloc]initWithRootViewController:activity];
    UIImage *activityImage = [UIImage imageNamed:@"activity.png"];
    activityNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"活动" image:activityImage tag:101];
    
//    // 电影
//    MovieTableViewController *movie = [[MovieTableViewController alloc]initWithStyle:UITableViewStylePlain];
//    UINavigationController *movieNC = [[UINavigationController alloc]initWithRootViewController:movie];
//    UIImage *movieImage = [UIImage imageNamed:@"movie.png"];
//    movieNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"电影" image:movieImage tag:102];
//    
    // 影院
    CinemaTableViewController *cinema = [[CinemaTableViewController alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController *cinemaNC = [[UINavigationController alloc]initWithRootViewController:cinema];
    UIImage *cinemaImage = [UIImage imageNamed:@"cinema.png"];
    cinemaNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"影院" image:cinemaImage tag:103];
    
    //用户
    UserTableViewController *user = [[UserTableViewController alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController *userNC = [[UINavigationController alloc]initWithRootViewController:user];
    UIImage *userImage = [UIImage imageNamed:@"user.png"];
    userNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"用户" image:userImage tag:104];
    
    //电影详情
    NextViewController *next = [[NextViewController alloc]init];
    UINavigationController *NC = [[UINavigationController alloc]initWithRootViewController:next];
    
    StyleViewController *style = [[StyleViewController alloc]init];
    UINavigationController *styleNC = [[UINavigationController alloc]initWithRootViewController:style];
    UIImage *styleimage = [UIImage imageNamed:@"movie.png"];
    styleNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"电影" image:styleimage tag:102];
//
//    UITabBarController *tabBC = [[UITabBarController alloc]init];
//    
    self.viewControllers = @[activityNC,styleNC,cinemaNC,userNC];

    
    // Do any additional setup after loading the view.
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
