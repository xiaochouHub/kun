//
//  RegisterViewController.m
//  豌豆
//
//  Created by lanou3g on 15/9/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RegisterViewController.h"
#import "DataBaseHandler.h"
#import "UserNameAndPassword.h"

@interface RegisterViewController ()


@property (nonatomic,strong)UILabel *userNameLabel;
@property (nonatomic,strong)UITextField *userNameText;

@property (nonatomic,strong)UILabel *passwordLabel;
@property (nonatomic,strong)UITextField *passwordText;

@property (nonatomic,strong)UILabel *passwordLabel2;
@property (nonatomic,strong)UITextField *passwordText2;

@property (nonatomic,strong)UIButton *confirmButton;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 100, 30)];
    self.userNameLabel.text = @"用户名";
//    self.userNameLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_userNameLabel];
    
    self.userNameText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.userNameLabel.frame), CGRectGetMinY(self.userNameLabel.frame), CGRectGetWidth(self.view.frame) - 160, CGRectGetHeight(self.userNameLabel.frame) + 5)];
    self.userNameText.borderStyle = UITextBorderStyleRoundedRect;
//    self.userNameText.backgroundColor = [UIColor lightGrayColor];
    self.userNameText.placeholder = @"请输入用户名";
    [self.view addSubview:_userNameText];
    
    self.passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.userNameLabel.frame), CGRectGetMaxY(self.userNameLabel.frame) + 30, CGRectGetWidth(self.userNameLabel.frame), CGRectGetHeight(self.userNameLabel.frame))];
    
    self.passwordLabel.text = @"密码";
//    self.passwordLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_passwordLabel];
    
    self.passwordText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.passwordLabel.frame), CGRectGetMinY(self.passwordLabel.frame), CGRectGetWidth(self.userNameText.frame), CGRectGetHeight(self.passwordLabel.frame) + 5)];
    self.passwordText.borderStyle = UITextBorderStyleRoundedRect;
//    self.passwordText.backgroundColor = [UIColor lightGrayColor];
    self.passwordText.placeholder = @"请输入密码";
    [self.view addSubview:_passwordText];
    
    self.passwordLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.passwordLabel.frame), CGRectGetMaxY(self.passwordLabel.frame) + 30, CGRectGetWidth(self.passwordLabel.frame), CGRectGetHeight(self.passwordLabel.frame))];
    self.passwordLabel2.text = @"确认密码";
    
    [self.view addSubview:_passwordLabel2];
    
    self.passwordText2 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.passwordLabel2.frame), CGRectGetMinY(self.passwordLabel2.frame), CGRectGetWidth(self.passwordText.frame), CGRectGetHeight(self.passwordText.frame))];
    self.passwordText2.borderStyle = UITextBorderStyleRoundedRect;
//    self.passwordText2.backgroundColor = [UIColor lightGrayColor];
    self.passwordText2.placeholder = @"请再次输入";
    [self.view addSubview:_passwordText2];
    
    
    
    self.confirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.confirmButton.frame  = CGRectMake(CGRectGetMaxX(self.view.frame) / 3, CGRectGetMaxY(self.view.frame) - 400, 140, 50);
    self.confirmButton.layer.cornerRadius = 5;
    self.confirmButton.backgroundColor = [UIColor orangeColor];
    [self.confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:_confirmButton];
    
    [self.confirmButton addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)confirmAction:(UIButton *)sender
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    DataBaseHandler *dbh = [DataBaseHandler shareDataBase];
    
    UserNameAndPassword *userdata = [[UserNameAndPassword alloc]init];
    
    [user setObject:self.userNameText.text forKey:@"userName"];
    [user setObject:self.passwordText.text forKey:@"passWord"];
    [user setObject:self.passwordText2.text forKey:@"passWord2"];
    
    NSArray *arr = [NSArray arrayWithArray:[dbh findUserByUserName:self.userNameText.text]];
    
    NSMutableArray *arr2 = [NSMutableArray array];
    
    for (UserNameAndPassword *userdata in arr) {
        if ([self.passwordText.text isEqualToString:self.passwordText2.text] && ![self.userNameText.text isEqualToString:@""] && ![self.passwordText.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"注册成功!" message:@"请登陆!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            
            
            [alert show];
            [self.navigationController popViewControllerAnimated:YES];

        }
        else if ([self.userNameText.text isEqualToString:@""] && [self.passwordText.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"用户名或密码不能为空!" message:@"请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            
            [alert show];
        }
        else if ([self.userNameText.text isEqualToString:userdata.userName])
                  {
                      UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"此用户名已存在!" message:@"请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                      
                      [alert show];
                      
                  }
                  else
                  {
                      
                      UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"输入密码不一致" message:@"请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                      
                      [alert show];
                  }

    }

    
//    if ([self.passwordText.text isEqualToString:self.passwordText2.text] && ![self.userNameText.text isEqualToString:@""] && ![self.passwordText.text isEqualToString:@""]) {
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//    else if ([self.userNameText.text isEqualToString:@""] && [self.passwordText.text isEqualToString:@""])
//    {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"用户名或密码不能为空!" message:@"请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//        
//        [alert show];
//    }
//    else if ([self.userNameText.text isEqualToString:userdata.userName)
//    {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"此用户名已存在!" message:@"请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//        
//        [alert show];
//        
//    }
//    else
//    {
//        
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"输入密码不一致" message:@"请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//        
//        [alert show];
//    }
//    
    
    ////////////// 数据库
    
    
    [dbh openDataBase];
    
    [dbh createTabel];
    
    
    
    if ([self.passwordText.text isEqualToString:self.passwordText2.text] && ![self.userNameText.text isEqualToString:@""] && ![self.passwordText.text isEqualToString:@""]) {
        userdata.userName = self.userNameText.text;
        
        userdata.passWord = self.passwordText.text;
        
        [dbh insertStudent:userdata];
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
