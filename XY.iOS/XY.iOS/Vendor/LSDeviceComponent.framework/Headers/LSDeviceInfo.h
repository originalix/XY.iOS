//
//  LSDeviceInfo.h
//  LSDeviceComponent
//
//  Created by hanfeng.li on 2017/3/28.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConstant.h"
#import "lsmodel_function_inc.h"

/**
 蓝牙设备详细信息
 */
@interface LSDeviceInfo : NSObject

/**
 设备名
 */
@property (nonatomic, strong) NSString *name;

/**
 设备类型
 */
@property (nonatomic, assign) LSDeviceType deviceType;

/**
 设备型号
 */
@property (nonatomic, strong) NSString *model;

/**
 设备Id
 */
@property (nonatomic, strong) NSString *deviceId;

/**
 厂商名字
 */
@property (nonatomic, strong) NSString *manufacturerName;

/**
 硬件版本
 */
@property (nonatomic, strong) NSString *hardwareVersion;

/**
 固件版本
 */
@property (nonatomic, strong) NSString *softwareVersion;

/**
 mac地址
 */
@property (nonatomic, strong) NSString *macAddress;

/**
 设备支持的所有功能
 */
@property (nonatomic, strong) NSArray<LSBaseFunction *> *functions;

@end











