//
//  PhotoWallViewController.m
//  3.Share
//
//  Created by mac on 2021/7/28.
//  Copyright © 2021 mac. All rights reserved.
//

#import "PhotoWallViewController.h"

@interface PhotoWallViewController ()

@end

@implementation PhotoWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择图片";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem* rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonItemPress)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    
    _PhotoWallScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _PhotoWallScrollView.backgroundColor = [UIColor whiteColor];
    _PhotoWallScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 220 * 5 + 20 );
    [self.view addSubview:_PhotoWallScrollView];
    
    _imageNameArray = [[NSMutableArray alloc]init];;
    
    for (int i = 0; i < 26; i++) {
        NSString* strName = [NSString stringWithFormat:@"headPhoto%d.jpg",i + 1];
        _headPhotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headPhotoButton setBackgroundImage:[UIImage imageNamed:strName] forState:UIControlStateNormal];
        [_headPhotoButton setImage:[UIImage imageNamed:@"xuanzhong.png"] forState:UIControlStateSelected];
        _headPhotoButton.imageEdgeInsets = UIEdgeInsetsMake(0, 64, 65, 0);
        _headPhotoButton.frame = CGRectMake(4 + [[UIScreen mainScreen] bounds].size.width / 4 * (i % 4), 10 + [[UIScreen mainScreen] bounds].size.width / 4 * (i / 4), [[UIScreen mainScreen] bounds].size.width / 4 - 8, [[UIScreen mainScreen] bounds].size.width / 4 - 8);
        _headPhotoButton.tag = 10001 + i;
        [_headPhotoButton addTarget:self action:@selector(pressHeadPhoto:) forControlEvents:UIControlEventTouchUpInside];
        [_PhotoWallScrollView addSubview:_headPhotoButton];
    }
}

- (void)pressHeadPhoto:(UIButton*)button {
    if ([button isSelected] == NO) {
        int selectNumber = (int)(button.tag - 10000);
        _photoNumber++;
        NSString* selectString = [NSString stringWithFormat:@"headPhoto%d.jpg",selectNumber];
        [_imageNameArray addObject:selectString];
        [button setSelected:YES];
    } else {
        int selectNumber = (int)(button.tag - 10000);
        _photoNumber--;
        NSString* selectString = [NSString stringWithFormat:@"headPhoto%d.jpg",selectNumber];
        [_imageNameArray removeObject:selectString];
        [button setSelected:NO];
    }
}

- (void)rightButtonItemPress {
    if (_photoNumber == 0) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"请选择至少 1 张图片" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    } else {
        NSString* message = [NSString stringWithFormat:@"成功上传 %d 张图片!",_photoNumber];
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:YES];
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
        
        NSString* headPhotoName = _imageNameArray[0];
        [_delegate changeHeadPhotoName:headPhotoName andNumber:_photoNumber];
    }
}
@end
