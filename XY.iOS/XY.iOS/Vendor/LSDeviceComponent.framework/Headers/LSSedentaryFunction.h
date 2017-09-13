//
//  LSSedentaryFunction.h
//  LSDeviceComponent
//
//  Created by apple on 2017/6/7.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseFunction.h"

/**
  久坐功能
 */
@interface LSSedentaryFunction : LSBaseFunction

/**
 * 是否支持震动类型属性
 **/
@property (nonatomic ,assign) BOOL isSupportVibrationStyle;

@end
