//
//  EffictiveObjc.h
//  XY.iOS
//
//  Created by Lix on 2017/8/10.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const EFCStringConstant; //example Notification

//enum EOCConnectionState {
//    EOCConnectionStateDisconnected = 1,
//    EOCConnectionStateConnecting,
//    EOCConnectionStateConnected
//};
//
//typedef enum EOCConnectionState EOCConnectionState;

typedef NS_ENUM(NSUInteger, EOCConnectionState) {
    EOCConnectionStateDisconnected, 
    EOCConnectionStateConnecting,
    EOCConnectionStateConnected,
};

typedef NS_OPTIONS(NSUInteger, EOCPermittedDirection) {
    EOCPermittedDirectionUp      = 1 << 0,
    EOCPermittedDirectionDwon    = 1 << 1,
    EOCPermittedDirectionLeft    = 1 << 2,
    EOCPermittedDirectionRight   = 1 << 3,
};

@interface EffictiveObjc : NSObject

//enum EOCConnectionState state = EOCConnectionStateConnected;

@property (nonatomic, getter=isOn) BOOL on;
@property (nonatomic, copy) NSString *firstName;

- (instancetype)initWithFirstName:(NSString *)firstName;

@end
