//
//  ProvincePickerView.m
//  ProvincePickerView
//
//  Created by FLY_AY on 15/12/9.
//  Copyright © 2015年 com.TYToO. All rights reserved.
//

#import "ProvincePickerView.h"

@interface ProvincePickerView()

@property(nonatomic,strong)NSArray * provinceArray;

@property(nonatomic,strong)NSArray * cityArray;

@property(nonatomic,strong)NSArray * chooseArray;

@property(nonatomic,strong)UIPickerView * pickerView;


@end

@implementation ProvincePickerView

-(instancetype)initWithFrame:(CGRect)frame;
{
    if (self = [super initWithFrame:frame]) {
        
        self.frame = frame;
        
        [self prapareData];
        
        [self buildUI];
    }
    return self;
}

//准备地区数据
-(void)prapareData
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Provineces" ofType:@"plist"];
    NSArray *data = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    self.provinceArray = [data valueForKey:@"ProvinceName"];
    
    //34个省会的市区信息数组的集合
    self.cityArray = [data valueForKey:@"cities"];
    
    
}

-(void)buildUI
{
    self.pickerView = [[UIPickerView alloc]init];
    self.pickerView.delegate = self;
    self.pickerView.backgroundColor = [UIColor redColor];
    self.pickerView.frame = self.frame;
    [self.pickerView selectRow:12 inComponent:0 animated:YES];//设置某列选择某行
    
    self.chooseArray = self.cityArray[12];
    
    [self addSubview:self.pickerView];
    
 
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        
        return self.provinceArray.count;
    }
    if (component == 1) {
        
        return self.chooseArray.count;
        
    }
    return 0;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
 -(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        
        return self.provinceArray[row];
    }
    if (component == 1) {
        
        return  self.chooseArray[row][@"CityName"];
        
    }
    return nil;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (component == 0)
    {
        self.chooseArray = self.cityArray[row];
        
        [self.pickerView reloadComponent:1];
        
    }
    
  
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
