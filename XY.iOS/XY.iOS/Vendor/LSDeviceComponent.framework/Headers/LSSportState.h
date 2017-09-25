//
//  LSSportState.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/3.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 运动状态数据
 */
@interface LSSportState : NSObject

/**
 状态开始的时间戳(秒)
 */
@property (nonatomic, assign) NSUInteger time;

/**
 运动状态(0:开始,1:结束,2:暂停,3:重新开始)
 */
@property (nonatomic, assign) NSUInteger state;

@end
