//
//  LSVibrationStyleCfg.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/4/28.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConstant.h"

/**
 震动配置
 */
@interface LSVibrationStyleCfg : NSObject

/**
 震动延时(范围:0~20秒),默认:2秒，来电提醒才生效，其它时候不生效
 */
@property (nonatomic, assign) NSUInteger delay;

/**
 振动持续时间(范围:1~60秒),默认:10秒
 */
@property (nonatomic, assign) NSUInteger duration;

/**
 震动模式,默认:LSVibrationModeCycle
 */
@property (nonatomic, assign) LSVibrationMode mode;

/**
 震动等级1(范围:0~9),默认:0
 */
@property (nonatomic, assign) NSUInteger intensity1;

/**
 震动等级2(范围:0~9),默认:0,当震动方式为持续震动时，该属性无效
 */
@property (nonatomic, assign) NSUInteger intensity2;

@end
