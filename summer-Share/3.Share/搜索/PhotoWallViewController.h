//
//  PhotoWallViewController.h
//  3.Share
//
//  Created by mac on 2021/7/28.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PhotoWallDelegate <NSObject>

- (void)changeHeadPhotoName:(NSString*)headPhotoName andNumber:(int)headPhotoNumber;

@end

@interface PhotoWallViewController : ViewController
@property (strong, nonatomic) UIButton* headPhotoButton;
@property (strong, nonatomic) UIImage* headPhotoImage;
@property (strong, nonatomic) UIScrollView* PhotoWallScrollView;
@property (strong, nonatomic) NSMutableArray* imageNameArray;
@property (assign, nonatomic) int photoNumber;
@property (assign, nonatomic) id<PhotoWallDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
