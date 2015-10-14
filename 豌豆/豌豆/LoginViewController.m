//
//  LoginViewController.m
//  豌豆
//
//  Created by lanou3g on 15/9/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LoginViewController.h"
#import "NextViewController.h"
#import "RegisterViewController.h"
#import "DataBaseHandler.h"
#import "UserNameAndPassword.h"
#import "UserTableViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong)UILabel *userName;

@property (nonatomic,strong)UITextField *userNameText;

@property (nonatomic,strong)UIButton *login;

@property (nonatomic,strong)UILabel *password;

@property (nonatomic,strong)UITextField *passwordText;

@property (nonatomic,strong)UIButton *regester;



@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:150 / 255.0 green:150 / 255.0 blue:150 / 255.0 alpha:0];
    
    self.navigationItem.title = @"用户登录";
    
    self.userName = [[UILabel alloc]initWithFrame:CGRectMake(30, 60, 100, 30)];
    
//    self.userName.backgroundColor = [UIColor orangeColor];
    self.userName.text = @"用户名:";
    
    self.userName.font = [UIFont systemFontOfSize:20];
    
    [self.view addSubview:_userName];
    
    self.password = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.userName.frame), CGRectGetMaxY(self.userName.frame) + 30, CGRectGetWidth(self.userName.frame), CGRectGetHeight(self.userName.frame))];
    
    self.password.text = @"密码:";
    
    self.password.font = [UIFont systemFontOfSize:20];
    
    [self.view addSubview:_password];
    
    self.userNameText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.userName.frame), CGRectGetMinY(self.userName.frame), CGRectGetWidth(self.view.frame) - 160, CGRectGetHeight(self.userName.frame) + 5)];
    self.userNameText.backgroundColor = [UIColor whiteColor];
    self.userNameText.borderStyle = UITextBorderStyleRoundedRect;
    self.userNameText.placeholder = @"请输入用户名";
    
    [self.view addSubview:_userNameText];
    
    self.passwordText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.password.frame), CGRectGetMinY(self.password.frame), CGRectGetWidth(self.userNameText.frame), CGRectGetHeight(self.password.frame) + 5)];
    self.passwordText.backgroundColor = [UIColor whiteColor];
    self.passwordText.placeholder = @"请输入密码";
    self.passwordText.secureTextEntry = YES;
    self.passwordText.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_passwordText];
    
    self.login = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.login.frame = CGRectMake(CGRectGetMinX(self.password.frame), CGRectGetMaxY(self.password.frame) + 30, 140, 50);
    
    [self.login setTitle:@"登录" forState:UIControlStateNormal];
    
    [self.login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.login.layer.cornerRadius = 5;
    
    self.login.backgroundColor = [UIColor colorWithRed:150 / 255.0 green:190 / 255.0 blue:70 / 255.0 alpha:0.9];
    
    [self.view addSubview:_login];
    
    self.regester = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.regester.frame = CGRectMake(CGRectGetMaxX(self.login.frame) + 35, CGRectGetMinY(self.login.frame), CGRectGetWidth(self.login.frame), CGRectGetHeight(self.login.frame));
    
    [self.regester setTitle:@"注册" forState:UIControlStateNormal];
    
    self.regester.layer.cornerRadius = 5;
    
    [self.regester setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.regester.backgroundColor = [UIColor colorWithRed:220 / 255.0 green:130 / 255.0 blue:50 / 255.0 alpha:0.9];
    
    [self.view addSubview:_regester];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.userNameText.delegate = self;
    self.passwordText.delegate = self;
    
    [self.regester addTarget:self action:@selector(regesterAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.login addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)loginAction:(UIButton *)sender
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    UserTableViewController *u = [[UserTableViewController alloc]init];
    DataBaseHandler *dbh = [DataBaseHandler shareDataBase];
    
    [dbh openDataBase];

    
    NSArray *arr =[NSArray arrayWithArray:[dbh findUserByUserName:self.userNameText.text]];
    NSLog(@"%@",arr);
    
    for (UserNameAndPassword *user in arr) {
        if ([user.userName isEqualToString:self.userNameText.text] && [user.passWord isEqualToString:self.passwordText.text]) {
            UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"登录成功!" message:@"欢迎您!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            
            [a show];
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            
            u.connect = YES;
        }
        else if ([self.userNameText.text isEqualToString:@""] || [self.passwordText.text isEqualToString:@""])
        {
            UIAlertView *aa  = [[UIAlertView alloc]initWithTitle:@"用户名/密码不能为空!" message:@"请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            
            [aa show];
            
        }
        else if (![user.userName isEqualToString:self.userNameText.text] || ![user.passWord isEqualToString:self.passwordText.text])
        {
            UIAlertView *a2 = [[UIAlertView alloc]initWithTitle:@"用户名/密码输入错误!" message:@"请重新输入" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:@"取消", nil];
            
            [a2 show];
            
        }
        
//        else if (![self.passwordText.text isEqualToString:user.passWord])
//        {
//            UIAlertView *a2 = [[UIAlertView alloc]initWithTitle:@"密码输入错误!" message:@"请重新输入" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:@"取消", nil];
//            
//            [a2 show];
//            
//        }

        
    }
    
    if (arr == nil) {
        UIAlertView *aa  = [[UIAlertView alloc]initWithTitle:@"用户名/密码不能为空!" message:@"请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        
        [aa show];
    }
    
    
//    if ([self.userNameText.text isEqualToString:[ud objectForKey:@"userName"]] && [self.passwordText.text isEqualToString:[ud objectForKey:@"passWord"]]) {
//        UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"登录成功!" message:@"欢迎您!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//        
//        [a show];
//        
//        [self.navigationController popToRootViewControllerAnimated:YES];
//        
//    }
//    else if ([self.userNameText.text isEqualToString:@""] || [self.passwordText.text isEqualToString:@""])
//    {
//        UIAlertView *aa  = [[UIAlertView alloc]initWithTitle:@"用户名或密码不能为空!" message:@"请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//        
//        [aa show];
//        
//    }
//    else
//    {
//        UIAlertView *a2 = [[UIAlertView alloc]initWithTitle:@"输入错误!" message:@"请重新输入" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:@"取消", nil];
//        
//        [a2 show];
//        
//    }
    
}


-(void)regesterAction:(UIButton *)sender
{
    RegisterViewController *r = [[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:r animated:YES];
    
    
    
}

-(void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
