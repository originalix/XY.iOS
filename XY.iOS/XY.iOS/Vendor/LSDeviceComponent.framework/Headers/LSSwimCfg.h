//
//  LSSwimCfg.h
//  LSleDevice
//
//  Created by apple on 2017/7/12.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 游泳参数配置
 */
@interface LSSwimCfg : NSObject

/**
 * 泳道长度,精确:米,默认:24
 */
@property (nonatomic ,assign) NSUInteger length;

@end
