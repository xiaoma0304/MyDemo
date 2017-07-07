//
//  HECalendarLayout.m
//  MyDemo
//
//  Created by MGN on 2017/6/30.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "HECalendarLayout.h"

@implementation HECalendarLayout

- (instancetype)init {
    if (self=[super init]) {
        self.minimumInteritemSpacing = 0;
        self.minimumLineSpacing = 0;
    }
    return self;
}

- (NSArray *) layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray * attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    /* 处理左右间距 */
//    
//    for (UICollectionViewLayoutAttributes *attr in attributes) {
//        NSLog(@"%@", NSStringFromCGRect([attr frame]));
//    }
//    
//    for(int i = 1; i < [attributes count]; ++i) {
//        //当前attributes
//        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
//        //上一个attributes
//        UICollectionViewLayoutAttributes *prevLayoutAttributes = attributes[i - 1];
//        //我们想设置的最大间距，可根据需要改
//        NSInteger maximumSpacing = 0;
//        //前一个cell的最右边
//        NSInteger origin = CGRectGetMaxX(prevLayoutAttributes.frame);
//        NSLog(@"------%d", origin);
//        //如果当前一个cell的最右边加上我们想要的间距加上当前cell的宽度依然在contentSize中，我们改变当前cell的原点位置
//        //不加这个判断的后果是，UICollectionView只显示一行，原因是下面所有cell的x值都被加到第一行最后一个元素的后面了
//        if(origin + maximumSpacing + currentLayoutAttributes.frame.size.width < self.collectionViewContentSize.width) {
//            CGRect frame = currentLayoutAttributes.frame;
//            frame.origin.x = origin + maximumSpacing;
//            currentLayoutAttributes.frame = frame;
//        }
//        
//    }
//    
//    for (UICollectionViewLayoutAttributes *attr in attributes) {
//        NSLog(@"%@", NSStringFromCGRect([attr frame]));
//    }
    return attributes;
    
}

//- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    NSArray *supersAttributes = [super layoutAttributesForElementsInRect:rect];
//    
////    if (self.direction == RSDFDatePickerCollectionViewLayoutDirectionRightToLeft) {
//        for (UICollectionViewLayoutAttributes *attributes in supersAttributes) {
//            CGRect frame = attributes.frame;
//            frame.origin.x = CGRectGetWidth(rect) - CGRectGetWidth(attributes.frame) - CGRectGetMinX(attributes.frame);
//            attributes.frame = frame;
//        }
////    }
//    
//    return supersAttributes;
//}




@end
