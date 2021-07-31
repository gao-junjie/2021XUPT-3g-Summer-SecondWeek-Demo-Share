//
//  RegisterViewController.h
//  3.Share
//
//  Created by mac on 2021/7/26.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol RegisterDelegate <NSObject>

- (void)saveUser:(NSMutableArray*)userArray;

@end

@interface RegisterViewController : ViewController <UITextFieldDelegate>

@property (strong, nonatomic) UITextField* registerEmailTextField;
@property (strong, nonatomic) UITextField* registerAccountTextField;
@property (strong, nonatomic) UITextField* registerPasswordTextField;
@property (nonatomic, copy) NSString* registerEmail;
@property (nonatomic, copy) NSString* registerUserWord;
@property (nonatomic, copy) NSString* registerPassword;
@property (strong, nonatomic) NSMutableArray* userArray;
@property (assign, nonatomic) id<RegisterDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
