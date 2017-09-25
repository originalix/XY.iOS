//
//  LSWeightUnitData.h
//  LSDeviceComponent
//
//  Created by hanfeng.li on 2017/7/18.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"

/**
 体重秤的单位
 */
@interface LSWeightUnitData : LSBaseDataModel

/**
 单位类型
 */
@property (nonatomic ,assign) LSWeightUnit unit;

@end
