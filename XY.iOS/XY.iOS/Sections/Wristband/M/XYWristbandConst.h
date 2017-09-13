//
//  XYWristbandConst.h
//  XY.iOS
//
//  Created by Lix on 2017/9/13.
//  Copyright © 2017年 Lix. All rights reserved.
//

#ifndef XYWristbandConst_h
#define XYWristbandConst_h

/* 单例宏 */
#define IMSingletonH(name) + (instancetype)shared##name;

#define IMSingletonM(name) \
static id _instance;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
return _instance;\
}\
+ (instancetype)shared##name{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[self alloc] init];\
});\
return _instance;\
}\
- (id)copyWithZone:(NSZone *)zone{\
return _instance;\
}
#endif /* XYWristbandConst_h */
