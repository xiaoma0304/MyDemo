//
//  HECalendarView.h
//  MyDemo
//
//  Created by MGN on 2017/6/29.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HECalendarViewDelgate <NSObject>

- (void)popViewController:(NSDate *)date;

@end

@interface HECalendarView : UIView

/** <#description#> */
@property (nonatomic, assign) BOOL isStartDate;
/** <#description#> */
@property (nonatomic, weak) id<HECalendarViewDelgate> delgate;

/** <#description#> */
@property (nonatomic, strong) NSDate *endDate;

/** <#description#> */
@property (nonatomic, strong) NSDate *startDate;

@end
