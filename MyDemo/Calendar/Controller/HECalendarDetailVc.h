//
//  HECalendarDetailVc.h
//  MyDemo
//
//  Created by MGN on 2017/6/27.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HECalendarDetailVc : UIViewController

/** <#description#> */
@property (nonatomic, assign) BOOL isStartDate;
/** <#description#> */
@property (nonatomic, copy) void (^backWithDate)(NSDate *date);
/** <#description#> */
@property (nonatomic, strong) NSDate *startDate;
/** <#description#> */
@property (nonatomic, strong) NSDate *endDate;

@end
