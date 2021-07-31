//
//  StartShowViewController.m
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "StartShowViewController.h"
#import "LandingViewController.h"
@interface StartShowViewController ()

@end

@implementation StartShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* startShowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"start1.jpg"]];
    startShowImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    [self.view addSubview:startShowImageView];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(outStartShow) userInfo:nil repeats:NO];
}

- (void)outStartShow {
    LandingViewController* landingViewController = [[LandingViewController alloc] init];
    UIWindow* window = [UIApplication sharedApplication].windows[1];
    window.rootViewController = landingViewController;
}
@end
