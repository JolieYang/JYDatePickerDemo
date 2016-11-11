//
//  ViewController.m
//  JYDatePicker
//
//  Created by Jolie_Yang on 2016/10/12.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "ViewController.h"
#import "JYDatePicker.h"
#import "JYDoubleDatePicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    JYDatePicker *datePicker = [[JYDatePicker alloc] initWithFrame:CGRectMake(40, 40, 300, 160)];
    [self.view addSubview:datePicker];
    
    // 遮盖日期效果还有待改善
    JYDoubleDatePicker *doubleDatePicker = [[JYDoubleDatePicker alloc] initWithFrame:CGRectMake(40, 400, 500, 180) style:JYDoubleDatePickerStyleMonthFromTo];
    [self.view addSubview:doubleDatePicker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
