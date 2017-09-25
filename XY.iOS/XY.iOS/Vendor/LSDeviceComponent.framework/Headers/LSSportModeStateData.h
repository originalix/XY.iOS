//
//  LSSportModeStateData.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/4.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"

/**
 运动模式状态数据
 */
@interface LSSportModeStateData : LSBaseDataModel

/**
 运动功能,1:GPS状态
 */
@property (nonatomic, assign) NSUInteger type;

/**
 运动模式状态，0:开始,1:结束
 */
@property (nonatomic, assign) NSUInteger state;

/**
 运动模式
 */
@property (nonatomic, assign) LSSportMode sportMode;

@end
