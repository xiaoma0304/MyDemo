//
//  HECalendarVc.m
//  calendar
//
//  Created by MGN on 2017/6/27.
//  Copyright © 2017年 com.rrslj. calendar. All rights reserved.
//

#import "HECalendarVc.h"
#import "HEEnterCalendarCell.h"
#import "HECalendarFooterView.h"
#import "HECalendarModel.h"
#import "HECalendarDetailVc.h"
#import "NSCalendar+GTLCategory.h"

typedef NS_ENUM(NSUInteger, TimeType) {
    START_TIME=0,
    END_TIME=1
};

static NSString *cellID = @"HEEnterCalendarCell";

@interface HECalendarVc () <UITableViewDelegate, UITableViewDataSource>

/** 主列表 */
@property (nonatomic, strong) UITableView *tableView;
/** footer */
@property (nonatomic, strong) HECalendarFooterView *footerView;
/** 数据源 */
@property (nonatomic, strong) NSMutableArray *listArray;

/** 开始日期 */
@property (nonatomic, strong) NSDate *startDate;
/** 结束日期 */
@property (nonatomic, strong) NSDate *endDate;

@end

@implementation HECalendarVc

- (void)viewDidLoad {
    [super viewDidLoad];

    [self selfConfig];
    
    [self initCommon];
}

#pragma mark-自定义方法
/** 配置 */
- (void)selfConfig{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"筛选";
}

/** 添加控件 */
- (void)initCommon {

    [self.view addSubview:self.tableView];
    
    [self makeConstraints];
}

/** 添加约束 */
- (void)makeConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    HEEnterCalendarCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    HECalendarModel *model = [_listArray objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:cellID cacheByIndexPath:indexPath configuration:^(HEEnterCalendarCell *cell) {
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    typeof(self) __weak weakSelf = self;
    HEEnterCalendarCell *cell = (HEEnterCalendarCell *)[tableView cellForRowAtIndexPath:indexPath];
    switch (indexPath.row) {
        case START_TIME: {
            HECalendarDetailVc *dateDetailVc = [[HECalendarDetailVc alloc]init];
            dateDetailVc.isStartDate = YES;
            dateDetailVc.startDate = weakSelf.startDate;
            dateDetailVc.endDate = weakSelf.endDate;
            __weak HEEnterCalendarCell *weakCell=cell;
            dateDetailVc.backWithDate = ^(NSDate *date) {
                HECalendarModel *model = [_listArray objectAtIndex:indexPath.row];
                model.timeString = [NSCalendar dateStingFromDate:date];
                weakCell.model = model;
                weakSelf.startDate = date;
            };
            
            [self.navigationController pushViewController:dateDetailVc animated:YES];
        }
            break;
        case END_TIME: {
            HECalendarDetailVc *dateDetailVc = [[HECalendarDetailVc alloc]init];
            dateDetailVc.isStartDate = NO;
            dateDetailVc.startDate = weakSelf.startDate;
            dateDetailVc.endDate = weakSelf.endDate;
            __weak HEEnterCalendarCell *weakCell=cell;
            dateDetailVc.backWithDate = ^(NSDate *date) {
                HECalendarModel *model = [_listArray objectAtIndex:indexPath.row];
                model.timeString = [NSCalendar dateStingFromDate:date];
                weakCell.model = model;
                weakSelf.endDate = date;
            };
            [self.navigationController pushViewController:dateDetailVc animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark-懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[HEEnterCalendarCell class] forCellReuseIdentifier:cellID];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = self.footerView;
    }
    return _tableView;
}

- (HECalendarFooterView *)footerView {
    if (!_footerView) {
        _footerView = [[HECalendarFooterView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
        _footerView.backgroundColor = [UIColor whiteColor];
    }
    return _footerView;
}

- (NSMutableArray *)listArray {
    if (!_listArray) {
        _listArray = [NSMutableArray new];
        for (int i=0; i<2; i++) {
            HECalendarModel *model = [HECalendarModel new];
            switch (i) {
                case START_TIME: {
                    model.nameString = @"开始时间";
                    NSDate *startDate = [NSDate new];
                    model.timeString = [NSCalendar dateStingFromDate:startDate];
                    self.startDate = startDate;
                }
                    break;
                case END_TIME: {
                    model.nameString = @"结束时间";
                    NSDate *endDate = [NSDate new];
                    model.timeString = [NSCalendar dateStingFromDate:endDate];
                    self.endDate = endDate;
                }
                    break;
                    
                default:
                    break;
            }
            [_listArray addObject:model];
        }
    }
    return _listArray;
}


@end
