//
//  LSBodyCompositionData.h
//  LSDeviceComponent
//
//  Created by hanfeng.li on 2017/7/18.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"

/**
 体脂数据
 */
@interface LSBodyCompositionData : LSBaseDataModel

/**
 用户ID
 */
@property (nonatomic, assign) NSUInteger userNo;

/**
 时间戳
 */
@property (nonatomic, assign) NSUInteger time;

/**
 体重单位
 */
@property (nonatomic, assign) LSWeightUnit weightUnit;

/**
 体重
 */
@property (nonatomic, assign) float weight;

/**
 身体脂肪百分比(精度:0.1)
 */
@property (nonatomic, assign) float bfp;

/**
 基础代谢
 */
@property (nonatomic, assign) NSUInteger bm;

/**
 肌肉百分比
 */
@property (nonatomic, assign) float mp;

/**
 肌肉重量
 */
@property (nonatomic, assign) float mm;

/**
 除去脂肪重量
 */
@property (nonatomic, assign) float ffm;

/**
 软肌肉重量
 */
@property (nonatomic, assign) float slm;

/**
 身体水分含量
 */
@property (nonatomic, assign) float bwm;

@end
