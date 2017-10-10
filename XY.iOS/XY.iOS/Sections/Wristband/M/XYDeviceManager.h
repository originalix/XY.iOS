//
//  XYDeviceManager.h
//  XY.iOS
//
//  Created by Lix on 2017/9/13.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEVICE_CONNECT_STATE_CHANGE_KEY  @"DEVICE_CONNECT_STATE_CHANGE_KEY"
#define ADD_DEVICE_TO_DB_KEY  @"ADD_DEVICE_TO_DB_KEY"
#define DELETE_DEVICE_TO_DB_KEY  @"DELETE_DEVICE_TO_DB_KEY"
#define BLE_STATE_CHANGE_KEY  @"BLE_STATE_CHANGE_KEY"
#define DEVICE_DETAILINFO_KEY @"DEVICE_DETAILINFO_KEY"
#define SET_MAIN_DEVICE @"SET_MAIN_DEVICE"

@protocol LSDeviceDataDelegate <NSObject>

- (void)didReceiveData:(NSString *)tag content:(NSString *)content;

@end

@interface XYDeviceManager : NSObject

@property(nonatomic, weak) id<LSDeviceDataDelegate> delegate;

IMSingletonH()

- (void)initializeSDK;

- (void)addDelegate;

@end
