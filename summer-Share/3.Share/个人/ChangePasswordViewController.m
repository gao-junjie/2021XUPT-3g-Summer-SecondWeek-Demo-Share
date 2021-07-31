//
//  ChangePasswordViewController.m
//  3.Share
//
//  Created by mac on 2021/7/30.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改密码";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    _changeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 180) style:UITableViewStylePlain];
    [self.view addSubview:_changeTableView];
    _changeTableView.delegate = self;
    _changeTableView.dataSource = self;
    _changeTableView.bounces = NO;
    [_changeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"normal"];
    
    _tipArray = [NSArray arrayWithObjects:@"旧密码:", @"新密码:", @"确认密码:", nil];
    
    _beNewTextField = [[UITextField alloc] initWithFrame:CGRectMake(130, 0, 300, 60)];
    _beNewTextField.placeholder = @"6～20英文或数字组合";
    
    _oldTextField = [[UITextField alloc] initWithFrame:CGRectMake(130, 0, 300, 60)];
    _oldTextField.placeholder = @"6～20英文或数字组合";
    
    _againNewTextField = [[UITextField alloc] initWithFrame:CGRectMake(130, 0, 300, 60)];
    _againNewTextField.placeholder = @"请再次确认输入密码";
    
    _confirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_confirmButton setTitle:@"提交" forState:UIControlStateNormal];
    [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_confirmButton setBackgroundColor:[UIColor blackColor]];
    _confirmButton.frame = CGRectMake(170, 220, 80, 29);
    [_confirmButton addTarget:self action:@selector(pressConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_confirmButton];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* normolCell = [_changeTableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
    normolCell.selectionStyle = UITableViewCellSelectionStyleNone;
    normolCell.textLabel.text = _tipArray[indexPath.row];
    if (indexPath.row == 0) {
        [normolCell.contentView addSubview:_oldTextField];
    } else if (indexPath.row == 1) {
        [normolCell.contentView addSubview:_beNewTextField];
    } else if (indexPath.row == 2) {
        [normolCell.contentView addSubview:_againNewTextField];
    }
    
    
    return normolCell;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_oldTextField resignFirstResponder];
    [_beNewTextField resignFirstResponder];
    [_againNewTextField resignFirstResponder];
}

-(void)pressConfirmButton {
    if ((([_oldTextField.text length] >= 6 && [_oldTextField.text length] <= 20) && ([_beNewTextField.text length] >= 6 && [_beNewTextField.text length] <= 20)) && ([_againNewTextField.text length] >= 6 && [_againNewTextField.text length] <= 20)) {
        if ([_beNewTextField.text isEqualToString:_againNewTextField.text]) {
            UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"提示" message:@"修改成功！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self.navigationController popViewControllerAnimated:YES];}];
            [boomAlert addAction:boomAction];
            [self presentViewController:boomAlert animated:YES completion:nil];
        } else {
            UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"两次输入的密码不相同" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            }];
            [boomAlert addAction:boomAction];
            [self presentViewController:boomAlert animated:YES completion:nil];
        }
    } else {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"输入格式不正确" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    }
}
@end
