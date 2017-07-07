//
//  XMFmdbManger.h
//  MyDemo
//
//  Created by MGN on 2017/4/12.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMFmdbManger : NSObject

/** 获取db路径 */
+ (NSString *)dbPath:(NSString *)dbName;

@end
