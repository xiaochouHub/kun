//
//  CinemaTableViewController.m
//  豌豆
//
//  Created by lanou3g on 15/9/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CinemaTableViewController.h"
#import "CinemaTableViewCell.h"
#import "Cinema.h"
@interface CinemaTableViewController ()<NSURLConnectionDataDelegate>

@property (nonatomic,strong)Cinema *cinemaData;

@property (nonatomic,strong)NSMutableArray *dataArr;

@property (nonatomic,strong)UIActivityIndicatorView *active;

@end

@implementation CinemaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

self.active = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
self.active.center = CGPointMake(CGRectGetMaxX(self.view.frame) / 2, CGRectGetMaxY(self.view.frame) / 2);
[self.active startAnimating];
self.active.color = [UIColor blackColor];
[self.view addSubview:self.active];

[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction) userInfo:nil repeats:NO];
    
    
    [self.tableView registerClass:[CinemaTableViewCell class] forCellReuseIdentifier:@"cinema"];
    
    self.navigationItem.title = @"影院";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav@2x.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    
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


-(void)p_data
{
    self.cinemaData = [[Cinema alloc]init];
    self.dataArr = [NSMutableArray array];
    
    NSURL *url = [[NSURL alloc]initWithString:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/cinemalist.php"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *dic = [dict objectForKey:@"result"];
        
        for (NSDictionary *d in [dic objectForKey:@"data"]) {
            Cinema *c = [[Cinema alloc]init];
            
            [c setValuesForKeysWithDictionary:d];
            
            [self.dataArr addObject:c];
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
    
    return 140;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CinemaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cinema" forIndexPath:indexPath];
    
    Cinema *c = self.dataArr[indexPath.row];
    
    cell.titleLabel.text = c.cinemaName;
    cell.dataLabel.text = c.address;
    cell.numLabel.text = c.telephone;
    
    // Configure the cell...
    
    return cell;
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
