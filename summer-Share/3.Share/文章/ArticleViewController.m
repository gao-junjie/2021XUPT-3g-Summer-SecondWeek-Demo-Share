//
//  ArticleViewController.m
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ArticleViewController.h"

@interface ArticleViewController ()

@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"文章";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    
    NSArray* selectNameArray = [NSArray arrayWithObjects:@"精选文章", @"热门推荐", @"全部文章", nil];
    for (int i = 0; i < 3; i++) {
        UIButton* selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        selectButton.frame = CGRectMake(i * 5 + ([UIScreen mainScreen].bounds.size.width - 10) / 3 * i, 0, ([UIScreen mainScreen].bounds.size.width - 10) / 3, 40);
        selectButton.backgroundColor = [UIColor whiteColor];
        selectButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [selectButton setTitle:selectNameArray[i] forState:UIControlStateNormal];
        [selectButton setTitleColor:[UIColor lightGrayColor]forState:UIControlStateNormal];
        [selectButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1] forState:UIControlStateSelected];
        [selectButton setBackgroundImage:[UIImage imageNamed:@"background2_main.jpg"] forState:UIControlStateSelected];
        if (i == 0) {
            selectButton.selected = YES;
        } else {
            selectButton.selected = NO;
        }
        selectButton.tag = 1001 + i;
        [selectButton addTarget:self action:@selector(pressSelectButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:selectButton];
    }
    
    
    _articleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 210)];
    _articleScrollView.backgroundColor = [UIColor whiteColor];
    _articleScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height - 210);
    _articleScrollView.pagingEnabled = YES;
    _articleScrollView.bounces = NO;
    [self.view addSubview:_articleScrollView];
    _articleScrollView.delegate = self;
    
    
    _firstTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 210) style:UITableViewStylePlain];
    _firstTableView.tag = 155;
    [_articleScrollView addSubview:_firstTableView];
    _firstTableView.delegate = self;
    _firstTableView.dataSource = self;
    
    _secondTableView = [[UITableView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 210) style:UITableViewStylePlain];
    _secondTableView.tag = 156;
    [_articleScrollView addSubview:_secondTableView];
    _secondTableView.delegate = self;
    _secondTableView.dataSource = self;
    
    _thirdTableView = [[UITableView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 2, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 210) style:UITableViewStylePlain];
    _thirdTableView.tag = 157;
    [_articleScrollView addSubview:_thirdTableView];
    _thirdTableView.delegate = self;
    _thirdTableView.dataSource = self;
    
    [_firstTableView registerClass:[PhotoTableViewCell class] forCellReuseIdentifier:@"photo"];
    [_secondTableView registerClass:[PhotoTableViewCell class] forCellReuseIdentifier:@"photo"];
    [_thirdTableView registerClass:[PhotoTableViewCell class] forCellReuseIdentifier:@"photo"];
    
    
    _visitorNumberIntArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:658], [NSNumber numberWithInt:757], [NSNumber numberWithInt:364], [NSNumber numberWithInt:486], [NSNumber numberWithInt:564], nil];
    _shareNumberIntArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:64], [NSNumber numberWithInt:43], [NSNumber numberWithInt:9], [NSNumber numberWithInt:16], [NSNumber numberWithInt:33], nil];
    _themeArray = [NSArray arrayWithObjects:@"假日", @"国外画册欣赏", @"collection扁平设计", @"板式整理术：高效解决多风格要求", @"火影忍者", nil];
    _authorArray = [NSArray arrayWithObjects:@"share小白", @"share小王", @"share小吕", @"share小赵", @"share小高", nil];
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
    
    if (tableView.tag == 155) {
        _firstCell = [_firstTableView dequeueReusableCellWithIdentifier:@"photo" forIndexPath:indexPath];
        [_firstCell.photoButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"headPhoto%lu.jpg",indexPath.row + 1]] forState:UIControlStateNormal];
    } else if (tableView.tag == 156) {
        _firstCell = [_secondTableView dequeueReusableCellWithIdentifier:@"photo" forIndexPath:indexPath];
        [_firstCell.photoButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"headPhoto%lu.jpg",indexPath.row + 6]] forState:UIControlStateNormal];
    } else if (tableView.tag == 157) {
        _firstCell = [_thirdTableView dequeueReusableCellWithIdentifier:@"photo" forIndexPath:indexPath];
        [_firstCell.photoButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"headPhoto%lu.jpg",indexPath.row + 11]] forState:UIControlStateNormal];
    }
    
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
        _articleScrollView.contentOffset = CGPointMake(0, 0);
    } else if (button.tag == 1002) {
        _articleScrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    } else if (button.tag == 1003) {
        _articleScrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width * 2, 0);
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

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_articleScrollView.contentOffset.x <= [UIScreen mainScreen].bounds.size.width * 0.5) {
        for (int i = 0; i < 3; i++) {
            UIButton* elseButton = [self.view viewWithTag:1001 + i];
            if (i == 0) {
                [elseButton setSelected:YES];
            } else {
                [elseButton setSelected:NO];
            }
        }
    } else if (_articleScrollView.contentOffset.x <= [UIScreen mainScreen].bounds.size.width * 1.5) {
        for (int i = 0; i < 3; i++) {
            UIButton* elseButton = [self.view viewWithTag:1001 + i];
            if (i == 1) {
                [elseButton setSelected:YES];
            } else {
                [elseButton setSelected:NO];
            }
        }
    } else {
        for (int i = 0; i < 3; i++) {
            UIButton* elseButton = [self.view viewWithTag:1001 + i];
            if (i == 2) {
                [elseButton setSelected:YES];
            } else {
                [elseButton setSelected:NO];
            }
        }
    }
}

@end
