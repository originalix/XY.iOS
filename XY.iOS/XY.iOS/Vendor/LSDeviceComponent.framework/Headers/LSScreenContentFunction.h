//
//  LSScreenContentFunction.h
//  LSDeviceComponent
//
//  Created by apple on 2017/6/7.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseFunction.h"

/**
 屏幕内容功能
 */
@interface LSScreenContentFunction : LSBaseFunction

/**
 * 支持的屏幕页类型列表(LSScreenContentType列表)
 **/
@property (nonatomic, strong) NSArray<NSNumber *> *contents;

@end
