//
//  LSSpeedCfg.h
//  LSleDevice
//
//  Created by apple on 2017/7/12.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 速度配置
 */
@interface LSSpeedCfg : NSObject

/**
 * 时间,单位:秒,默认值:120
 */
@property (nonatomic ,assign) NSUInteger time;

/**
 * 距离,单位:米,默认值:100
 */
@property (nonatomic ,assign) NSUInteger distance;

@end
