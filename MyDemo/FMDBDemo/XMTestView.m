//
//  XMTestView.m
//  MyDemo
//
//  Created by MGN on 2017/4/25.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "XMTestView.h"

@interface XMTestView ()

/** <#description#> */
@property (nonatomic, strong) UIView *bgView;

/**  */
@property (nonatomic, strong) UILabel *testLable1;

/**  */
@property (nonatomic, strong) UILabel *testLable2;

/**  */
@property (nonatomic, strong) UILabel *testLable3;

@end

@implementation XMTestView

#pragma mark-系统覆盖
- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        [self initCommon];
        [self makeConstraints];
    }
    return self;
}

#pragma mark-自定义方法
/** 添加控件 */
- (void)initCommon {
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.testLable1];
    [self.bgView addSubview:self.testLable2];
    [self.bgView addSubview:self.testLable3];
    [self makeConstraints];
}

/** 添加约束 */
- (void)makeConstraints {
    [self.testLable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.leading.mas_equalTo(15);
        make.trailing.mas_equalTo(-15);
    }];
    
    [self.testLable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.testLable1.mas_bottom).with.offset(5);
        make.trailing.mas_equalTo(self.testLable1.mas_trailing);
        make.leading.mas_equalTo(self.testLable1.mas_leading);
    }];
    
    [self.testLable3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.testLable2.mas_bottom).with.offset(5);
        make.trailing.mas_equalTo(self.testLable2.mas_trailing);
        make.leading.mas_equalTo(self.testLable2.mas_leading);
        make.bottom.mas_equalTo(-30);
    }];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
}

#pragma mark-懒加载
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor orangeColor];
    }
    return _bgView;
}

- (UILabel *)testLable1 {
    if (!_testLable1) {
        _testLable1 = [[UILabel alloc]init];
        _testLable1.backgroundColor = [UIColor redColor];
        _testLable1.text = @"asdfasdfadfadasdfahdsfhdfghfadsf";
    }
    return _testLable1;
}

- (UILabel *)testLable2 {
    if (!_testLable2) {
        _testLable2 = [[UILabel alloc]init];
        _testLable2.backgroundColor = [UIColor grayColor];
        _testLable2.text = @"sdfasdasdfasdf";
    }
    return _testLable2;
}


- (UILabel *)testLable3 {
    if (!_testLable3) {
        _testLable3 = [[UILabel alloc]init];
        _testLable3.backgroundColor = [UIColor redColor];
        _testLable3.text = @"asdfasdfaasdfasdfadsfaddfadfadsf";
    }
    return _testLable3;
}


@end
