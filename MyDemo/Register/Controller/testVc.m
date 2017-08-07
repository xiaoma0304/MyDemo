//
//  testVc.m
//  MyDemo
//
//  Created by MGN on 2017/7/19.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "testVc.h"
#import "UIView+RectCorner.h"
#import "XMTestView1.h"
#import "ARLabel.h"

@interface testVc ()

/** <#description#> */
@property (nonatomic, strong) UITableView *tableView;
/** <#description#> */
@property (nonatomic, weak) UIView  *aaaa;


@end

@implementation testVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ARLabel *testLabel = [[ARLabel alloc] initWithFrame:CGRectMake(110, 100, 100, 50)];
    testLabel.text = @"Test";
    testLabel.enlargedSize = CGSizeMake(200, 100);
    
    [self.view addSubview:testLabel];
    
    [UIView animateWithDuration:3.0
                          delay:2.0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         testLabel.frame = CGRectMake(60, 200, 200, 100);
                     }
                     completion:nil];
}

@end
