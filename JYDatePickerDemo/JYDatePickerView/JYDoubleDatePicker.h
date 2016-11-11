//
//  CIBDoubleDatePicker.h
//  CIBHD
//
//  Created by Jolie_Yang on 2016/11/9.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JYDobuleDatePickerStyle) {
    JYDoubleDatePickerStyleDayFromTo = 0, // 年月日 ~ 年月日
    JYDoubleDatePickerStyleMonthFromTo = 1,// 年月 ~ 年月
};

@class JYDatePicker;

@interface JYDoubleDatePicker : UIView

- (instancetype)initWithFrame:(CGRect)frame style:(JYDobuleDatePickerStyle)style;

@property (nonatomic, assign, readonly) JYDobuleDatePickerStyle datePickerStyle;
@property (nonatomic, strong) JYDatePicker *startDatePicker;
@property (nonatomic, strong) JYDatePicker *endDatePicker;
@property (nonatomic, copy) NSString *maximumDateString;
@property (nonatomic, copy) NSString *minimumDateString;

- (void)setStartDatePickerDateWithDateString:(NSString *)dateString;
- (void)setEndDatePickerDateWithDateString:(NSString *)dateString;

@end
