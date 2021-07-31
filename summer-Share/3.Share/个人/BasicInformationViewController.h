//
//  BasicInformationViewController.h
//  3.Share
//
//  Created by mac on 2021/7/30.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
#import "BasicInformationTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface BasicInformationViewController : ViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView* basicInformationTableView;
@property(nonatomic, copy) NSArray* tipArray;
@property(nonatomic, copy) NSArray* detailArray;
@property(nonatomic, strong) UIButton* manButton;
@property(nonatomic, strong) UIButton* womanButton;
@end

NS_ASSUME_NONNULL_END
