//
//  ActivityViewController.m
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"活动";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    
    UIScrollView* activityScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    activityScrollView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    activityScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 100);
    activityScrollView.alwaysBounceHorizontal = NO;
    [self.view addSubview:activityScrollView];
    
    
    NSArray* activityArray = [NSArray arrayWithObjects:@"下厨也要美美的，从一条围裙开始——六月创意设计大赛", @"MIUI主题市场让你的创意改变世界", @"千万花粉为你而来", nil];
    for (int i = 0; i < 3; i++) {
        UIImageView* activityImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"main_img%d.png", i + 1]]];
        activityImageView.frame = CGRectMake(5, 240 * i + 15 * (i + 1), [UIScreen mainScreen].bounds.size.width - 10, 200);
        [activityScrollView addSubview:activityImageView];
        
        UILabel* activityLabel = [[UILabel alloc] init];
        activityLabel.text = activityArray[i];
        activityLabel.font = [UIFont systemFontOfSize:15];
        activityLabel.backgroundColor = [UIColor whiteColor];
        activityLabel.frame = CGRectMake(5, 215 * (i + 1) + 40 * i, [UIScreen mainScreen].bounds.size.width - 10, 40);
        [activityScrollView addSubview:activityLabel];
    }
}

@end
