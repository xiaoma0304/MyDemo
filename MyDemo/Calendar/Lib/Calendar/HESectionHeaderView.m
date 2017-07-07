//
//  HESectionHeaderView.m
//  MyDemo
//
//  Created by MGN on 2017/6/29.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "HESectionHeaderView.h"

@interface HESectionHeaderView()

/** 年月 */
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation HESectionHeaderView

#pragma mark-系统覆盖
- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        [self selfConfig];
        [self initCommon];
        [self makeConstraints];
    }
    return self;
}

#pragma mark-自定义方法
/** 配置 */
- (void)selfConfig {
    self.backgroundColor = [UIColor whiteColor];
}

/** 添加控件 */
- (void)initCommon {
    [self addSubview:self.timeLabel];
}

/** 添加约束 */
- (void)makeConstraints {
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(16.0f);
        make.top.and.trailing.and.bottom.mas_equalTo(0);
    }];
}

#pragma mark-setter and getter
- (void)setTimeString:(NSString *)timeString {
    if (timeString) {
        _timeString = timeString;
        self.timeLabel.text = timeString;
    }
}


- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.font = [UIFont systemFontOfSize:14.0f];
        _timeLabel.text = @"2222-34-45";
    }
    return _timeLabel;
}

@end
