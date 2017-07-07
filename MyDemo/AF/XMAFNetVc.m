//
//  XMAFNetVc.m
//  MyDemo
//
//  Created by MGN on 2017/4/17.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "XMAFNetVc.h"
#import "XMNetworking.h"

@interface XMAFNetVc ()

@end

@implementation XMAFNetVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    [manager GET:@"" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
    }];
    
}

@end
