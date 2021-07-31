//
//  MyInformationViewController.m
//  3.Share
//
//  Created by mac on 2021/7/29.
//  Copyright © 2021 mac. All rights reserved.
//

#import "MyInformationViewController.h"
#import "NewAttentionViewController.h"
@interface MyInformationViewController ()

@end

@implementation MyInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的信息";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    _myInformationTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300) style:UITableViewStylePlain];
    _myInformationTableView.bounces = NO;
    [self.view addSubview:_myInformationTableView];
    _myInformationTableView.delegate = self;
    _myInformationTableView.dataSource = self;
    
    [_myInformationTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"information"];
    
    _informationArray = [NSArray arrayWithObjects:@"评论", @"我的推荐", @"新关注的", @"私信", @"活动通知", nil];
    _informationNumberArray = [NSArray arrayWithObjects:@"   7", @"   9", @"   5", @"   4", @"   1", nil];
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
    UITableViewCell* normalCell = [_myInformationTableView dequeueReusableCellWithIdentifier:@"information" forIndexPath:indexPath];
    normalCell.selectionStyle = UITableViewCellSelectionStyleNone;
    normalCell.textLabel.text = _informationArray[indexPath.row];
    normalCell.textLabel.font = [UIFont systemFontOfSize:19];
    UIButton* moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1] forState:UIControlStateNormal];
    [moreButton setTitle:_informationNumberArray[indexPath.row] forState:UIControlStateNormal];
    moreButton.frame = CGRectMake(290, 20, 60, 20);
    moreButton.enabled = NO;
    [normalCell.contentView addSubview:moreButton];
    return normalCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        NewAttentionViewController* newAttentionViewController = [[NewAttentionViewController alloc] init];
        [self.navigationController pushViewController:newAttentionViewController animated:YES];
    } else if (indexPath.row == 3) {
        
    } else {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"提示" message:@"目前没有新内容！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    }
}
@end
