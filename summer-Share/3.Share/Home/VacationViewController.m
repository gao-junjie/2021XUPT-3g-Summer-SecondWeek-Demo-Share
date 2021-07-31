//
//  VacationViewController.m
//  3.Share
//
//  Created by mac on 2021/7/27.
//  Copyright © 2021 mac. All rights reserved.
//

#import "VacationViewController.h"

@interface VacationViewController ()

@end

@implementation VacationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @" ";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _vacationScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _vacationScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 2 + 30);
    _vacationScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_vacationScrollView];
    
    
    UIImageView* vacationHeadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, [UIScreen mainScreen].bounds.size.width, 95)];
    [vacationHeadImageView setImage:[UIImage imageNamed:@"worksHead.jpg"]];
    [_vacationScrollView addSubview:vacationHeadImageView];
    
    UILabel* saidLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 95, 400, 50)];
    saidLabel.text = @"多希望列车把我带到有你的城市。";
    [_vacationScrollView addSubview:saidLabel];
    
    UIImageView* firstVacationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 145, [UIScreen mainScreen].bounds.size.width - 20, 240)];
    [firstVacationImageView setImage:[UIImage imageNamed:@"works_img1.png"]];
    [_vacationScrollView addSubview:firstVacationImageView];
    
    UIImageView* secondVacationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 395, ([UIScreen mainScreen].bounds.size.width - 20), 240)];
    [secondVacationImageView setImage:[UIImage imageNamed:@"works_img2.png"]];
    [_vacationScrollView addSubview:secondVacationImageView];
    
    UIImageView* thirdVacationImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 4, 645, [UIScreen mainScreen].bounds.size.width / 2, 370)];
    [thirdVacationImageView setImage:[UIImage imageNamed:@"works_img3.png"]];
    [_vacationScrollView addSubview:thirdVacationImageView];
    
    UIImageView* fourthVacationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 1025, ([UIScreen mainScreen].bounds.size.width - 20), 240)];
    [fourthVacationImageView setImage:[UIImage imageNamed:@"works_img4.png"]];
    [_vacationScrollView addSubview:fourthVacationImageView];
    
    UIImageView* fifthVacationImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 4, 1275, [UIScreen mainScreen].bounds.size.width / 2, 370)];
    [fifthVacationImageView setImage:[UIImage imageNamed:@"works_img5.png"]];
    [_vacationScrollView addSubview:fifthVacationImageView];
}


@end
