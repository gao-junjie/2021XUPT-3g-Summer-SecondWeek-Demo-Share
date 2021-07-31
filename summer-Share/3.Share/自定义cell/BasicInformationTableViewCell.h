//
//  BasicInformationTableViewCell.h
//  3.Share
//
//  Created by mac on 2021/7/30.
//  Copyright © 2021 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasicInformationTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel* tipLabel;
@property (nonatomic, strong) UILabel* detailLabel;
@property (nonatomic, strong) UILabel* deleteLabel;
@end

NS_ASSUME_NONNULL_END
