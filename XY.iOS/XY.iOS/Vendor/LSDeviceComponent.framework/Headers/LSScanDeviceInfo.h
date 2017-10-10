//
//  LSScanDeviceInfo.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/4/21.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 扫描到的设备信息
 */
@interface LSScanDeviceInfo : NSObject

/**
 广播名
 */
@property (nonatomic, strong) NSString *name;

/**
 mac地址
 */
@property (nonatomic, strong) NSString *macAddress;

/**
 服务ID列表
 */
@property (nonatomic, strong) NSArray<NSString *> *services;

/**
 信号强度(负数，越小越大),如信号强度为0，则说明这个设备为系统配对设备
 */
@property (nonatomic, assign) NSInteger rssi;

#pragma mark 乐心互联设备专用

/**
 Company ID
 */
@property (nonatomic, assign) NSUInteger companyID;

/**
 厂商ID
 */
@property (nonatomic, assign) NSUInteger vendorID;

/**
 设备是否已注册
 */
@property (nonatomic, assign) BOOL isRegister;

@end
