//
//  HECalendarView.m
//  MyDemo
//
//  Created by MGN on 2017/6/29.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "HECalendarView.h"
#import "HECalendarCell.h"
#import "HESectionHeaderView.h"
#import "HECalendarLayout.h"
#import "NSCalendar+GTLCategory.h"

static NSString *cellID = @"HECalendarView";
static NSString *reusableID = @"HECalendarViewReusableView";

@interface HECalendarView() <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/** 日历列表 */
@property (nonatomic, strong) UICollectionView *collectionView;
/** 列表数据 */
@property (nonatomic, strong) NSMutableArray *canSelectedArray;
@property (nonatomic, strong) NSMutableArray *listArray;
/** 月份 */
@property (nonatomic, assign) NSInteger months;
/** 每月有几天 */
@property (nonatomic, strong) NSMutableArray *sectionRows;
/**  */
@property (nonatomic, strong) NSDate *minDate;


@end

@implementation HECalendarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self selfConfig];
        [self addViews];
        [self makeConstraints];
        
        [self counter];
    }
    return self;
}

- (void)counter {
    
    NSDate *currentData = [NSDate new];
    // 計算開始日期加上 x 數字後的日期
//    NSDate *sectionDate = [NSCalendar date:currentData addMonth:];

    
    NSDate *fromDate = [NSCalendar date:currentData addMonth:-1];
    NSDate *toDate = [NSCalendar date:currentData addMonth:1];
    self.months = [NSCalendar monthsFromDate:fromDate toDate:toDate];
    
    // 計算月份天數
    self.sectionRows = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < self.months; index++) {
        // 依照 section index 計算日期
//        NSDate *fromDate = [self.dataSource minimumDateForGTLCalendar];
        NSDate *sectionDate = [NSCalendar date:fromDate addMonth:index];
        
        // 當月天數
        NSInteger days = [NSCalendar daysFromDate:sectionDate];
        
        // 包含前一個月天數
        NSInteger sectionDateWeek = [NSCalendar weekFromMonthFirstDate:sectionDate];
//        NSInteger containPreDays = (sectionDateWeek == 6) ? 0 : sectionDateWeek;
        
        [self.sectionRows addObject:@(sectionDateWeek + days)];
    }

}

#pragma mark-自定义方法
/** 配置 */
- (void)selfConfig {
    self.backgroundColor = [UIColor whiteColor];
    self.months=3;
}

/** 添加控件 */
- (void)addViews {
    [self addSubview:self.collectionView];
}

/** 添加约束 */
- (void)makeConstraints {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma mark-delgate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return (int)self.months;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.sectionRows[section] integerValue];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HECalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell clearLayer];
    
    NSDate *fromDate = [NSDate new];
    NSInteger add = (int)indexPath.section - (int)self.months+2;
    // 計算開始日期加上 x 數字後的日期
    NSDate *sectionDate = [NSCalendar date:fromDate addMonth:add];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy年MM月dd日";
    
    // 包含前一個月天數
    NSInteger containPreDays = [NSCalendar weekFromMonthFirstDate:sectionDate];
    
    NSDate *minDate = self.isStartDate?[NSCalendar date:fromDate addMonth:-1]:self.startDate;
    
    self.minDate = minDate;

    
    if (indexPath.row >= containPreDays) {
        cell.timeString = [NSString stringWithFormat:@"%td", indexPath.row-containPreDays+1];
        NSDate *yyMMDDDate = [NSCalendar dateYYMMConvertToYYMMDD:sectionDate withDay:indexPath.row-containPreDays+1];
        NSString *yyMMDDDateString = [NSCalendar dateStingFromDate:yyMMDDDate];
        NSString *selectToDateString = [NSCalendar dateStingFromDate:[NSDate new]];
        
        NSString *startDay = [NSCalendar dateStingFromDate:self.startDate];
        NSString *endDay = [NSCalendar dateStingFromDate:self.endDate];
        
        if ([NSCalendar isOnRangeFromDate:minDate toDate:fromDate date:yyMMDDDate]) {
            cell.timeColor = @"000000";
            if (self.startDate != nil) {
                if ([startDay isEqualToString:yyMMDDDateString]) {
                    [cell clearLayer];
                    [cell layoutCircle:YES];
                    cell.timeColor = @"ffffff";
                    
                }
            }
            
            if (self.endDate != nil && !self.isStartDate) {
                if ([endDay isEqualToString:yyMMDDDateString]) {
                    cell.timeColor = @"000000";
                    [cell clearLayer];
                    [cell layoutCircle:NO];
                }
            }
            
        } else {
            cell.timeColor = @"999999";

        }
        
        if ([NSCalendar isOnRangeFromDate:minDate toDate:self.endDate date:yyMMDDDate] && !self.isStartDate) {
            cell.timeColor = @"ffffff";
            
            [cell layoutCALayer];
            
            if (self.startDate != nil) {
                NSString *startDay = [NSCalendar dateStingFromDate:self.startDate];
                if ([startDay isEqualToString:yyMMDDDateString]) {
                    cell.isEndDay = YES;
                    [cell clearLayer];
                    [cell layoutCircle:YES];
                    cell.timeColor = @"ffffff";
                    
                }
            }
            
            if (self.endDate != nil && !self.isStartDate) {
                if ([endDay isEqualToString:yyMMDDDateString]) {
                    cell.isEndDay = YES;
                    cell.timeColor = @"000000";
                    [cell clearLayer];
                    [cell layoutCircle:NO];
                }
            }
            

        }
        
        if ([selectToDateString isEqualToString:yyMMDDDateString]) {
            cell.timeString = @"今天";
        }
        
        if ([endDay isEqualToString:yyMMDDDateString] && !self.isStartDate) {
            cell.isEndDay = [startDay isEqualToString:endDay]?NO:YES;
            [cell layoutCircle:NO];
        }

    } else {
        cell.timeString = @"";
    }
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectItemAtIndexPath");
    
//    HECalendarCell *cell = (HECalendarCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    NSDate *fromDate = [NSDate new];
    NSInteger add = (int)indexPath.section - (int)self.months+2;
    // 計算開始日期加上 x 數字後的日期
    NSDate *sectionDate = [NSCalendar date:fromDate addMonth:add];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy年MM月dd日";
    
    // 包含前一個月天數
    NSInteger containPreDays = [NSCalendar weekFromMonthFirstDate:sectionDate];
    
    NSDate *yyMMDDDate = [NSCalendar dateYYMMConvertToYYMMDD:sectionDate withDay:indexPath.row-containPreDays+1];
    
    if ([NSCalendar isOnRangeFromDate:self.minDate toDate:[NSDate new] date:yyMMDDDate]) {

        if (self.isStartDate) {
            self.startDate = yyMMDDDate;
        } else {
            self.endDate = yyMMDDDate;
        }
        [collectionView reloadData];
        if ([_delgate respondsToSelector:@selector(popViewController:)]) {
            [_delgate popViewController:yyMMDDDate];
        }
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        HESectionHeaderView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reusableID forIndexPath:indexPath];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

        NSDate *fromDate = [NSDate new];
        
        NSInteger add = (int)indexPath.section - (int)self.months+2;
        // 計算開始日期加上 x 數字後的日期
        NSDate *sectionDate = [NSCalendar date:fromDate addMonth:add];
        
        // 轉日期格式 yyyy年MM月
        dateFormatter.dateFormat = @"yyyy年MM月";
        NSString *dateString = [dateFormatter stringFromDate:sectionDate];
        reusableView.timeString = dateString;

        return reusableView;
    } else {
        return nil;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewDidScroll == =%f", scrollView.contentOffset.y);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={WIDTH, 44};
    return size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = WIDTH/7.0f;
    return CGSizeMake(width, width);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
}


#pragma mark-getter and setter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        HECalendarLayout *layout = [[HECalendarLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[HECalendarCell class] forCellWithReuseIdentifier:cellID];
        [_collectionView registerClass:[HESectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reusableID];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (NSMutableArray *)sectionRows {
    if (!_sectionRows) {
        _sectionRows = [[NSMutableArray alloc]init];
    }
    return _sectionRows;
}

@end
