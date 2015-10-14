//
//  UserTableViewController.m
//  豌豆
//
//  Created by lanou3g on 15/9/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "UserTableViewController.h"
#import "UserTableViewCell.h"
#import "LoginViewController.h"
#import "TitleTableViewController.h"
@interface UserTableViewController ()

@property (nonatomic,strong)UIActivityIndicatorView *active;

@end

@implementation UserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    

self.active = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
self.active.center = CGPointMake(CGRectGetMaxX(self.view.frame) / 2, CGRectGetMaxY(self.view.frame) / 2);
[self.active startAnimating];
self.active.color = [UIColor blackColor];
[self.view addSubview:self.active];

[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction) userInfo:nil repeats:NO];

    
    
    [self.tableView registerClass:[UserTableViewCell class] forCellReuseIdentifier:@"user"];
    
    self.navigationItem.title = @"用户";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav@2x.png"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    
    self.connect = NO;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)timeAction
{
    [self.active stopAnimating];
}

-(void)rightAction:(UIBarButtonItem *)sender
{
    LoginViewController *login = [[LoginViewController alloc]init];
    
    if (self.connect == NO) {
        [self.navigationController pushViewController:login animated:YES];
    }
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LoginViewController *login = [[LoginViewController alloc]init];
    TitleTableViewController *tv = [[TitleTableViewController alloc]init];
    
    if (self.connect == NO) {
        [self.navigationController pushViewController:login animated:YES];
    }
    
    [self.navigationController pushViewController:tv animated:YES];
    
    
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
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"user" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"我的活动";
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"我的电影";
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"清除缓存";
        
    }
    
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
