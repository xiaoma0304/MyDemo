//
//  XMFmdbVc.m
//  MyDemo
//
//  Created by MGN on 2017/4/12.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "XMFmdbVc.h"
#import "XMTestView.h"

@interface XMFmdbVc ()

@end

@implementation XMFmdbVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self selfConfig];
//
//    [self addViews];
    NSLog(@"viewDidLoad");
    
    XMTestView *testView = [[XMTestView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:testView];
    
}

- (void)selfConfig {
    self.view.backgroundColor = [UIColor redColor];
}

- (void)loadView {
    [super loadView];
    NSLog(@"loadView");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awakeFromNib");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
}

- (void)dealloc {
    NSLog(@"dealloc");
}

/** 添加view */
- (void)addViews {
    [self makeConstraints];
}

/** 约束 */
- (void)makeConstraints {
}

@end
