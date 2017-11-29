//
//  LSEDevice.h
//  XY.iOS
//
//  Created by Lix on 2017/10/9.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LSDeviceComponent/LSDeviceComponent.h>

typedef enum : NSUInteger {
    LSEDeviceStateDisConnect,
    LSEDeviceStateConnect,
    LSEDeviceStateConnecting,
} LSEDeviceConnectState;

@interface LSEDevice : NSObject

@property (nonatomic, assign) LSEDeviceConnectState connectState;
@property (nonatomic ,strong) LSScanDeviceInfo *deviceInfo;
@property (nonatomic, strong) LSDeviceInfo *detailInfo;

@end
