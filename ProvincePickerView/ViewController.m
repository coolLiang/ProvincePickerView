//
//  ViewController.m
//  ProvincePickerView
//
//  Created by FLY_AY on 15/12/9.
//  Copyright © 2015年 com.TYToO. All rights reserved.
//

#import "ViewController.h"

#import "ProvincePickerView.h"

@interface ViewController ()<ProvincePickerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ProvincePickerView * picker = [[ProvincePickerView alloc]initWithFrame:self.view.bounds];
    picker.delegate = self;
    [self.view addSubview:picker];

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)onChooseTheProvince:(NSString *)province
{
    
    NSLog(@"choose the province is %@",province);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
