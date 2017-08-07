//
//  Register.m
//  MyDemo
//
//  Created by MGN on 2017/7/19.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "RegisterVc.h"

@interface RegisterVc ()

/** 背景 */
@property (nonatomic, strong) UIImageView *phoneNumberBg;
/** 手机号 */
@property (nonatomic, strong) UITextField *phoneField;
/** <#description#> */
@property (nonatomic, strong) UITextField *codeField;
/** <#description#> */
@property (nonatomic, strong) UITextField *pwdField;
/** <#description#> */
@property (nonatomic, strong) UITextField *confirmPwdField;
/** <#description#> */
@property (nonatomic, strong) UIButton *codeButton;
/** <#description#> */
@property (nonatomic, strong) UIButton *selectAgreementButton;
/** <#description#> */
@property (nonatomic, strong) UILabel *agreementLabel;
/** <#description#> */
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation RegisterVc

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self selfConfig];
}

- (void)selfConfig {
    self.title = @"注册";
    self.view.backgroundColor = [UIColor wheatColor];
}

@end
