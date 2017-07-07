//
//  HECalendarDetailVc.m
//  MyDemo
//
//  Created by MGN on 2017/6/27.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "HECalendarDetailVc.h"
#import "HEWeekView.h"
#import "ZYCalendarView.h"
#import "HECalendarView.h"

@interface HECalendarDetailVc () <HECalendarViewDelgate>

/** 星期 */
@property (nonatomic, strong) HEWeekView *weekView;
/** 日期 */
@property (nonatomic, strong) HECalendarView *calendarView;

@end

@implementation HECalendarDetailVc

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    [self selfConfig];
    
    [self initCommon];

}

#pragma mark-自定义方法
/** 配置 */
- (void)selfConfig{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"选择日期";
}

/** 添加控件 */
- (void)initCommon {
    
    [self.view addSubview:self.weekView];
    [self.view addSubview:self.calendarView];
    
    [self makeConstraints];
    
}

/** 添加约束 */
- (void)makeConstraints {
    [self.weekView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(44);
    }];
    
    [self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.weekView.mas_bottom);
        make.leading.and.trailing.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

#pragma mark-delgate
- (void)popViewController:(NSDate *)date {
    if (self.backWithDate) self.backWithDate(date);
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark-懒加载
- (HEWeekView *)weekView {
    if (!_weekView) {
        _weekView = [[HEWeekView alloc]init];
    }
    return _weekView;
}

- (HECalendarView *)calendarView {
    if (!_calendarView) {
        _calendarView = [[HECalendarView alloc]init];
        _calendarView.delgate = self;
        _calendarView.startDate = self.startDate;
        _calendarView.endDate = self.endDate;
        _calendarView.isStartDate = self.isStartDate;
        _calendarView.backgroundColor = [UIColor whiteColor];
    }
    return _calendarView;
}

@end
