//
//  LSReminderFunction.h
//  LSDeviceComponent
//
//  Created by apple on 2017/6/7.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseFunction.h"

/**
 提醒功能
 */
@interface LSReminderFunction : LSBaseFunction

/**
 * 所支持的提醒设置类型，LSReminderType列表
 **/
@property (nonatomic, strong) NSArray<NSNumber *> *reminderTypes;

@end
