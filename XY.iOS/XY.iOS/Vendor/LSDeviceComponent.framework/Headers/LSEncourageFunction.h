//
//  LSEncourageFunction.h
//  LSDeviceComponent
//
//  Created by apple on 2017/6/7.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseFunction.h"

/**
 鼓励功能
 */
@interface LSEncourageFunction : LSBaseFunction

/**
 * 支持的鼓励目标设置类型,LSEncourageType列表
 **/
@property (nonatomic, strong) NSArray<NSNumber *> *types;

@end
