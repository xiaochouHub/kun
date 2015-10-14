//
//  StyleCollectionViewController.m
//  豌豆
//
//  Created by lanou3g on 15/9/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "StyleCollectionViewController.h"
#import "MyCollectionViewCell.h"
#import "Movie.h"
#import "MovieTableViewController.h"
#import "NextViewController.h"
#import "ImageDownloader.h"
@interface StyleCollectionViewController ()
@property(nonatomic,strong)NSMutableArray *dataArr;

@property (nonatomic,strong)MovieTableViewController *mc;
@property (nonatomic,strong)StyleCollectionViewController *sv;

@property (nonatomic,strong)UIActivityIndicatorView *active;

@end

@implementation StyleCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

self.active = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
self.active.center = CGPointMake(CGRectGetMaxX(self.view.frame) / 2, CGRectGetMaxY(self.view.frame) / 2);
[self.active startAnimating];
self.active.color = [UIColor blackColor];
[self.view addSubview:self.active];

[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction) userInfo:nil repeats:NO];
    
    
    
    [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    
//    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
//    
//    flowLayOut.itemSize = CGSizeMake(95, 140);
//    
//    flowLayOut.minimumInteritemSpacing = 10;
//    
//    flowLayOut.minimumLineSpacing = 50;
//    
//    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
//    
//    flowLayOut.sectionInset = UIEdgeInsetsMake(20, 20, 50, 20);
//    
//    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayOut];
//    
//    
//    collectionView.backgroundColor = [UIColor whiteColor];
//    
//    collectionView.delegate = self;
//    
//    collectionView.dataSource = self;
    
//    [collectionView registerClass:[StyleCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
//    [self p_data];
//    
//    [self.view addSubview:collectionView];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
        
    // Do any additional setup after loading the view.
}

-(void)timeAction
{
    [self.active stopAnimating];
    [self p_data];
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
            
            [self.collectionView reloadData];
            
        }
        
    }];
    NSLog(@"%@",self.dataArr);
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NextViewController *next = [[NextViewController alloc]init];
    Movie *m = self.dataArr[indexPath.row];
    next.movieid = m.movieId;
    [self.navigationController pushViewController:next animated:YES];
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Movie *m = self.dataArr[indexPath.row];
    
    NSURL *url = [NSURL URLWithString:m.pic_url];
    
    [ImageDownloader getLoadingImageWithUrl:url imageBlock:^(NSData *data) {
        cell.myImage.image = [UIImage imageWithData:data];
    }];
    cell.titleLabel.text = m.movieName;

    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
