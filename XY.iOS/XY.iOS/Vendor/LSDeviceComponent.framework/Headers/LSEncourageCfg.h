//
//  LSEncourageCfg.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/10.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConstant.h"

/**
 鼓励设置
 */
@interface LSEncourageCfg : NSObject

/**
 鼓励类型,默认:LSEncourageTypeStep(注意:watch, mt, gold, dd只支持LSEncourageTypeStep)
 */
@property (nonatomic, assign) LSEncourageType type;

/**
 开关(0:关，1:开),默认:YES
 */
@property (nonatomic, assign) BOOL enable;

/**
 目标值(卡路里的单位:0.1Kcal,距离单位:米), 默认:7000
 */
@property (nonatomic, assign) float value;

@end
