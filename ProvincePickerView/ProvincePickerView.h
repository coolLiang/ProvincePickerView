//
//  ProvincePickerView.h
//  ProvincePickerView
//
//  Created by FLY_AY on 15/12/9.
//  Copyright © 2015年 com.TYToO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProvincePickerViewDelegate

-(void)onChooseTheProvince:(NSString *)province;

@end


@interface ProvincePickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

-(instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic,weak)id delegate;

@end
