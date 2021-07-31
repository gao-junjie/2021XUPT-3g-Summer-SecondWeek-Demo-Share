//
//  NewAttentionViewController.h
//  3.Share
//
//  Created by mac on 2021/7/29.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewAttentionViewController : ViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* attentionTableView;
@property (nonatomic, strong) NSArray* nameArray;

@end

NS_ASSUME_NONNULL_END
