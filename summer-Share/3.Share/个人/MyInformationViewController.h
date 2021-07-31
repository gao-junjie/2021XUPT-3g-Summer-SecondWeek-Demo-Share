//
//  MyInformationViewController.h
//  3.Share
//
//  Created by mac on 2021/7/29.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyInformationViewController : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView* myInformationTableView;
@property (copy, nonatomic) NSArray* informationArray;
@property (copy, nonatomic) NSArray* informationNumberArray;

@end

NS_ASSUME_NONNULL_END
