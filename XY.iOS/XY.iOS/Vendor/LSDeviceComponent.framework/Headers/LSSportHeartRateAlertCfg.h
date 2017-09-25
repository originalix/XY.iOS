//
//  LSSportHeartRateAlertCfg.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/10.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 运动心率提醒
 */
@interface LSSportHeartRateAlertCfg : NSObject

/**
 运动心率提醒开关, 默认:NO
 */
@property (nonatomic, assign) BOOL enable;

/**
 最低心率, 默认：70
 */
@property (nonatomic, assign) NSUInteger min;

/**
 最大心率, 默认：120
 */
@property (nonatomic, assign) NSUInteger max;

@end
