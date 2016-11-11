//
//  CIBDatePicker.h
//  CIBHD
//
//  Created by Jolie_Yang on 2016/11/8.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger, JYDatePickerStyle) {
    JYDatePickerStyleYearMonthDay = 0,// 年月日
    JYDatePickerStyleYearMonth = 1, // 年月
};

@class JYDatePicker;

@protocol JYDatePickerDelegate <NSObject>

- (void)datePickerDidChangedValue:(JYDatePicker *)datePicker;

@end

@interface JYDatePicker : UIDatePicker

- (instancetype)initWithFrame:(CGRect)frame style:(JYDatePickerStyle)style;

@property (nonatomic, assign) JYDatePickerStyle datePickerStyle;
@property (nonatomic, weak) id <JYDatePickerDelegate> delegate;
@property (nonatomic, strong, readonly) NSDateFormatter *dateFormatter;
@property (nonatomic, copy) NSString *dateString;
@property (nonatomic, copy) NSString *maximumDateString;
@property (nonatomic, copy) NSString *minimumDateString;

@end




