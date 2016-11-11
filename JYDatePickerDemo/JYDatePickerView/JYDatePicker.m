//
//  CIBDatePicker.m
//  CIBHD
//
//  Created by Jolie_Yang on 2016/11/8.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "JYDatePicker.h"

@interface JYDatePicker () {
    
}
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@end
@implementation JYDatePicker
- (instancetype)initWithFrame:(CGRect)frame {
    self = [self initWithFrame:frame style:JYDatePickerStyleYearMonthDay];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(JYDatePickerStyle)style {
    self = [super initWithFrame:frame];
    if (self) {
        self.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"Chinese"];
        self.backgroundColor = [UIColor whiteColor];
        self.datePickerMode = UIDatePickerModeDate;
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        if (style == JYDatePickerStyleYearMonthDay) {
            [df setDateFormat:@"yyyy-MM-dd"];
        } else if (style == JYDatePickerStyleYearMonth) {
            [df setDateFormat:@"yyyy-MM"];
            
            // 遮盖“天”
            UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width*2/3, 0, self.frame.size.width*1/3, self.frame.size.height)];
            whiteView.backgroundColor = [UIColor whiteColor];
            [self addSubview:whiteView];
        }
        self.dateFormatter = df;
        self.dateString = [self.dateFormatter stringFromDate:[self date]];
        
        [self addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    
    return self;
}

#pragma mark Action
- (void)datePickerValueChanged:(id)sender {
    NSString *dateString = [self.dateFormatter stringFromDate:self.date];
    self.dateString = dateString;
    if ([self.delegate respondsToSelector:@selector(datePickerDidChangedValue:)]) {
        [self.delegate datePickerDidChangedValue:self];
    }
}

#pragma mark Set
- (void)setDateString:(NSString *)dateString {
    if ([dateString isEqualToString:@""]) return;
    if (_dateString != dateString) {
        _dateString = dateString;
        
        NSDate *date = [self getDatePickerDateFromDateString:dateString];
        if (date) {
            [self setDate:date animated:YES];
        }
    }
}
- (void)setMaximumDateString:(NSString *)maximumDateString {
    if ([maximumDateString isEqualToString:@""]) return;
    
    if (_maximumDateString != maximumDateString) {
        _maximumDateString = maximumDateString;
        
        NSDate *date = [self getDatePickerDateFromDateString:_maximumDateString];
        self.maximumDate = date;
    }
}
- (void)setMinimumDateString:(NSString *)minimumDateString {
    if ([minimumDateString isEqualToString:@""]) return;
    
    if (_minimumDateString != minimumDateString) {
        _minimumDateString = minimumDateString;
        
        NSDate *date = [self getDatePickerDateFromDateString:minimumDateString];
        self.minimumDate = date;
    }
}

#pragma mark Tool
- (NSDate *)getDatePickerDateFromDateString:(NSString *)dateString {
    return [self.dateFormatter dateFromString:dateString];
}
@end

