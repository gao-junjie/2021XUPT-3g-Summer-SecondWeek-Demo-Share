//
//  MessageViewController.h
//  3.Share
//
//  Created by mac on 2021/7/30.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageViewController : ViewController <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView* messageTableView;
@property(nonatomic, copy) NSArray* tipArray;
@property(nonatomic, strong) UIButton* stateButton;

@end

NS_ASSUME_NONNULL_END
