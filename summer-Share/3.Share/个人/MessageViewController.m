//
//  MessageViewController.m
//  3.Share
//
//  Created by mac on 2021/7/30.
//  Copyright © 2021 mac. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    self.navigationItem.title = @"消息设置";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    _messageTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300) style:UITableViewStylePlain];
    [self.view addSubview:_messageTableView];
    _messageTableView.delegate = self;
    _messageTableView.dataSource = self;
    _messageTableView.bounces = NO;
    
    [_messageTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"normal"];
    
    _tipArray = [NSArray arrayWithObjects:@"接受所有新消息通知", @"通知显示栏", @"声音", @"振动", @"关注更新", nil];
    
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
    UITableViewCell* normolCell = [_messageTableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
    _stateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_stateButton setImage:[UIImage imageNamed:@"my_button_normal.png"] forState:UIControlStateNormal];
    [_stateButton setImage:[UIImage imageNamed:@"my_button_pressed.png"] forState:UIControlStateSelected];
    [_stateButton addTarget:self action:@selector(pressStateButton:) forControlEvents:UIControlEventTouchUpInside];
    _stateButton.frame = CGRectMake(340, 18, 30, 30);
    normolCell.selectionStyle = UITableViewScrollPositionNone;
    normolCell.textLabel.text = _tipArray[indexPath.row];
    [normolCell.contentView addSubview:_stateButton];
    
    return normolCell;
}

- (void)pressStateButton:(UIButton*)button {
    if (button.selected == NO) {
        button.selected = YES;
    } else {
        button.selected = NO;
    }
}
@end
