//
//  MyRecommendViewController.m
//  3.Share
//
//  Created by mac on 2021/7/29.
//  Copyright © 2021 mac. All rights reserved.
//

#import "MyRecommendViewController.h"

@interface MyRecommendViewController ()

@end

@implementation MyRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我推荐的";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    _recommendTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 170) style:UITableViewStylePlain];
    [self.view addSubview:_recommendTableView];
    _recommendTableView.delegate = self;
    _recommendTableView.dataSource = self;
    [_recommendTableView registerClass:[PhotoTableViewCell class] forCellReuseIdentifier:@"photo"];
    
    
    _visitorNumberIntArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:658], [NSNumber numberWithInt:757], [NSNumber numberWithInt:364], [NSNumber numberWithInt:486], [NSNumber numberWithInt:564], nil];
    _shareNumberIntArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:85], [NSNumber numberWithInt:63], [NSNumber numberWithInt:37], [NSNumber numberWithInt:16], [NSNumber numberWithInt:9], nil];
    _themeArray = [NSArray arrayWithObjects:@"火遁：豪火球之术", @"秽土转生", @"神罗天征", @"水遁：水龙弹之术", @"须佐能乎", nil];
    _authorArray = [NSArray arrayWithObjects:@"share川木", @"share春野樱", @"share泉奈", @"share玖辛奈", @"share木叶闪光", nil];
    _styleArray = [NSArray arrayWithObjects:@"原创-插画-练习习作", @"平面设计——画册设计", @"平面设计——海报设计", @"平面设计——样式设计", @"原创-美术", nil];
    _timeArray = [NSArray arrayWithObjects:@"15分钟前", @"21分钟前", @"46分钟前", @"1小时前", @"一个月前", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 170;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _firstCell = [_recommendTableView dequeueReusableCellWithIdentifier:@"photo" forIndexPath:indexPath];
    [_firstCell.photoButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"headPhoto%lu.jpg",indexPath.row + 18]] forState:UIControlStateNormal];
    [_firstCell.photoButton setTitle:_timeArray[indexPath.row] forState:UIControlStateNormal];
    [_firstCell.photoButton addTarget:self action:@selector(pressFirstPhotoButton:) forControlEvents:UIControlEventTouchUpInside];
    _firstCell.photoButton.tag = 200 + indexPath.row;
    _firstCell.themeLabel.text = _themeArray[indexPath.row];
    _firstCell.authorLabel.text = _authorArray[indexPath.row];
    _firstCell.styleLabel.text = _styleArray[indexPath.row];
    
    _loveNumberInt = 645 - (int)indexPath.row * 82;
    _loveNumberString = [NSString stringWithFormat:@"%d",_loveNumberInt];
    NSString* cancelLoveNumberString = [NSString stringWithFormat:@"%d",_loveNumberInt - 1];
    [_firstCell.loveButton setTitle:cancelLoveNumberString forState:UIControlStateSelected];
    [_firstCell.loveButton setTitle:_loveNumberString forState:UIControlStateNormal];
    
        _visitorNumberString = [NSString    stringWithFormat:@"%d",[_visitorNumberIntArray[indexPath.row] intValue]];
    [_firstCell.visitorButton setTitle:_visitorNumberString forState:UIControlStateNormal];
    [_firstCell.visitorButton addTarget:self action:@selector(pressVisitorButton:) forControlEvents:UIControlEventTouchUpInside];
    _firstCell.visitorButton.tag = 700 + indexPath.row;
    
        _shareNumberString = [NSString stringWithFormat:@"%d",[_shareNumberIntArray[indexPath.row] intValue]];
    [_firstCell.shareButton setTitle:_shareNumberString forState:UIControlStateNormal];
    [_firstCell.shareButton addTarget:self action:@selector(pressShareButton:) forControlEvents:UIControlEventTouchUpInside];
    _firstCell.shareButton.tag = 800 + indexPath.row;
    
    return _firstCell;
    
}

- (void)pressSelectButton:(UIButton*)button {
    for (int i = 0; i < 3; i++) {
            UIButton* elseButton = [self.view viewWithTag:1001 + i];
            [elseButton setSelected:NO];
        }
    if (button.tag == 1001) {
        _recommendTableView.contentOffset = CGPointMake(0, 0);
    } else if (button.tag == 1002) {
        _recommendTableView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    } else if (button.tag == 1003) {
        _recommendTableView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width * 2, 0);
    }
    [button setSelected:YES];
}

- (void)pressVisitorButton:(UIButton*)button {
    for (int i = 0; i < 5; i++) {
        if (button.tag == 700 + i) {
            int temp = [_visitorNumberIntArray[i] intValue] + 1;
            _visitorNumberString = [NSString stringWithFormat:@"%d",temp];
            [button setTitle:_visitorNumberString forState:UIControlStateNormal];
            [_visitorNumberIntArray replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:temp]];
            break;
        }
    }
}

- (void)pressShareButton:(UIButton*)button {
    UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"提示" message:@"成功分享到朋友圈" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    }];
    [boomAlert addAction:boomAction];
    [self presentViewController:boomAlert animated:YES completion:nil];
    
    for (int i = 0; i < 5; i++) {
        if (button.tag == 800 + i) {
            int temp = [_shareNumberIntArray[i] intValue] + 1;
            _shareNumberString = [NSString stringWithFormat:@"%d",temp];
            [button setTitle:_shareNumberString forState:UIControlStateNormal];
            [_shareNumberIntArray replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:temp]];
            break;
        }
    }
}

- (void)pressFirstPhotoButton:(UIButton*) button {
    for (int i = 0; i < 5; i++) {
        if (button.tag == 200 + i) {
            UIButton* firstButton = [self.view viewWithTag:700 + i];
            int temp = [_visitorNumberIntArray[i] intValue] + 1;
            _visitorNumberString = [NSString stringWithFormat:@"%d",temp];
            [firstButton setTitle:_visitorNumberString forState:UIControlStateNormal];
            [_visitorNumberIntArray replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:temp]];
            break;
        }
    }
}
@end
