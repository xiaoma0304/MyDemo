//
//  HECalendarCell.m
//  MyDemo
//
//  Created by MGN on 2017/6/29.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "HECalendarCell.h"

@interface HECalendarCell()

/** 背景 */
@property (nonatomic, strong) UIImageView *bgImageView;

/** 时间 */
@property (nonatomic, strong) UILabel *timeLabel;
/** 选中 */
@property (nonatomic, strong) CALayer *selectLayer;
/** <#description#> */
@property (nonatomic, strong) CALayer *todayLayer;

@end



@implementation HECalendarCell

#pragma mark-系统覆盖
- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        [self selfConfig];
        [self initCommon];
        [self makeConstraints];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)layoutCALayer {
    
    [self clearLayer];
    
    if (self.timeString !=nil && ![self.timeString isEqualToString:@""]) {
        CALayer *selectionLayer = [[CALayer alloc] init];
        selectionLayer.backgroundColor = [UIColor colorFromHexString:@"fde8ee"].CGColor;
        selectionLayer.actions = @{@"hidden":[NSNull null]}; // Remove hiding animation
        [self.contentView.layer insertSublayer:selectionLayer below:self.timeLabel.layer];
        //    selectionLayer.cornerRadius = self.contentView.frame.size.width*0.5f+1;
        selectionLayer.masksToBounds = NO;
        selectionLayer = selectionLayer;
        selectionLayer.name = @"day";
        self.selectLayer = selectionLayer;
        selectionLayer.frame = CGRectMake(self.contentView.bounds.origin.x, self.contentView.bounds.origin.y+self.contentView.bounds.size.height*.2f, self.contentView.bounds.size.width+1, self.contentView.bounds.size.height*.6f);
    }
    
}

- (void)layoutCircle:(BOOL) isLeft {
    [self clearLayer];
    
//    [self layoutCALayer];
    if (self.isEndDay) {
        CALayer *spaceLayer = [[CALayer alloc] init];
        spaceLayer.backgroundColor = [UIColor colorFromHexString:@"fde8ee"].CGColor;
        spaceLayer.actions = @{@"hidden":[NSNull null]}; // Remove hiding animation
        [self.contentView.layer insertSublayer:spaceLayer below:self.timeLabel.layer];
        spaceLayer = spaceLayer;
        spaceLayer.name = @"day";
        self.selectLayer = spaceLayer;
        if (isLeft) {
            spaceLayer.frame = CGRectMake(self.contentView.bounds.origin.x+self.contentView.bounds.size.width*0.5+1, self.contentView.bounds.origin.y+self.contentView.bounds.size.height*.2f, self.contentView.bounds.size.width*0.5+1, self.contentView.bounds.size.height*.6f);
        } else {
            spaceLayer.frame = CGRectMake(self.contentView.bounds.origin.x-1, self.contentView.bounds.origin.y+self.contentView.bounds.size.height*.2f, self.contentView.bounds.size.width*0.5+1, self.contentView.bounds.size.height*.6f);
        }

    }

    self.timeLabel.textColor = [UIColor whiteColor];
    CALayer *selectionLayer = [[CALayer alloc] init];
    selectionLayer.backgroundColor = [UIColor colorFromHexString:@"c8013c"].CGColor;
    selectionLayer.actions = @{@"hidden":[NSNull null]}; // Remove hiding animation
    [self.contentView.layer insertSublayer:selectionLayer below:self.timeLabel.layer];
    selectionLayer.cornerRadius = self.contentView.frame.size.width*0.5f;
    selectionLayer.masksToBounds = NO;
    self.todayLayer = selectionLayer;
    selectionLayer.frame = CGRectMake(self.contentView.bounds.origin.x, self.contentView.bounds.origin.y, self.contentView.bounds.size.width, self.contentView.bounds.size.height);
    selectionLayer.name = @"today";

}

- (void)clearLayer {
    if (self.selectLayer !=nil) {
        [self.selectLayer removeFromSuperlayer];
    }
    
    if (self.todayLayer !=nil) {
        [self.todayLayer removeFromSuperlayer];
    }
}

#pragma mark-自定义方法
/** 配置 */
- (void)selfConfig {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
}

/** 添加控件 */
- (void)initCommon {
    [self.contentView addSubview:self.bgImageView];
    [self.contentView addSubview:self.timeLabel];
}

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    [super layoutSublayersOfLayer:layer];

}


/** 添加约束 */
- (void)makeConstraints {
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
}

#pragma mark-setter and getter
- (void)setTimeString:(NSString *)timeString {
    if (timeString) {
        _timeString = timeString;
        self.timeLabel.text = timeString;
        if ([timeString isEqualToString:@"今天"]) {
            self.isEndDay = NO;
            [self layoutCircle:NO];
        }
        
    }
}

- (void)setTimeColor:(NSString *)timeColor {
    if (timeColor) {
        _timeColor = timeColor;
        self.timeLabel.textColor = [UIColor colorFromHexString:timeColor];
    }
}


- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.font = [UIFont systemFontOfSize:14.0f];
        _timeLabel.text = @"22";
    }
    return _timeLabel;
}

@end
