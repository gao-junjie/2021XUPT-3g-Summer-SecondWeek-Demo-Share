//
//  HomeViewController.h
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : ViewController <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* homeScrollView;
@property (nonatomic, strong) UIPageControl* pageControl;
@property (nonatomic, retain) NSTimer* scrollViewTimer;
@property (nonatomic, strong) UIScrollView* shareScrollView;
@property (copy, nonatomic) NSMutableArray* shareNumberIntArray;
@property (nonatomic, copy) NSString* shareNumberString;
@property (copy, nonatomic) NSMutableArray* visitorNumberIntArray;
@property (nonatomic, copy) NSString* visitorNumberString;
@property (assign, nonatomic) int loveNumberInt;
@property (nonatomic, copy) NSString* loveNumberString;


@end

NS_ASSUME_NONNULL_END
