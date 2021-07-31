//
//  SettingViewController.h
//  3.Share
//
//  Created by mac on 2021/7/29.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
#import "NewAttentionTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface SettingViewController : ViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* settingTableView;
@property (copy, nonatomic) NSArray* settingArray;
@end

NS_ASSUME_NONNULL_END
