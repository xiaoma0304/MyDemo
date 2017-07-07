//
//  HEWeekView.m
//  MyDemo
//
//  Created by MGN on 2017/6/28.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "HEWeekView.h"

@interface HEWeekView()

/** 星期 */
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation HEWeekView


#pragma mark-系统覆盖
- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        [self initCommon];
        self.backgroundColor = [UIColor colorFromHexString:@"#f7f7f7"];
    }
    return self;
}

#pragma mark-自定义方法
/** 添加控件 */
- (void)initCommon {
    for (int i=0; i<self.titleArray.count; i++) {
        UILabel *weekLabel = [UILabel new];
        weekLabel.textAlignment = NSTextAlignmentCenter;
        weekLabel.font = [UIFont systemFontOfSize:16.0f];
        weekLabel.textColor = [UIColor colorFromHexString:i==0||i==self.titleArray.count-1? @"#c8013c": @"#333333"];
        weekLabel.text = [self.titleArray objectAtIndex:i];
        [self addSubview:weekLabel];
        [weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.mas_equalTo(0);
            make.leading.mas_equalTo(WIDTH/7*i);
            make.width.mas_equalTo(WIDTH/7);
            make.centerY.mas_equalTo(0);
        }];
    }
}

#pragma mark-懒加载
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [[NSArray alloc]initWithObjects:@"日", @"一", @"二", @"三", @"四", @"五", @"六", nil];
    }
    return _titleArray;
}

@end
