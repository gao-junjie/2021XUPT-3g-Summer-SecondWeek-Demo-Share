//
//  SearchViewController.m
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "SearchViewController.h"
#import "BigWhiteViewController.h"
#import "UploadViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"搜索";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    UIBarButtonItem* uploadBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shangchuan.png"] style:UIBarButtonItemStyleDone target:self action:@selector(pressRightBarButtonItem)];
    self.navigationItem.rightBarButtonItem = uploadBarButton;
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 20, [UIScreen mainScreen].bounds.size.width - 10, 45)];
    _searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    _searchTextField.backgroundColor = [UIColor whiteColor];
    _searchTextField.keyboardType = UIKeyboardTypeDefault;
    _searchTextField.placeholder = @"搜索 用户名 作品分类 文章";
    _searchTextField.textColor = [UIColor blackColor];
    _searchTextField.font = [UIFont systemFontOfSize:19];
    _searchTextField.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_searchTextField];
    
    
    UIButton* searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    searchButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 63, 23, 60, 40);
    [searchButton setTitle:@"🔍" forState:UIControlStateNormal];
    searchButton.titleLabel.font = [UIFont systemFontOfSize:24];
    searchButton.backgroundColor = [UIColor clearColor];
    [searchButton addTarget:self action:@selector(pressSearchButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
    
    
    UILabel* classificationLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 100, 90, 35)];
    classificationLabel.text = @"` 分类";
    classificationLabel.textColor = [UIColor whiteColor];
    classificationLabel.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.83 alpha:1];
    classificationLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:classificationLabel];
    
    
    UILabel* recommendLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 260, 90, 35)];
    recommendLabel.text = @"` 推荐";
    recommendLabel.textColor = [UIColor whiteColor];
    recommendLabel.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.83 alpha:1];
    recommendLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:recommendLabel];
    
    UILabel* timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 375, 90, 35)];
    timeLabel.text = @"` 时间";
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.83 alpha:1];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:timeLabel];
    
    
    UIImageView* firstSearchlogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_button.png"]];
    UIImageView* secondSearchlogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_button.png"]];
    UIImageView* thirdSearchlogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_button.png"]];
    UIImageView* firstLinelogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_line.png"]];
    UIImageView* secondLinelogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_line.png"]];
    UIImageView* thirdLinelogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_line.png"]];
    
    
    firstSearchlogo.frame = CGRectMake(0, 0, 28, 28);
    secondSearchlogo.frame = CGRectMake(0, 0, 28, 28);
    thirdSearchlogo.frame = CGRectMake(0, 0, 28, 28);
    firstLinelogo.frame = CGRectMake(5, 130, [UIScreen mainScreen].bounds.size.width - 10, 5);
    secondLinelogo.frame = CGRectMake(5, 290, [UIScreen mainScreen].bounds.size.width - 10, 5);
    thirdLinelogo.frame = CGRectMake(5, 405, [UIScreen mainScreen].bounds.size.width - 10, 5);
    
    [classificationLabel addSubview:firstSearchlogo];
    [recommendLabel addSubview:secondSearchlogo];
    [timeLabel addSubview:thirdSearchlogo];
    [self.view addSubview:firstLinelogo];
    [self.view addSubview:secondLinelogo];
    [self.view addSubview:thirdLinelogo];
    
    NSArray* classificationName = [NSArray arrayWithObjects:@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟与设计", @"影视", @"摄影", @"其他", nil];
    NSArray* recommendName = [NSArray arrayWithObjects:@"人气最高", @"收藏最多", @"评论最多", @"编辑精选", nil];
    NSArray* timeName = [NSArray arrayWithObjects:@"30分钟前", @"1小时前", @"1个月前", @"1年前", nil];
    
    for (int i = 0; i < 8; i++) {
        UIButton* classificationButton  = [UIButton buttonWithType:UIButtonTypeSystem];
        [classificationButton setBackgroundImage:[UIImage imageNamed:@"background_main.png"] forState:UIControlStateSelected];
        classificationButton.backgroundColor = [UIColor whiteColor];
        [classificationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [classificationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [classificationButton setTitle:classificationName[i] forState:UIControlStateNormal];
        classificationButton.frame = CGRectMake(5 * (i % 4 + 1) + (([UIScreen mainScreen].bounds.size.width - 5) / 4 - 5) * (i % 4), 155 + 40 * (i / 4), ([UIScreen mainScreen].bounds.size.width - 5) / 4 - 5, 30);
        [classificationButton.layer setMasksToBounds:YES];
        [classificationButton.layer setCornerRadius:8.0];
        [classificationButton addTarget:self action:@selector(pressClassificationButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:classificationButton];
    }
    
    for (int i = 0; i < 4; i++) {
        UIButton* recommendButton  = [UIButton buttonWithType:UIButtonTypeSystem];
        [recommendButton setBackgroundImage:[UIImage imageNamed:@"background_main.png"] forState:UIControlStateSelected];
        recommendButton.backgroundColor = [UIColor whiteColor];
        [recommendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [recommendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [recommendButton setTitle:recommendName[i] forState:UIControlStateNormal];
        recommendButton.frame = CGRectMake(5 * (i % 4 + 1) + (([UIScreen mainScreen].bounds.size.width - 5) / 4 - 5) * (i % 4), 316, ([UIScreen mainScreen].bounds.size.width - 5) / 4 - 5, 30);
        [recommendButton.layer setMasksToBounds:YES];
        [recommendButton.layer setCornerRadius:8.0];
        [recommendButton addTarget:self action:@selector(pressRecommendButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:recommendButton];
    }
    
    for (int i = 0; i < 4; i++) {
        UIButton* timeButton  = [UIButton buttonWithType:UIButtonTypeSystem];
        [timeButton setBackgroundImage:[UIImage imageNamed:@"background_main.png"] forState:UIControlStateSelected];
        timeButton.backgroundColor = [UIColor whiteColor];
        [timeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [timeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [timeButton setTitle:timeName[i] forState:UIControlStateNormal];
        timeButton.frame = CGRectMake(5 * (i % 4 + 1) + (([UIScreen mainScreen].bounds.size.width - 5) / 4 - 5) * (i % 4), 427, ([UIScreen mainScreen].bounds.size.width - 5) / 4 - 5, 30);
        [timeButton.layer setMasksToBounds:YES];
        [timeButton.layer setCornerRadius:8.0];
        [timeButton addTarget:self action:@selector(pressTimeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:timeButton];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchTextField resignFirstResponder];
}


- (void)pressSearchButton {
    [_searchTextField resignFirstResponder];
    if ([_searchTextField.text isEqualToString:@"大白"]) {
        BigWhiteViewController* bigWhiteViewController = [[BigWhiteViewController alloc] init];
        [self presentViewController:bigWhiteViewController animated:YES completion:nil];
    }
}

- (void)pressClassificationButton:(UIButton*)button {
    if (button.selected == NO) {
        button.selected = YES;
    } else {
        button.selected = NO;
    }
}

- (void)pressRecommendButton:(UIButton*)button {
    if (button.selected == NO) {
        button.selected = YES;
    } else {
        button.selected = NO;
    }
}

- (void)pressTimeButton:(UIButton*)button {
    if (button.selected == NO) {
        button.selected = YES;
    } else {
        button.selected = NO;
    }
}

- (void)pressRightBarButtonItem {
    UploadViewController* uploadViewController = [[UploadViewController alloc] init];
    [self.navigationController pushViewController:uploadViewController animated:YES];
}
@end
