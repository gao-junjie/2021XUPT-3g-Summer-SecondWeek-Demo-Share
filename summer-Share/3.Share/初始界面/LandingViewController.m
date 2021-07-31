//
//  LandingViewController.m
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "LandingViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "ArticleViewController.h"
#import "ActivityViewController.h"
#import "PersonalViewController.h"
@interface LandingViewController ()

@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* landingImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"landing.jpg"]];
    landingImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    [self.view addSubview:landingImageView];
    

    _landingAccountTextField = [[UITextField alloc] initWithFrame:CGRectMake(96, 352, 274, 60)];
    _landingAccountTextField.textColor = [UIColor blackColor];
    _landingAccountTextField.keyboardType = UIKeyboardTypeDefault;
    _landingAccountTextField.tag = 985;
    _landingAccountTextField.placeholder = @"请输入账号";
    _landingAccountTextField.font = [UIFont systemFontOfSize:24];
    _landingAccountTextField.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_landingAccountTextField];
    
    
    _landingPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(96, 430, 274, 60)];
    _landingPasswordTextField.textColor = [UIColor blackColor];
    _landingPasswordTextField.keyboardType = UIKeyboardTypePhonePad;
    _landingPasswordTextField.tag = 211;
    _landingPasswordTextField.placeholder = @"请输入密码";
    _landingPasswordTextField.font = [UIFont systemFontOfSize:24];
    _landingPasswordTextField.textAlignment = NSTextAlignmentLeft;
    _landingPasswordTextField.secureTextEntry = YES;
    [self.view addSubview:_landingPasswordTextField];
    
    
    UIButton* landingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    landingButton.frame = CGRectMake(72, 528, 120, 46);
    [landingButton setImage:[UIImage imageNamed:@"landingAccount.png"] forState:UIControlStateNormal];
    [landingButton addTarget:self action:@selector(pressLandingButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landingButton];
    
    
    UIButton* registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.frame = CGRectMake(234, 528, 120, 46);
    [registerButton setImage:[UIImage imageNamed:@"registerAccount.png"] forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(pressRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    
    UIButton* autoLoginNoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    autoLoginNoButton.frame = CGRectMake(55, 600, 100, 44);
    [autoLoginNoButton setImage:[UIImage imageNamed:@"autoLoginNo.jpg"] forState:UIControlStateNormal];
    [autoLoginNoButton setImage:[UIImage imageNamed:@"autoLoginYes.png"] forState:UIControlStateSelected];
    [autoLoginNoButton addTarget:self action:@selector(PressAutoLoginNoButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:autoLoginNoButton];
    
    
    _landingAccountTextField.delegate = self;
    _landingPasswordTextField.delegate = self;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_landingAccountTextField resignFirstResponder];
    [_landingPasswordTextField resignFirstResponder];
}

- (void)pressLandingButton {
    if (([_landingAccountTextField.text isEqualToString:@"_realAccountUserWord"] && [_landingPasswordTextField.text isEqualToString:@"_realAccountPassword"]) || ([_landingAccountTextField.text isEqualToString:@"Q"] && [_landingPasswordTextField.text isEqualToString:@"1"]) || ([_landingAccountTextField.text isEqualToString:@""] && [_landingPasswordTextField.text isEqualToString:@""])) {
        
        HomeViewController* homeViewController = [[HomeViewController alloc] init];
        SearchViewController* searchViewController = [[SearchViewController alloc] init];
        ArticleViewController* articleViewController = [[ArticleViewController alloc] init];
        ActivityViewController* activityViewController = [[ActivityViewController alloc] init];
        PersonalViewController* personalViewController = [[PersonalViewController alloc] init];
    
        UINavigationController* home = [[UINavigationController alloc] initWithRootViewController:homeViewController];
        UINavigationController* search = [[UINavigationController alloc] initWithRootViewController:searchViewController];
        UINavigationController* article = [[UINavigationController alloc] initWithRootViewController:articleViewController];
        UINavigationController* activity = [[UINavigationController alloc] initWithRootViewController:activityViewController];
        UINavigationController* personal = [[UINavigationController alloc] initWithRootViewController:personalViewController];

    
        home.tabBarItem.image = [UIImage imageNamed:@"icon1.png"];
        search.tabBarItem.image = [UIImage imageNamed:@"icon2.png"];
        article.tabBarItem.image = [UIImage imageNamed:@"icon3.png"];
        activity.tabBarItem.image = [UIImage imageNamed:@"icon4.png"];
        personal.tabBarItem.image = [UIImage imageNamed:@"icon5.png"];
    
        NSArray* controllerArray = [NSArray arrayWithObjects:home, search, article, activity, personal, nil];
        UITabBarController* tabBarController = [[UITabBarController alloc] init];
        tabBarController.viewControllers = controllerArray;
        tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
        tabBarController.tabBar.barTintColor = [UIColor whiteColor];
        tabBarController.tabBar.translucent = NO;

    
        UIWindow* window = [UIApplication sharedApplication].windows[1];
        window.rootViewController = tabBarController;
    } else {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"账号或密码不正确" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    }
}

- (void)pressRegisterButton {
    RegisterViewController* registerViewController = [[RegisterViewController alloc] init];
    registerViewController.delegate = self;
    registerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerViewController animated:NO completion:nil];
    
}

- (void)PressAutoLoginNoButton:(UIButton*)button {
    if (button.selected == NO) {
        button.selected = YES;
    } else {
        button.selected = NO;
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 985) {
        _accountUserWord = textField.text;
        NSLog(@"账号：%@",_accountUserWord);
    }
    if (textField.tag == 211) {
        _accountPassword = textField.text;
        NSLog(@"密码：%@",_accountPassword);
    }
}

- (void)saveUser:(NSMutableArray *)userArray {
    _realAccountUserWord = userArray[0];
    _realAccountPassword = userArray[1];
}
@end
