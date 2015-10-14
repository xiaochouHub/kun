//
//  MovieTableViewController.m
//  豌豆
//
//  Created by lanou3g on 15/9/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MovieTableViewController.h"
#import "MovieTableViewCell.h"
#import "Movie.h"
#import "ImageDownloader.h"
#import "NextViewController.h"
#import "Next.h"
#import "StyleCollectionViewController.h"
@interface MovieTableViewController ()

@property (nonatomic,strong)NSMutableArray *dataArr;

@property (nonatomic,strong)StyleCollectionViewController *stylevc;

@property (nonatomic,assign)BOOL isClick;

@property (nonatomic,strong)UIActivityIndicatorView *active;

// 添加BOOL判断是否点击右按钮
//@property (nonatomic,assign)BOOL isClick;


@end

@implementation MovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

self.active = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
self.active.center = CGPointMake(CGRectGetMaxX(self.view.frame) / 2, CGRectGetMaxY(self.view.frame) / 2);
[self.active startAnimating];
self.active.color = [UIColor blackColor];
[self.view addSubview:self.active];

[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction) userInfo:nil repeats:NO];
    
    // 注册
    [self.tableView registerClass:[MovieTableViewCell class] forCellReuseIdentifier:@"movie"];
    
    self.navigationItem.title = @"电影";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav@2x.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_list@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.isClick = YES;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)timeAction
{
    
    [self.active stopAnimating];
    [self p_data];
}


// 实现右按钮方法
-(void)rightAction:(UIBarButtonItem *)sender
{
   StyleCollectionViewController *style1 = [[StyleCollectionViewController alloc]init];
    
    // 实现点击后图标的相互切换
    if (self.isClick == NO) {
        self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"btn_nav_list@2x.png"];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        self.isClick = YES;
    }
    else if (self.isClick == YES)
    {
    self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"btn_nav_collection@2x.png"];
        
        [self.navigationController pushViewController:style1 animated:YES];
        
        self.isClick = NO;
    }
}



-(void)p_data
{
    self.dataArr = [NSMutableArray array];
    
    NSURL *url = [[NSURL alloc]initWithString:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/movielist.php"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        for (NSDictionary *d in [dict objectForKey:@"result"]) {
            
            Movie *m = [[Movie alloc]init];
            
            [m setValuesForKeysWithDictionary:d];
            
            [self.dataArr addObject:m];
            
            [self.tableView reloadData];
            
        }
 
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.dataArr.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movie" forIndexPath:indexPath];
    
  
    
    Movie *c = self.dataArr[indexPath.row];
    
    NSURL *url = [NSURL URLWithString:c.pic_url];
    
    [ImageDownloader getLoadingImageWithUrl:url imageBlock:^(NSData *data) {
        cell.myImage.image = [UIImage imageWithData:data];
    }];
    cell.myLabel.text = c.movieName;
    
    NextViewController *n = [[NextViewController alloc]init];
    
    n.movieid = c.movieId;
    
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NextViewController *ne = [[NextViewController alloc]init];
        [self.navigationController pushViewController:ne animated:YES];
    
    Movie *c = self.dataArr[indexPath.row];
    
    
    
    ne.movieid = c.movieId;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
