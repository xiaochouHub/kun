//
//  ActivityTableViewController.m
//  豌豆
//
//  Created by lanou3g on 15/9/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ActivityTableViewController.h"
#import "ActivityTableViewCell.h"
#import "Activity.h"
#import "ImageDownloader.h"
#import "AnextViewController.h"
@interface ActivityTableViewController ()

// 自定义array用来存放请求下来的数据
@property (nonatomic,strong)NSMutableArray *dataArr;

@property (nonatomic,strong)UIActivityIndicatorView *active;

@end

@implementation ActivityTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.active = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.active.center = CGPointMake(CGRectGetMaxX(self.view.frame) / 2, CGRectGetMaxY(self.view.frame) / 2);
    [self.active startAnimating];
    self.active.color = [UIColor blackColor];
    [self.view addSubview:self.active];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction) userInfo:nil repeats:NO];
    
    // 注册cell
    [self.tableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"activity"];
    self.navigationItem.title = @"活动";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav@2x.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    

}
-(void)timeAction
{
    [self.active stopAnimating];
    [self p_data];
}


// 请求数据
-(void)p_data
{
    
    self.dataArr = [NSMutableArray array];
    
    
    
    // 设置url
    NSURL *url = [[NSURL alloc]initWithString:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php"];
    // 设置request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    
    // 使用block函数请求数据
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        // 遍历数组
        for (NSDictionary *d in [dict objectForKey:@"events"]) {
            Activity *a = [[Activity alloc]init];
            // 取出数组中字典添加到model类中
            [a setValuesForKeysWithDictionary:d];
            
            // 再将类中数据依次存入数据
            [self.dataArr addObject:a];
            
            // 更新数据
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
    
    return 180;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activity" forIndexPath:indexPath];
    
    Activity *a = self.dataArr[indexPath.row];
    cell.titleLabel.text = a.title;
    
    // 将数据中的开始时间和结束时间拼接在一起
    NSString *time = [NSString stringWithString:[a.begin_time substringWithRange:NSMakeRange(5, 11)]];
    NSString *time2 = [time stringByAppendingString:@" -- "];
    NSString *time3 = [time2 stringByAppendingString:[a.end_time substringWithRange:NSMakeRange(5, 11)]];

    // 给各个控件赋值
    cell.timeLabel.text = time3;
//
    cell.addressLabel.text = a.address;
//
    cell.typeDataLabel.text = a.category_name;
    
    NSString *str = [NSString stringWithFormat:@"%ld",a.wisher_count];
//
    cell.interestDataLabel.text = str;///////////////
//
    NSString *str2 = [NSString stringWithFormat:@"%ld",a.participant_count];
    
    cell.joinDataLabel.text = str2;
// 图片加载
    NSURL *url = [NSURL URLWithString:a.image];
    
    [ImageDownloader getLoadingImageWithUrl:url imageBlock:^(NSData *data) {
        
        cell.myImage.image = [UIImage imageWithData:data];
        
    }];
    
    
    // Configure the cell...
    
    return cell;
}

// 设置点击事件,在点击cell后触发

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnextViewController *next = [[AnextViewController alloc]init];
    
    next.activity = self.dataArr[indexPath.row];
    
    [self.navigationController pushViewController:next animated:YES];
    
    
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
