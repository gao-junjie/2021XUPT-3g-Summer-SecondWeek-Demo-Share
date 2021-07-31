//
//  BigWhiteViewController.m
//  3.Share
//
//  Created by mac on 2021/7/27.
//  Copyright © 2021 mac. All rights reserved.
//

#import "BigWhiteViewController.h"

@interface BigWhiteViewController ()

@end

@implementation BigWhiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.6];
    
    UILabel* resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 50, [UIScreen mainScreen].bounds.size.width - 80, 80)];
    resultLabel.text = @"以下为您显示“大白”的搜索结果...";
    resultLabel.lineBreakMode = NSLineBreakByWordWrapping|NSLineBreakByTruncatingTail;
    resultLabel.numberOfLines = 2;
    resultLabel.textAlignment = NSTextAlignmentCenter;
    resultLabel.textColor = [UIColor whiteColor];
    resultLabel.backgroundColor = [UIColor clearColor];
    resultLabel.font = [UIFont systemFontOfSize:32];
    [self.view addSubview:resultLabel];
    
    
    _visitorNumberIntArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:694], [NSNumber numberWithInt:863], [NSNumber numberWithInt:273], nil];
    _shareNumberIntArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:78], [NSNumber numberWithInt:16], [NSNumber numberWithInt:41], nil];
    NSArray* themeArray = [NSArray arrayWithObjects:@"Icon of Baymax", @"每一个人都需要一个大白", @"大白与我", nil];
    NSArray* authorArray = [NSArray arrayWithObjects:@"share小朱", @"share小方", @"share小元", nil];
    NSArray* styleArray = [NSArray arrayWithObjects:@"原创-UI-Icon", @"原创-摄影", @"原创——海报", nil];
    NSArray* timeArray = [NSArray arrayWithObjects:@"15分钟前", @"1个月前", @"1年前", nil];
    
    
    for (int i = 0; i < 3; i++) {
        NSString* photoName = [NSString stringWithFormat:@"bigMax%d.jpeg",i + 1];
        UIImage* photoImage = [UIImage imageNamed:photoName];
        UIButton* photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        photoButton.frame = CGRectMake(0,220 + 170 * i + 10 * i, [UIScreen mainScreen].bounds.size.width, 170);
        photoButton.backgroundColor = [UIColor whiteColor];
        [photoButton setImage:photoImage forState:UIControlStateNormal];
        [photoButton setTitle:timeArray[i] forState:UIControlStateNormal];
        [photoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        photoButton.titleLabel.font = [UIFont systemFontOfSize:14];
        photoButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -58, 107);
        photoButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 200);
        photoButton.tag = 200 + i;
        [photoButton addTarget:self action:@selector(pressFirstPhotoButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:photoButton];


        UILabel* themeLabel = [[UILabel alloc] init];
        themeLabel.frame = CGRectMake(230, 220 + 170 * i + 10 * i, 180, 50);
        themeLabel.text = themeArray[i];
        themeLabel.lineBreakMode = NSLineBreakByWordWrapping|NSLineBreakByTruncatingTail;
        themeLabel.numberOfLines = 2;
        themeLabel.backgroundColor = [UIColor clearColor];
        themeLabel.textColor = [UIColor blackColor];
        themeLabel.font = [UIFont systemFontOfSize:18];
        [self.view addSubview:themeLabel];


        UILabel* authorLabel = [[UILabel alloc] init];
        authorLabel.frame = CGRectMake(230, 275 + 170 * i + 10 * i, 180, 20);
        authorLabel.text = authorArray[i];
        authorLabel.backgroundColor = [UIColor clearColor];
        authorLabel.textColor = [UIColor blackColor];
        authorLabel.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:authorLabel];


        UILabel* styleLabel = [[UILabel alloc] init];
        styleLabel.frame = CGRectMake(230, 300 + 170 * i + 10 * i, 180, 20);
        styleLabel.text = styleArray[i];
        styleLabel.backgroundColor = [UIColor clearColor];
        styleLabel.textColor = [UIColor blackColor];
        styleLabel.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:styleLabel];


        UIButton* loveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        loveButton.frame = CGRectMake(226, 138, 45, 20);
        _loveNumberInt = 625 - i * 172;
        _loveNumberString = [NSString stringWithFormat:@"%d",_loveNumberInt];
        NSString* cancelLoveNumberString = [NSString stringWithFormat:@"%d",_loveNumberInt - 1];
        [loveButton setImage:[UIImage imageNamed:@"dianzan.png"] forState:UIControlStateNormal];
        [loveButton setImage:[UIImage imageNamed:@"canceldianzan.png"] forState:UIControlStateSelected];
        [loveButton setTitle:_loveNumberString forState:UIControlStateNormal];
        loveButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [loveButton setTitle:cancelLoveNumberString forState:UIControlStateSelected];
        [loveButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1] forState:UIControlStateNormal];
        [loveButton addTarget:self action:@selector(pressLoveButton:) forControlEvents:UIControlEventTouchUpInside];
        loveButton.selected = YES;
        [photoButton addSubview:loveButton];


        UIButton* visitorButton = [UIButton buttonWithType:UIButtonTypeCustom];
        visitorButton.frame = CGRectMake(290, 137, 48, 23);
        _visitorNumberString = [NSString stringWithFormat:@"%d",[_visitorNumberIntArray[i] intValue]];
        [visitorButton setTitle:_visitorNumberString forState:UIControlStateNormal];
        visitorButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [visitorButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1] forState:UIControlStateNormal];
        [visitorButton setImage:[UIImage imageNamed:@"fangwen.png"] forState:UIControlStateNormal];
        [visitorButton addTarget:self action:@selector(pressVisitorButton:) forControlEvents:UIControlEventTouchUpInside];
        visitorButton.tag = 700 + i;
        [photoButton addSubview:visitorButton];


        UIButton* shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        shareButton.frame = CGRectMake(350, 137, 55, 23);
        _shareNumberString = [NSString stringWithFormat:@"%d",[_shareNumberIntArray[i] intValue]];
        [shareButton setTitle:_shareNumberString forState:UIControlStateNormal];
        shareButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [shareButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1] forState:UIControlStateNormal];
        [shareButton setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
        shareButton.tag = 800 + i;
        [shareButton addTarget:self action:@selector(pressShareButton:) forControlEvents:UIControlEventTouchUpInside];
        [photoButton addSubview:shareButton];
    }
}

- (void)pressLoveButton:(UIButton*)button {
    if (button.selected == YES) {
        [button setSelected:NO];
    } else {
        [button setSelected:YES];
    }
}

- (void)pressVisitorButton:(UIButton*)button {
    if (button.tag == 700) {
        int temp = [_visitorNumberIntArray[0] intValue] + 1;
        _visitorNumberString = [NSString stringWithFormat:@"%d",temp];
        [button setTitle:_visitorNumberString forState:UIControlStateNormal];
        [_visitorNumberIntArray replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:temp]];
    } else if (button.tag == 701) {
        int temp = [_visitorNumberIntArray[1] intValue] + 1;
        _visitorNumberString = [NSString stringWithFormat:@"%d",temp];
        [button setTitle:_visitorNumberString forState:UIControlStateNormal];
        [_visitorNumberIntArray replaceObjectAtIndex:1 withObject:[NSNumber numberWithInt:temp]];
    } else if (button.tag == 702) {
        int temp = [_visitorNumberIntArray[2] intValue] + 1;
        _visitorNumberString = [NSString stringWithFormat:@"%d",temp];
        [button setTitle:_visitorNumberString forState:UIControlStateNormal];
        [_visitorNumberIntArray replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:temp]];
    }
}


- (void)pressShareButton:(UIButton*)button {
    UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"提示" message:@"成功分享到朋友圈" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    }];
    [boomAlert addAction:boomAction];
    [self presentViewController:boomAlert animated:YES completion:nil];
    
    
    if (button.tag == 800) {
        int temp = [_shareNumberIntArray[0] intValue] + 1;
        _shareNumberString = [NSString stringWithFormat:@"%d",temp];
        [button setTitle:_shareNumberString forState:UIControlStateNormal];
        [_shareNumberIntArray replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:temp]];
    } else if (button.tag == 801) {
        int temp = [_shareNumberIntArray[1] intValue] + 1;
        _shareNumberString = [NSString stringWithFormat:@"%d",temp];
        [button setTitle:_shareNumberString forState:UIControlStateNormal];
        [_shareNumberIntArray replaceObjectAtIndex:1 withObject:[NSNumber numberWithInt:temp]];
    } else if (button.tag == 802) {
        int temp = [_shareNumberIntArray[2] intValue] + 1;
        _shareNumberString = [NSString stringWithFormat:@"%d",temp];
        [button setTitle:_shareNumberString forState:UIControlStateNormal];
        [_shareNumberIntArray replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:temp]];
    }
}

- (void)pressFirstPhotoButton:(UIButton*) button {
    if (button.tag == 200) {
        UIButton* firstButton = [self.view viewWithTag:700];
        int temp = [_visitorNumberIntArray[0] intValue] + 1;
        _visitorNumberString = [NSString stringWithFormat:@"%d",temp];
        [firstButton setTitle:_visitorNumberString forState:UIControlStateNormal];
        [_visitorNumberIntArray replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:temp]];
    } else if (button.tag == 201) {
            UIButton* secondButton = [self.view viewWithTag:701];
            int temp = [_visitorNumberIntArray[1] intValue] + 1;
            _visitorNumberString = [NSString stringWithFormat:@"%d",temp];
            [secondButton setTitle:_visitorNumberString forState:UIControlStateNormal];
            [_visitorNumberIntArray replaceObjectAtIndex:1 withObject:[NSNumber numberWithInt:temp]];
    } else if (button.tag == 202) {
            UIButton* thirdButton = [self.view viewWithTag:702];
            int temp = [_visitorNumberIntArray[2] intValue] + 1;
            _visitorNumberString = [NSString stringWithFormat:@"%d",temp];
            [thirdButton setTitle:_visitorNumberString forState:UIControlStateNormal];
            [_visitorNumberIntArray replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:temp]];
    }
}

@end
