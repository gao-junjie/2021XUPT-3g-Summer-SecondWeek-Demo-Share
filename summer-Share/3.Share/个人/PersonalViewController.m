//
//  PersonalViewController.m
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalFirstTableViewCell.h"
#import "MyDonwLoadViewController.h"
#import "ArticleViewController.h"
#import "MyInformationViewController.h"
#import "MyRecommendViewController.h"
#import "SettingViewController.h"
@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人信息";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    
    _personalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:_personalTableView];
    _personalTableView.delegate = self;
    _personalTableView.dataSource = self;
    
    [_personalTableView registerClass:[PersonalFirstTableViewCell class] forCellReuseIdentifier:@"first"];
    [_personalTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"second"];
    
    
    _personalArray = [NSArray arrayWithObjects:@"我上传的", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150;
    } else return 60;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PersonalFirstTableViewCell* personalFirstCell = [_personalTableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        personalFirstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return personalFirstCell;
    } else {
        UITableViewCell* personalSecondCell = [_personalTableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        personalSecondCell.selectionStyle = UITableViewCellSelectionStyleNone;
        personalSecondCell.textLabel.text = _personalArray[indexPath.row];
        personalSecondCell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img%lu.png",indexPath.row + 1]];
        personalSecondCell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"more.png"]];
        
        return personalSecondCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            MyDonwLoadViewController*  myDonwLoadViewController = [[MyDonwLoadViewController alloc]init];
            [self.navigationController pushViewController:myDonwLoadViewController animated:YES];
        } else if (indexPath.row == 1) {
            MyInformationViewController*  myInformationViewController = [[MyInformationViewController alloc]init];
            [self.navigationController pushViewController:myInformationViewController animated:YES];
        } else if (indexPath.row == 2) {
            MyRecommendViewController*  myRecommendViewController = [[MyRecommendViewController alloc]init];
            [self.navigationController pushViewController:myRecommendViewController animated:YES];
        } else if (indexPath.row == 3) {
            UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您目前没有通知" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [boomAlert addAction:boomAction];
            [self presentViewController:boomAlert animated:YES completion:nil];
        } else if (indexPath.row == 4) {
            SettingViewController*  settingViewController = [[SettingViewController alloc]init];
            [self.navigationController pushViewController:settingViewController animated:YES];
        }
    }
}
@end
