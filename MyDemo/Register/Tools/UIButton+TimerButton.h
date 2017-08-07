//
//  UIButton+TimerButton.h
//  MyDemo
//
//  Created by MGN on 2017/7/19.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Completion)(UIButton *countDownButton);

@interface UIButton (TimerButton)

- (void)countDownFromTime:(NSInteger)startTime unitTitle:(NSString *)unitTitle completion:(Completion)completion;

@end
