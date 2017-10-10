//
//  XYDeviceManager.h
//  XY.iOS
//
//  Created by Lix on 2017/9/13.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LSDeviceDataDelegate <NSObject>

- (void)didReceiveData:(NSString *)tag content:(NSString *)content;

@end

@interface XYDeviceManager : NSObject

@property(nonatomic, weak) id<LSDeviceDataDelegate> delegate;

IMSingletonH()

- (void)initializeSDK;

- (void)addDelegate;

@end
