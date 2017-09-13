//
//  LSReminderCfg.h
//  LSDeviceComponent
//
//  Created by lifesense on 17/5/6.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConstant.h"
#import "LSVibrationStyleCfg.h"

/**
 提醒配置
 */
@interface LSReminderCfg : NSObject

/**
 提醒类型,默认:来电提醒
 */
@property (nonatomic, assign) LSReminderType type;

/**
 是否开启,默认:NO
 */
@property (nonatomic, assign) BOOL enable;

/**
 震动的类型
 */
@property (nonatomic, strong) LSVibrationStyleCfg *vibrationStyle;

@end
