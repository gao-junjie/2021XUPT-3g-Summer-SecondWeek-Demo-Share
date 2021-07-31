//
//  ArticleViewController.h
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
#import "PhotoTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface ArticleViewController : ViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView* articleScrollView;
@property (strong, nonatomic) UITableView* firstTableView;
@property (strong, nonatomic) UITableView* secondTableView;
@property (strong, nonatomic) UITableView* thirdTableView;
@property (strong, nonatomic) PhotoTableViewCell* firstCell;
@property (assign, nonatomic) int loveNumberInt;
@property (nonatomic, copy) NSString* loveNumberString;
@property (copy, nonatomic) NSMutableArray* shareNumberIntArray;
@property (nonatomic, copy) NSString* shareNumberString;
@property (copy, nonatomic) NSMutableArray* visitorNumberIntArray;
@property (nonatomic, copy) NSString* visitorNumberString;
@property (copy, nonatomic) NSArray* themeArray;
@property (copy, nonatomic) NSArray* authorArray;
@property (copy, nonatomic) NSArray* styleArray;
@property (copy, nonatomic) NSArray* timeArray;

@end

NS_ASSUME_NONNULL_END
