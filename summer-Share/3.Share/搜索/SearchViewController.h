//
//  SearchViewController.h
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : ViewController <UITextFieldDelegate>
@property (nonatomic, strong) UITextField* searchTextField;
@end

NS_ASSUME_NONNULL_END
