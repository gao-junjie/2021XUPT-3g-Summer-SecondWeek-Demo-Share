//
//  PersonalFirstTableViewCell.h
//  3.Share
//
//  Created by mac on 2021/7/29.
//  Copyright © 2021 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalFirstTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView* headPhotoImageView;
@property (nonatomic, strong) UILabel* jobLabel;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* signatureLabel;
@property (nonatomic, strong) UIButton* loveButton;
@property (nonatomic, strong) UIButton* visitorButton;
@property (nonatomic, strong) UIButton* shareButton;
@property (nonatomic, strong) UIButton* whatButton;
@end

NS_ASSUME_NONNULL_END
