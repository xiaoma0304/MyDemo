//
//  XMFmdbVc.m
//  MyDemo
//
//  Created by MGN on 2017/4/12.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "XMFmdbVc.h"

@interface XMFmdbVc ()

@end

@implementation XMFmdbVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self selfConfig];
    
    [self addViews];
}

- (void)selfConfig {
    self.view.backgroundColor = [UIColor redColor];
}

/** 添加view */
- (void)addViews {
    [self makeConstraints];
}

/** 约束 */
- (void)makeConstraints {
}

@end
