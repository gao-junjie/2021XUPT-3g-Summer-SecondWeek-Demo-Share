//
//  BigWhiteViewController.h
//  3.Share
//
//  Created by mac on 2021/7/27.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BigWhiteViewController : ViewController

@property (copy, nonatomic) NSMutableArray* shareNumberIntArray;
@property (nonatomic, copy) NSString* shareNumberString;
@property (copy, nonatomic) NSMutableArray* visitorNumberIntArray;
@property (nonatomic, copy) NSString* visitorNumberString;
@property (assign, nonatomic) int loveNumberInt;
@property (nonatomic, copy) NSString* loveNumberString;

@end

NS_ASSUME_NONNULL_END
