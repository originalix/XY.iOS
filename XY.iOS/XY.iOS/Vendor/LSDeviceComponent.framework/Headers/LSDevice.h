//
//  LSDevice.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/4/20.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConstant.h"

/**
 蓝牙设备(连接设备需要用到的必要信息)
 */
@interface LSDevice : NSObject

/**
 mac地址
 */
@property (nonatomic, copy) NSString *macAddress;

/**
 设备标识
 */
@property (nonatomic, copy) LSDeviceId deviceId;

@end
