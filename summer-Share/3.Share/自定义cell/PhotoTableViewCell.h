//
//  PhotoTableViewCell.h
//  3.Share
//
//  Created by mac on 2021/7/28.
//  Copyright © 2021 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoTableViewCell : UITableViewCell
@property (nonatomic, strong) UIButton* photoButton;
@property (nonatomic, strong) UILabel* themeLabel;
@property (nonatomic, strong) UILabel* authorLabel;
@property (nonatomic, strong) UILabel* styleLabel;
@property (nonatomic, strong) UIButton* loveButton;
@property (nonatomic, strong) UIButton* visitorButton;
@property (nonatomic, strong) UIButton* shareButton;
@end

NS_ASSUME_NONNULL_END
