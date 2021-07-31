//
//  SettingViewController.m
//  3.Share
//
//  Created by mac on 2021/7/29.
//  Copyright © 2021 mac. All rights reserved.
//

#import "SettingViewController.h"
#import "BasicInformationViewController.h"
#import "ChangePasswordViewController.h"
#import "MessageViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    _settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300) style:UITableViewStylePlain];
    [self.view addSubview:_settingTableView];
    _settingTableView.delegate = self;
    _settingTableView.dataSource = self;
    _settingTableView.bounces = NO;
    
    [_settingTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"information"];
    
    _settingArray = [NSArray arrayWithObjects:@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* normalCell = [_settingTableView dequeueReusableCellWithIdentifier:@"information" forIndexPath:indexPath];
    normalCell.selectionStyle = UITableViewCellSelectionStyleNone;
    normalCell.textLabel.text = _settingArray[indexPath.row];
    UIButton* moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    moreButton.frame = CGRectMake(290, 20, 60, 20);
    moreButton.enabled = NO;
    [normalCell.contentView addSubview:moreButton];
    return normalCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BasicInformationViewController* basicInformationViewController = [[BasicInformationViewController alloc] init];
        [self.navigationController pushViewController:basicInformationViewController animated:YES];
    } else if (indexPath.row == 1) {
        ChangePasswordViewController* changePasswordViewController = [[ChangePasswordViewController alloc] init];
        [self.navigationController pushViewController:changePasswordViewController animated:YES];
    } else if (indexPath.row == 2) {
        MessageViewController* messageViewController = [[MessageViewController alloc] init];
        [self.navigationController pushViewController:messageViewController animated:YES];
    } else if (indexPath.row == 3) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"提示" message:@"目前没有新内容！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    } else {
        
    }
}

@end
