//
//  XMTestView.m
//  MyDemo
//
//  Created by MGN on 2017/7/26.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "XMTestView1.h"
#import "UIView+RectCorner.h"

@interface XMTestView1()

/** <#description#> */
@property (nonatomic, strong) UIView  *corView;

@end

@implementation XMTestView1

#pragma mark-系统覆盖
- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        [self initCommon];
//        [self makeConstraints];
    }
    return self;
}

#pragma mark-自定义方法
/** 添加控件 */
- (void)initCommon {
    self.backgroundColor = [UIColor whiteColor];
//    [self addSubview:self.corView];
}

/** 添加约束 */
- (void)makeConstraints {
    [self.corView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200);
        make.leading.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    self.corView.backgroundColor = [UIColor greenColor];
}

- (void)drawRect:(CGRect)rect {
    [self setCornerOnTop:CGSizeMake(10, 10)];
}
#pragma mark-懒加载
- (UIView *)corView {
    if (!_corView) {
        _corView = [[UIView alloc]init];
    }
    return _corView;
}

@end
