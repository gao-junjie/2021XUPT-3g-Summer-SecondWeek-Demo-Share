//
//  HomeViewController.m
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "VacationViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    self.navigationItem.title = @"SHARE";
    
    
    _shareScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _shareScrollView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    _shareScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 220 * 5 + 20 );
    [self.view addSubview:_shareScrollView];
    
    
    NSArray* themeArray = [NSArray arrayWithObjects:@"假日", @"国外画册欣赏", @"collection扁平设计", @"板式整理术：高效解决多风格要求", nil];
    NSArray* authorArray = [NSArray arrayWithObjects:@"share小白", @"share小王", @"share小吕", @"share小王", nil];
    NSArray* styleArray = [NSArray arrayWithObjects:@"原创-插画-练习习作", @"平面设计——画册设计", @"平面设计——海报设计", @"平面设计——样式设计", nil];
    NSArray* timeArray = [NSArray arrayWithObjects:@"15分钟前", @"16分钟前", @"17分钟前", @"18分钟前", nil];
    
    
    _visitorNumberIntArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:694], [NSNumber numberWithInt:863], [NSNumber numberWithInt:561], [NSNumber numberWithInt:273], nil];
    _shareNumberIntArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:45], [NSNumber numberWithInt:78], [NSNumber numberWithInt:16], [NSNumber numberWithInt:41], nil];
    
    
    for (int i = 0; i < 4; i++) {
        NSString* photoName = [NSString stringWithFormat:@"list_img%d.png",i + 1];
        UIImage* photoImage = [UIImage imageNamed:photoName];
        UIButton* photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        photoButton.frame = CGRectMake(0,230 + 170 * i + 10 * i, [UIScreen mainScreen].bounds.size.width, 170);
        photoButton.backgroundColor = [UIColor whiteColor];
        [photoButton setImage:photoImage forState:UIControlStateNormal];
        [photoButton setTitle:timeArray[i] forState:UIControlStateNormal];
        [photoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        photoButton.titleLabel.font = [UIFont systemFontOfSize:14];
        photoButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -58, 107);
        photoButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 200);
        photoButton.tag = 200 + i;
        [photoButton addTarget:self action:@selector(pressFirstPhotoButton:) forControlEvents:UIControlEventTouchUpInside];
        [_shareScrollView addSubview:photoButton];
        
        
        UILabel* themeLabel = [[UILabel alloc] init];
        themeLabel.frame = CGRectMake(230, 230 + 170 * i + 10 * i, 180, 50);
        themeLabel.text = themeArray[i];
        themeLabel.lineBreakMode = NSLineBreakByWordWrapping|NSLineBreakByTruncatingTail;
        themeLabel.numberOfLines = 2;
        themeLabel.backgroundColor = [UIColor clearColor];
        themeLabel.textColor = [UIColor blackColor];
        themeLabel.font = [UIFont systemFontOfSize:18];
        [_shareScrollView addSubview:themeLabel];
        
        
        UILabel* authorLabel = [[UILabel alloc] init];
        authorLabel.frame = CGRectMake(230, 285 + 170 * i + 10 * i, 180, 20);
        authorLabel.text = authorArray[i];
        authorLabel.backgroundColor = [UIColor clearColor];
        authorLabel.textColor = [UIColor blackColor];
        authorLabel.font = [UIFont systemFontOfSize:16];
        [_shareScrollView addSubview:authorLabel];
        
        
        UILabel* styleLabel = [[UILabel alloc] init];
        styleLabel.frame = CGRectMake(230, 310 + 170 * i + 10 * i, 180, 20);
        styleLabel.text = styleArray[i];
        styleLabel.backgroundColor = [UIColor clearColor];
        styleLabel.textColor = [UIColor blackColor];
        styleLabel.font = [UIFont systemFontOfSize:14];
        [_shareScrollView addSubview:styleLabel];
        
        
        UIButton* loveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        loveButton.frame = CGRectMake(226, 138, 45, 20);
        _loveNumberInt = 865 - i * 132;
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
    
    
    _homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 220)];
    _homeScrollView.backgroundColor = [UIColor whiteColor];
    _homeScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 6, 220);
    _homeScrollView.pagingEnabled = YES;
    _homeScrollView.bounces = NO;
    _homeScrollView.tag = 999;
    _homeScrollView.showsHorizontalScrollIndicator = NO;
    _homeScrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    [_shareScrollView addSubview:_homeScrollView];
    _homeScrollView.delegate = self;
    

    UIImage* zeroImage = [UIImage imageNamed:@"main_img4.png"];
    UIImageView* zeroImageView = [[UIImageView alloc] initWithImage:zeroImage];
    zeroImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 220);
    [_homeScrollView addSubview:zeroImageView];
    
    for (int i = 0; i < 4; i++) {
        NSString* mainImageName = [NSString stringWithFormat:@"main_img%d.png",i + 1];
        UIImage* mainImage = [UIImage imageNamed:mainImageName];
        UIImageView* mainImageView = [[UIImageView alloc] initWithImage:mainImage];
        mainImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * (i + 1), 0, [UIScreen mainScreen].bounds.size.width, 220);
        [_homeScrollView addSubview:mainImageView];
    }
    
    UIImage* lastImage = [UIImage imageNamed:@"main_img1.png"];
    UIImageView* lastImageView = [[UIImageView alloc] initWithImage:lastImage];
    lastImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 5, 0, [UIScreen mainScreen].bounds.size.width, 220);
    [_homeScrollView addSubview:lastImageView];
    

    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(123, 178, 180, 50)];
    _pageControl.numberOfPages = 4;
    _pageControl.currentPage = 0;
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [_shareScrollView addSubview:_pageControl];
    
    
    _scrollViewTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoRepeat) userInfo:nil repeats:YES];

    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == [UIScreen mainScreen].bounds.size.width * 5){
        _homeScrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    }
    if (scrollView.contentOffset.x == 0){
        _homeScrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width * 4, 0);
    }

    CGFloat offsetX = _homeScrollView.contentOffset.x + [UIScreen mainScreen].bounds.size.width * 0.5;
    int page = offsetX / [UIScreen mainScreen].bounds.size.width;
    if (page == 5) {
        _pageControl.currentPage = 0;
    } else if (page == 0) {
        _pageControl.currentPage = 3;
    } else {
        _pageControl.currentPage = page - 1;
    }
}

- (void)autoRepeat {
    if (_homeScrollView.contentOffset.x == [UIScreen mainScreen].bounds.size.width * 5.5) {
        _homeScrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    } else {
        CGFloat offsetX = _homeScrollView.contentOffset.x + [UIScreen mainScreen].bounds.size.width;
        [_homeScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView.tag == 999) {
        [_scrollViewTimer invalidate];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView.tag == 999) {
        _scrollViewTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoRepeat) userInfo:nil repeats:YES];
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
    } else if (button.tag == 703) {
        int temp = [_visitorNumberIntArray[3] intValue] + 1;
        _visitorNumberString = [NSString stringWithFormat:@"%d",temp];
        [button setTitle:_visitorNumberString forState:UIControlStateNormal];
        [_visitorNumberIntArray replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:temp]];
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
    } else if (button.tag == 803) {
        int temp = [_shareNumberIntArray[3] intValue] + 1;
        _shareNumberString = [NSString stringWithFormat:@"%d",temp];
        [button setTitle:_shareNumberString forState:UIControlStateNormal];
        [_shareNumberIntArray replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:temp]];
    }
}

- (void)pressFirstPhotoButton:(UIButton*) button {
    if (button.tag == 200) {
        UIButton* firstButton = [self.view viewWithTag:700];
        int temp = [_visitorNumberIntArray[0] intValue] + 1;
        _visitorNumberString = [NSString stringWithFormat:@"%d",temp];
        [firstButton setTitle:_visitorNumberString forState:UIControlStateNormal];
        [_visitorNumberIntArray replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:temp]];
        
        VacationViewController* vacationViewController = [[VacationViewController alloc] init];
        [self.navigationController pushViewController:vacationViewController animated:YES];
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
    } else if (button.tag == 203) {
            UIButton* fouthButton = [self.view viewWithTag:703];
            int temp = [_visitorNumberIntArray[3] intValue] + 1;
            _visitorNumberString = [NSString stringWithFormat:@"%d",temp];
            [fouthButton setTitle:_visitorNumberString forState:UIControlStateNormal];
            [_visitorNumberIntArray replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:temp]];
    }
}

@end
