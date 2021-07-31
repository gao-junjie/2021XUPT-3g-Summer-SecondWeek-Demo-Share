//
//  ChangePasswordViewController.h
//  3.Share
//
//  Created by mac on 2021/7/30.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChangePasswordViewController : ViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView* changeTableView;
@property(nonatomic, copy) NSArray* tipArray;
@property(nonatomic, strong) UITextField* oldTextField;
@property(nonatomic, strong) UITextField* beNewTextField;
@property(nonatomic, strong) UITextField* againNewTextField;
@property(nonatomic, strong) UIButton* confirmButton;

@end

NS_ASSUME_NONNULL_END
