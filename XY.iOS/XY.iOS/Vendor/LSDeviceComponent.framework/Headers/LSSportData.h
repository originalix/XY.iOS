//
//  LSSportData.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/3.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"

/**
 运动数据
 */
@interface LSSportData : LSBaseDataModel

/**
 运动数据的类型
 */
@property (nonatomic, assign) LSSportMode sportMode;


/**
 根据mode值来使用实际的运动数据模型
 */
@property (nonatomic, assign) LSBaseDataModel *data;

@end
