//
//  UploadViewController.h
//  3.Share
//
//  Created by mac on 2021/7/28.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
#import "PhotoWallViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface UploadViewController : ViewController <PhotoWallDelegate>

@property (nonatomic, strong) UITextField* NameTextField;
@property (nonatomic, strong) UITextField* describeTextField;
@property (nonatomic, strong) UIButton* choosePhotoButoon;
@property (nonatomic, assign) int photoTotalNumber;

- (void)changeHeadPhotoName:(NSString*)headPhotoName andNumber:(int)headPhotoNumber;
@end

NS_ASSUME_NONNULL_END
