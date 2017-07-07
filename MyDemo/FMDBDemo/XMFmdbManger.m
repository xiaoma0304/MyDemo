//
//  XMFmdbManger.m
//  MyDemo
//
//  Created by MGN on 2017/4/12.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "XMFmdbManger.h"

@implementation XMFmdbManger

+ (NSString *)dbPath:(NSString *)dbName{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *fileManage = [NSFileManager defaultManager];
    docDir = [docDir stringByAppendingPathComponent:@"FMDBDemo"];
    BOOL isDir;
    BOOL exit = [fileManage fileExistsAtPath:docDir isDirectory:&isDir];
    if (!exit || !isDir) {
        [fileManage createDirectoryAtPath:docDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *dbPath = [docDir stringByAppendingString:dbName];
    return dbPath;
}

@end
