//
//  CIBDoubleDatePicker.m
//  CIBHD
//
//  Created by Jolie_Yang on 2016/11/9.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "JYDoubleDatePicker.h"
#import "JYDatePicker.h"

@interface JYDoubleDatePicker ()<JYDatePickerDelegate> {
    JYDobuleDatePickerStyle _doubleDatePickerStyle;
}

@end

@implementation JYDoubleDatePicker
- (instancetype)initWithFrame:(CGRect)frame {
    self = [self initWithFrame:frame style:JYDoubleDatePickerStyleDayFromTo];
    
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame style:(JYDobuleDatePickerStyle)style {
    self = [super initWithFrame:frame];
    if (self) {
        _doubleDatePickerStyle = style;
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat waveLabelWidth = 50;
        CGFloat datePickerWidth = (self.frame.size.width - waveLabelWidth) / 2;
        CGFloat height = self.frame.size.height;
        CGFloat waveLabelX = datePickerWidth;
        CGFloat datePickerY = 0;
        
        JYDatePickerStyle datePickerStyle;
        if (_doubleDatePickerStyle == JYDoubleDatePickerStyleDayFromTo) {
            datePickerStyle = JYDatePickerStyleYearMonthDay;
        } else {
            datePickerStyle = JYDatePickerStyleYearMonth;
            waveLabelX = waveLabelX*2/3;
            waveLabelWidth = 105;
        }
        
        CGRect startDatePickerRect = CGRectMake(0, datePickerY, datePickerWidth, height);
        CGRect waveLBRect = CGRectMake(waveLabelX, 0, waveLabelWidth, height);
        CGRect endDatePickerRect = CGRectMake(waveLabelX + waveLabelWidth, datePickerY, datePickerWidth, height);
        
        // 开始日期
        self.startDatePicker = [[JYDatePicker alloc] initWithFrame:startDatePickerRect style:datePickerStyle];
        self.startDatePicker.delegate = self;
        [self addSubview:self.startDatePicker];
        
        // ~
        UILabel *waveLB = [[UILabel alloc] initWithFrame:waveLBRect];
        waveLB.text = @"~";
        waveLB.font = [UIFont systemFontOfSize:30];
        waveLB.textAlignment = NSTextAlignmentCenter;
        waveLB.backgroundColor = [UIColor whiteColor];
        [self addSubview:waveLB];
        
        // 结束日期
        self.endDatePicker = [[JYDatePicker alloc] initWithFrame:endDatePickerRect style:datePickerStyle];
        self.endDatePicker.delegate = self;
        [self addSubview:self.endDatePicker];
    }
    
    return self;
}

#pragma mark CIBDatePickerDelegate
- (void)datePickerDidChangedValue:(JYDatePicker *)datePicker {
    if (datePicker == self.startDatePicker) {
        [self.endDatePicker setMinimumDateString:self.startDatePicker.dateString];
    } else if (datePicker == self.endDatePicker) {
        [self.startDatePicker setMaximumDateString:self.endDatePicker.dateString];
    } else {
        
    }
}

#pragma mark Set
- (void)setMaximumDateString:(NSString *)maximumDateString {
    [self.startDatePicker setMaximumDateString:maximumDateString];
    [self.endDatePicker setMaximumDateString:maximumDateString];
}

- (void)setMinimumDateString:(NSString *)minimumDateString {
    [self.startDatePicker setMinimumDateString:minimumDateString];
    [self.endDatePicker setMinimumDateString:minimumDateString];
}


#pragma mark Method
- (void)setStartDatePickerDateWithDateString:(NSString *)dateString {
    [self.startDatePicker setDateString:dateString];
}

- (void)setEndDatePickerDateWithDateString:(NSString *)dateString {
    [self.endDatePicker setDateString:dateString];
}

@end
