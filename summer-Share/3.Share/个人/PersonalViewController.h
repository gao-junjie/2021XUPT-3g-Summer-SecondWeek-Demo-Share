//
//  PersonalViewController.h
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonalViewController : ViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView* personalTableView;
@property (nonatomic, strong) NSArray* personalArray;

@end

NS_ASSUME_NONNULL_END
