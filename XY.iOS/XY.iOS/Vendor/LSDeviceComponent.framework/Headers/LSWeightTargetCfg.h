//
//  LSWeightTargetCfg.h
//  LSDeviceComponent
//
//  Created by hanfeng.li on 2017/8/30.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConstant.h"

/**
 体重目标设置
 */
@interface LSWeightTargetCfg : NSObject

/**
 * 用户号, 默认:0
 */
@property (nonatomic ,assign) NSInteger userNo;

/**
 * 目标类型, 默认:LSWeightTargetTypeWeight
 */
@property (nonatomic ,assign) LSWeightTargetType type;

/**
 * 目标体重值, 默认:60
 */
@property (nonatomic ,assign) float value;

@end
