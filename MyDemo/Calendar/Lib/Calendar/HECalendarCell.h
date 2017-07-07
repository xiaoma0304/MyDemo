//
//  HECalendarCell.h
//  MyDemo
//
//  Created by MGN on 2017/6/29.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HECalendarCell : UICollectionViewCell

/** <#description#> */
@property (nonatomic, copy) NSString *timeString;
/** <#description#> */
@property (nonatomic, copy) NSString *timeColor;
/** <#description#> */
@property (nonatomic, assign) BOOL isEndDay;

- (void)layoutCALayer;
- (void)clearLayer;
- (void)layoutCircle:(BOOL) isLeft;

@end
