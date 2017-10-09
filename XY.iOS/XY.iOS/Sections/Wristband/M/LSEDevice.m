//
//  LSEDevice.m
//  XY.iOS
//
//  Created by Lix on 2017/10/9.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "LSEDevice.h"

@implementation LSEDevice

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.connectState = LSEDeviceStateDisConnect;
    }
    return self;
}

@end
