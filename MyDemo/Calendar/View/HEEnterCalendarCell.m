//
//  HEEnterCalendarCell.m
//  MyDemo
//
//  Created by MGN on 2017/6/27.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "HEEnterCalendarCell.h"

@interface HEEnterCalendarCell()

/** 开始时间名字 */
@property (nonatomic, strong) UILabel *timeNameLabel;
/** 开始时间 */
@property (nonatomic, strong) UILabel *timeLabel;
/** 跳转箭头 */
@property (nonatomic, strong) UIImageView *nextImageView;
/** 底部线 */
@property (nonatomic, strong) UIView *bottomLineView;

@end


@implementation HEEnterCalendarCell
#pragma mark-系统
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initCommon];
    }
    return self;
}

#pragma mark-自定义方法
/** 数据 */
- (void)setModel:(HECalendarModel *)model {
    if (model) {
        _model = model;
        self.timeNameLabel.text = model.nameString;
        self.timeLabel.text = model.timeString;
    }
}

/** 添加控件 */
- (void)initCommon {
    
    [self.contentView addSubview:self.timeNameLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.nextImageView];
    [self.contentView addSubview:self.bottomLineView];
    
    [self makeConstraints];
}

/** 添加约束 */
- (void)makeConstraints {
    [self.timeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.leading.mas_equalTo(15);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.timeNameLabel.mas_top);
        make.leading.mas_equalTo(self.timeNameLabel.mas_trailing).with.offset(15);
        make.bottom.mas_equalTo(self.timeNameLabel.mas_bottom);
        make.top.mas_equalTo(self.timeNameLabel.mas_top);
    }];
    
    [self.nextImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(18.0f, 18.0f));
        make.centerY.mas_equalTo(0);
        make.trailing.mas_equalTo(-15);
    }];
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1.0f);
        make.leading.mas_equalTo(15);
        make.trailing.mas_equalTo(-15);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.timeNameLabel.mas_bottom).with.offset(20);
    }];
}

#pragma mark-懒加载
- (UILabel *)timeNameLabel {
    if (!_timeNameLabel) {
        _timeNameLabel = [[UILabel alloc]init];
        _timeNameLabel.textAlignment = NSTextAlignmentLeft;
        _timeNameLabel.font = [UIFont systemFontOfSize:17.0f];
        _timeNameLabel.textColor = [UIColor redColor];
        _timeNameLabel.textColor = [UIColor colorFromHexString:@"#333333"];
        _timeNameLabel.text = @"开始时间";
    }
    return _timeNameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.font = [UIFont systemFontOfSize:17.0f];
        _timeNameLabel.textColor = [UIColor colorFromHexString:@"#333333"];
    }
    return _timeLabel;
}

- (UIImageView *)nextImageView {
    if (!_nextImageView) {
        _nextImageView = [[UIImageView alloc]init];
        _nextImageView.image = [UIImage imageNamed:@"list_icon_more"];
    }
    return _nextImageView;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc]init];
        _bottomLineView.backgroundColor = [UIColor colorFromHexString:@"#cccccc"];
    }
    return _bottomLineView;
}


@end
