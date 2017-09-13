//
//  LSAutomaticSportsCfg.h
//  LSleDevice
//
//  Created by apple on 2017/7/12.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConstant.h"

/**
 自动识别多运动
 */
@interface LSAutomaticSportsCfg : NSObject
/**
 * 运动类型
 */
@property (nonatomic, assign) LSAutomaticSportsType type;

/**
 * 自动识别开关
 */
@property (nonatomic, assign) BOOL enable;


@end
