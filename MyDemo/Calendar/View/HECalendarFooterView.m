//
//  HECalendarFooterView.m
//  MyDemo
//
//  Created by MGN on 2017/6/27.
//  Copyright © 2017年 com.mgn.test. All rights reserved.
//

#import "HECalendarFooterView.h"

@interface HECalendarFooterView()

/** 注 */
@property (nonatomic, strong) UILabel *tipsLabel;
/** 查询按钮 */
@property (nonatomic, strong) UIButton *selectButton;

@end

@implementation HECalendarFooterView

#pragma mark-系统覆盖
- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        [self initCommon];
        [self makeConstraints];
    }
    return self;
}

#pragma mark-自定义方法
/** 添加控件 */
- (void)initCommon {
    [self addSubview:self.tipsLabel];
    [self addSubview:self.selectButton];
}

/** 添加约束 */
- (void)makeConstraints {
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.trailing.mas_equalTo(-20);
        make.leading.mas_equalTo(20);
    }];
    
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tipsLabel.mas_bottom).with.offset(20);
        make.leading.mas_equalTo(20);
        make.trailing.mas_equalTo(-20);
        make.height.mas_equalTo(44);
    }];
}

- (NSMutableAttributedString*) changeLabelWithText:(NSString*)needText {
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:needText];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorFromHexString:@"#c8013c"] range:NSMakeRange(7,4)];
    return attrString;
}

#pragma mark-懒加载
- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc]init];
        _tipsLabel.textAlignment = NSTextAlignmentLeft;
        _tipsLabel.numberOfLines = 0;
        _tipsLabel.font = [UIFont systemFontOfSize:13.0f];
        _tipsLabel.text = @"注：仅可查询近30天内的包裹记录，更多包裹记录请联系客服400-406-999进行查询";
        _tipsLabel.attributedText = [self changeLabelWithText:_tipsLabel.text];
        
    }
    return _tipsLabel;
}

- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [[UIButton alloc]init];
        _selectButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
        [_selectButton setTitle:@"查询" forState:UIControlStateNormal];
        [_selectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_selectButton setBackgroundColor:[UIColor colorFromHexString:@"#c8013c"]];
        _selectButton.layer.cornerRadius = 6.f;
        _selectButton.layer.masksToBounds = YES;
    }
    return _selectButton;
}

@end
