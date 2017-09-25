//
//  LSBScanCallBack.h
//  LSBleDevice
//
//  Created by lifesense－mac on 17/4/21.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSScanDeviceInfo.h"

/**
 扫描设备协议
 */
@protocol LSScanDeviceDelegate <NSObject>

/**
 扫描到的设备回调

 @param deviceInfo 扫描到的设备信息
 */
- (void)onScanResult:(LSScanDeviceInfo *)deviceInfo;

@end
