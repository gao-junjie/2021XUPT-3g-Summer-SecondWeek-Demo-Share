//
//  UploadViewController.m
//  3.Share
//
//  Created by mac on 2021/7/28.
//  Copyright © 2021 mac. All rights reserved.
//

#import "UploadViewController.h"
#import "PhotoWallViewController.h"
@interface UploadViewController ()

@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.90 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @" ";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    

    _choosePhotoButoon = [UIButton buttonWithType:UIButtonTypeCustom];
    [_choosePhotoButoon setBackgroundImage:[UIImage imageNamed:@"masaike2.jpg"] forState:UIControlStateNormal];
    [_choosePhotoButoon setTitle:@"选择图片" forState:UIControlStateNormal];
    [_choosePhotoButoon setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    _choosePhotoButoon.titleLabel.font = [UIFont systemFontOfSize:30];
    _choosePhotoButoon.frame = CGRectMake(7, 15, 230, 170);
    [_choosePhotoButoon addTarget:self action:@selector(pressChoosePhotoButoon) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_choosePhotoButoon];
    
    UIImageView* locationImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"weizhi.png"]];
    locationImageView.frame = CGRectMake(262, 62, 22, 21);
    [self.view addSubview:locationImageView];
    
    UIButton* locationButton = [UIButton buttonWithType:UIButtonTypeSystem];
    locationButton.frame = CGRectMake(289, 60, 115, 25);
    [locationButton setBackgroundImage:[UIImage imageNamed:@"background_main.png"] forState:UIControlStateSelected];
    locationButton.backgroundColor = [UIColor whiteColor];
    [locationButton setTitle:@"陕西省，西安市" forState:UIControlStateNormal];
    [locationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [locationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [locationButton.layer setMasksToBounds:YES];
    [locationButton.layer setCornerRadius:8.0];
    [locationButton addTarget:self action:@selector(pressLocationButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:locationButton];
    
    
    NSArray* classificationName = [NSArray arrayWithObjects:@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟与设计", @"影视", @"摄影", @"其他", nil];
    
    for (int i = 0; i < 8; i++) {
        UIButton* classificationButton  = [UIButton buttonWithType:UIButtonTypeSystem];
        [classificationButton setBackgroundImage:[UIImage imageNamed:@"background_main.png"] forState:UIControlStateSelected];
        classificationButton.backgroundColor = [UIColor whiteColor];
        [classificationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [classificationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [classificationButton setTitle:classificationName[i] forState:UIControlStateNormal];
        classificationButton.frame = CGRectMake(5 * (i % 4 + 1) + (([UIScreen mainScreen].bounds.size.width - 5) / 4 - 5) * (i % 4), 215 + 40 * (i / 4), ([UIScreen mainScreen].bounds.size.width - 5) / 4 - 5, 30);
        [classificationButton.layer setMasksToBounds:YES];
        [classificationButton.layer setCornerRadius:8.0];
        [classificationButton addTarget:self action:@selector(pressClassificationButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:classificationButton];
    }
    
    _NameTextField = [[UITextField alloc] init];
    _NameTextField.frame = CGRectMake(5, 310, [UIScreen mainScreen].bounds.size.width - 10, 45);
    _NameTextField.backgroundColor = [UIColor whiteColor];
    _NameTextField.font = [UIFont systemFontOfSize:20];
    _NameTextField.borderStyle = UITextBorderStyleLine;
    _NameTextField.placeholder = @"作品名称";
    [self.view addSubview:_NameTextField];
    
    
    _describeTextField = [[UITextField alloc] init];
    _describeTextField.frame = CGRectMake(5, 370, [UIScreen mainScreen].bounds.size.width - 10, 190);
    _describeTextField.backgroundColor = [UIColor whiteColor];
    _describeTextField.borderStyle = UITextBorderStyleLine;
    _describeTextField.font = [UIFont fontWithName:@"Arial" size:20];
    _describeTextField.placeholder = @"请添加作品说明文章内容......";
    _describeTextField.clearButtonMode = UITextFieldViewModeAlways;
    _describeTextField.textAlignment = NSTextAlignmentLeft;
    _describeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    _describeTextField.adjustsFontSizeToFitWidth = YES;
    _describeTextField.minimumFontSize = 20;
    [self.view addSubview:_describeTextField];
    
    
    UIButton* publishButton = [UIButton buttonWithType:UIButtonTypeSystem];
    publishButton.frame = CGRectMake(5, 590, [UIScreen mainScreen].bounds.size.width - 10, 40);
    publishButton.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
    [publishButton setTitle:@"发布" forState:UIControlStateNormal];
    publishButton.titleLabel.font = [UIFont systemFontOfSize:23];
    [publishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [publishButton addTarget:self action:@selector(pressPublishButton) forControlEvents:UIControlEventTouchUpInside];
    [publishButton.layer setMasksToBounds:YES];
    [publishButton.layer setCornerRadius:8.0];
    [self.view addSubview:publishButton];
    
    UIButton* banButton = [UIButton buttonWithType:UIButtonTypeCustom];
    banButton.frame = CGRectMake(5, 640, 100, 50);
    [banButton setTitle:@" 禁止下载" forState:UIControlStateNormal];
    banButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [banButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1]
                    forState:UIControlStateNormal];
    [banButton setImage:[UIImage imageNamed:@"allow.png"] forState:UIControlStateNormal];
    [banButton setImage:[UIImage imageNamed:@"ban.png"] forState:UIControlStateSelected];
    [banButton addTarget:self action:@selector(pressBanButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:banButton];
    
}


- (void)pressLocationButton:(UIButton*)button {
    if (button.selected == NO) {
            button.selected = YES;
    } else {
        button.selected = NO;
    }
}

- (void)pressClassificationButton:(UIButton*)button {
    if (button.selected == NO) {
        button.selected = YES;
    } else {
        button.selected = NO;
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_NameTextField resignFirstResponder];
    [_describeTextField resignFirstResponder];
}


- (void)pressBanButton:(UIButton*)button {
    if (button.selected == NO) {
        button.selected = YES;
    } else {
        button.selected = NO;
    }
}

- (void)pressChoosePhotoButoon {
    PhotoWallViewController* photoWallViewController = [[PhotoWallViewController alloc] init];
    photoWallViewController.delegate = self;
    [self.navigationController pushViewController:photoWallViewController animated:YES];
}

- (void)changeHeadPhotoName:(NSString*)headPhotoName andNumber:(int)headPhotoNumber {
    _photoTotalNumber = headPhotoNumber;
    UIImage* realImage = [UIImage imageNamed:headPhotoName];
    [_choosePhotoButoon setImage:realImage forState:UIControlStateNormal];
    UILabel* headPhotoNumberLabel = [[UILabel alloc] init];
    headPhotoNumberLabel.frame = CGRectMake(200, 0, 30, 30);
    headPhotoNumberLabel.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.85 alpha:1];
    headPhotoNumberLabel.textAlignment = NSTextAlignmentCenter;
    headPhotoNumberLabel.text = [NSString stringWithFormat:@"%d",headPhotoNumber];
    headPhotoNumberLabel.font = [UIFont systemFontOfSize:20];
    [_choosePhotoButoon addSubview:headPhotoNumberLabel];
    
}

- (void)pressPublishButton {
    if (_photoTotalNumber != 0) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您已成功发布！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"SURE" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:YES];
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    } else {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"请上至少上传一张图片" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    }
}

@end
