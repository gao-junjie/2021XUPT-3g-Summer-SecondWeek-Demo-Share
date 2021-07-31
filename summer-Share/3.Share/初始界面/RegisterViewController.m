//
//  RegisterViewController.m
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* registerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"register.jpg"]];
    registerImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    [self.view addSubview:registerImageView];
    
    
    _registerEmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(96, 332, 274, 60)];
    _registerEmailTextField.textColor = [UIColor blackColor];
    _registerEmailTextField.keyboardType = UIKeyboardTypeDefault;
    _registerEmailTextField.placeholder = @"请输入邮箱";
    _registerEmailTextField.tag = 6666;
    _registerEmailTextField.font = [UIFont systemFontOfSize:24];
    _registerEmailTextField.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_registerEmailTextField];
    
    
    _registerAccountTextField = [[UITextField alloc] initWithFrame:CGRectMake(96, 414, 274, 60)];
    _registerAccountTextField.textColor = [UIColor blackColor];
    _registerAccountTextField.keyboardType = UIKeyboardTypeDefault;
    _registerAccountTextField.tag = 985;
    _registerAccountTextField.placeholder = @"请输入账号";
    _registerAccountTextField.font = [UIFont systemFontOfSize:24];
    _registerAccountTextField.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_registerAccountTextField];
    
    _registerPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(96, 500, 274, 60)];
    _registerPasswordTextField.textColor = [UIColor blackColor];
    _registerPasswordTextField.keyboardType = UIKeyboardTypePhonePad;
    _registerPasswordTextField.tag = 211;
    _registerPasswordTextField.placeholder = @"请输入密码";
    _registerPasswordTextField.font = [UIFont systemFontOfSize:24];
    _registerPasswordTextField.textAlignment = NSTextAlignmentLeft;
    _registerPasswordTextField.secureTextEntry = YES;
    [self.view addSubview:_registerPasswordTextField];
    
    
    UIButton* confirmRegisterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmRegisterButton.frame = CGRectMake(123, 604, 190, 120);
    [confirmRegisterButton setImage:[UIImage imageNamed:@"registerButton.png"] forState:UIControlStateNormal];
    [confirmRegisterButton addTarget:self action:@selector(pressConfirmRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmRegisterButton];
    
    _registerEmailTextField.delegate = self;
    _registerAccountTextField.delegate = self;
    _registerPasswordTextField.delegate = self;
    _userArray = [[NSMutableArray alloc] init];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_registerEmailTextField resignFirstResponder];
    [_registerAccountTextField resignFirstResponder];
    [_registerPasswordTextField resignFirstResponder];
}


- (void)pressConfirmRegisterButton {
    if ([_registerEmail isEqualToString:@""] || [_registerPassword isEqualToString:@""] || [_registerUserWord isEqualToString:@""] || _registerUserWord == nil || _registerEmail == nil || _registerPassword == nil) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"请正确填写信息" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    } else {
        
        [_userArray addObject:_registerUserWord];
        [_userArray addObject:_registerPassword];
        NSLog(@"%@",_userArray[0]);
        NSLog(@"%@",_userArray[1]);
        [_delegate saveUser:_userArray];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.tag == 6666) {
        _registerEmail = textField.text;
        NSLog(@"邮箱：%@",_registerEmail);
    }
    if (textField.tag == 985) {
        _registerUserWord = textField.text;
        NSLog(@"账号：%@",_registerUserWord);
    }
    if (textField.tag == 211) {
        _registerPassword = textField.text;
        NSLog(@"密码：%@",_registerPassword);
    }
    
}

@end
