//
//  NewAttentionViewController.m
//  3.Share
//
//  Created by mac on 2021/7/29.
//  Copyright © 2021 mac. All rights reserved.
//

#import "NewAttentionViewController.h"
#import "NewAttentionTableViewCell.h"
@interface NewAttentionViewController ()

@end

@implementation NewAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"新关注的";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    _attentionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:_attentionTableView];
    _attentionTableView.delegate = self;
    _attentionTableView.dataSource = self;
    
    [_attentionTableView registerClass:[NewAttentionTableViewCell class] forCellReuseIdentifier:@"attention"];
    
    _nameArray = [NSArray arrayWithObjects:@"share小🐷", @"share小🐱", @"share小🐶", @"share小🐘", @"share小🐼", @"share小🐒", nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewAttentionTableViewCell* attentionCell = [_attentionTableView dequeueReusableCellWithIdentifier:@"attention" forIndexPath:indexPath];
    [attentionCell.elseHeadPhotoImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"headPhoto%lu.jpg", indexPath.row + 16]]];
    attentionCell.elseNameLabel.text = _nameArray[indexPath.row];
    
    return attentionCell;
}

@end
