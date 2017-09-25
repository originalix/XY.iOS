//
//  LSWeightData.h
//  LSDeviceComponent
//
//  Created by hanfeng.li on 2017/7/18.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"

/**
 体重数据
 */
@interface LSWeightData : LSBaseDataModel

/**
 用户ID
 */
@property (nonatomic, assign) NSUInteger userNo;

/**
 体重单位
 */
@property (nonatomic, assign) LSWeightUnit unit;

/**
 体重
 */
@property (nonatomic, assign) float weight;

/**
 时间戳
 */
@property (nonatomic, assign) NSUInteger time;


@end
