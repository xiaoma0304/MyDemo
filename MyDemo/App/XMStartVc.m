//
//  XMStartVc.m
//  MyDemo
//
//  Created by MGN on 2017/4/12.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "XMStartVc.h"

static NSString *cellID = @"test";

@interface XMStartVc () <UITableViewDelegate, UITableViewDataSource>

/** list */
@property (nonatomic, strong) UITableView *tableView;
/** class array */
@property (nonatomic, strong) NSArray *classArray;

@end

@implementation XMStartVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self selfConfig];
    
    [self addViews];
}

- (void)selfConfig {
    self.view.backgroundColor = [UIColor whiteColor];
}

/** 添加view */
- (void)addViews {
    [self.view addSubview:self.tableView];
    [self makeConstraints];
}

/** 约束 */
- (void)makeConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma mark-tableview-delgate-datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.classArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = (NSString *)[self.classArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = (NSString *)[self.classArray objectAtIndex:indexPath.row];
    UIViewController *vc = [[NSClassFromString(className) alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark-setter-and-getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSArray *)classArray {
    if (!_classArray) {
        _classArray = [[NSArray alloc]initWithObjects:@"XMFmdbVc", @"XMCoreDataVc", @"HECalendarVc", nil];
    }
    return _classArray;
}

@end
