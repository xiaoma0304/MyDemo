//
//  HECalendarLayout.m
//  MyDemo
//
//  Created by MGN on 2017/6/30.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "HECalendarLayout.h"

@implementation HECalendarLayout

- (instancetype)init {
    if (self=[super init]) {
        self.minimumInteritemSpacing = 0;
        self.minimumLineSpacing = 0;
    }
    return self;
}

@end
