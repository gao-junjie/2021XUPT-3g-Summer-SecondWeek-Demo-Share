//
//  BasicInformationViewController.m
//  3.Share
//
//  Created by mac on 2021/7/30.
//  Copyright © 2021 mac. All rights reserved.
//

#import "BasicInformationViewController.h"

@interface BasicInformationViewController ()

@end

@implementation BasicInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"基本资料";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    _basicInformationTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 340) style:UITableViewStylePlain];
    [self.view addSubview:_basicInformationTableView];
    _basicInformationTableView.delegate = self;
    _basicInformationTableView.dataSource = self;
    _basicInformationTableView.bounces = NO;
    
    [_basicInformationTableView registerClass:[BasicInformationTableViewCell class] forCellReuseIdentifier:@"basic"];
    [_basicInformationTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"normal"];
    
    _tipArray = [NSArray arrayWithObjects:@"昵称", @"签名", @"性别", @"邮箱", nil];
    _detailArray = [NSArray arrayWithObjects:@"share柱哥", @"csgo也阻挡不了我成为编程带师", @" ", @"186####3@qq.com", nil];
    
    _manButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_manButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
    [_manButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateSelected];
    [_manButton setTitle:@"男" forState:UIControlStateNormal];
    [_manButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _manButton.selected = YES;
    _manButton.tag = 200;
    [_manButton addTarget:self action:@selector(pressManButton:) forControlEvents:UIControlEventTouchUpInside];
    _manButton.frame = CGRectMake(100, 18, 42, 30);
    
    _womanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_womanButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
    [_womanButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateSelected];
    [_womanButton setTitle:@"女" forState:UIControlStateNormal];
    [_womanButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _womanButton.selected = NO;
    _womanButton.tag = 201;
    [_womanButton addTarget:self action:@selector(pressWomanButton:) forControlEvents:UIControlEventTouchUpInside];
    _womanButton.frame = CGRectMake(164, 18, 42, 30);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0)  {
        return 100;
    } else {
        return 60;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UILabel* elseDeleteLabel = [[UILabel alloc] init];
    elseDeleteLabel.backgroundColor = [UIColor lightGrayColor];
    UIImageView* headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"realHeadPhoto.gif"]];
    [headImageView.layer setMasksToBounds:YES];
    [headImageView.layer setCornerRadius:12.0];
    
    if (indexPath.row == 0) {
        UITableViewCell* normolCell = [_basicInformationTableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
        normolCell.textLabel.text = _tipArray[indexPath.row];
        elseDeleteLabel.frame = CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 1);;
        headImageView.frame = CGRectMake(100, 10, 80, 80);
        [normolCell.contentView addSubview:elseDeleteLabel];
        [normolCell.contentView addSubview:headImageView];
        return normolCell;
    }
    else {
        BasicInformationTableViewCell* firstCell = [_basicInformationTableView dequeueReusableCellWithIdentifier:@"basic" forIndexPath:indexPath];
        
        firstCell.tipLabel.text = _tipArray[indexPath.row - 1];
        firstCell.detailLabel.text = _detailArray[indexPath.row - 1];
        
        if (indexPath.row == 3) {
            [firstCell.contentView addSubview:_manButton];
            [firstCell.contentView addSubview:_womanButton];
        }
        return firstCell;
    }
}

- (void)pressManButton:(UIButton*) button {
    UIButton* elseButton = [self.view viewWithTag:201];
    if (button.selected == NO) {
        button.selected = YES;
        elseButton.selected = NO;
    }
}

- (void)pressWomanButton:(UIButton*) button {
    UIButton* elseButton = [self.view viewWithTag:200];
    if (button.selected == NO) {
        button.selected = YES;
        elseButton.selected = NO;
    }
}

@end
