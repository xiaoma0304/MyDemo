//
//  UIView+RectCorner.h
//  MyDemo
//
//  Created by MGN on 2017/7/26.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RectCorner)

/** 上圆角 */
- (void)setCornerOnTop:(CGSize) cornerSize;
/** 下圆角 */
- (void)setCornerOnBottom:(CGSize) cornerSize;
/** 所有 */
- (void)setAllCorner:(CGFloat) cornerRadius;
/** 无 */
- (void)setNoneCorner;

@end
