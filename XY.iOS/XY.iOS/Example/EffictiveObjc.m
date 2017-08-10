//
//  EffictiveObjc.m
//  XY.iOS
//
//  Created by Lix on 2017/8/10.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "EffictiveObjc.h"
#import <objc/objc-runtime.h>

#define ANIMATION_DURATION 0.3 //NOT GOOD

static const NSTimeInterval kAnimationDuration = 0.3; //GOOD

//if need be public const
NSString *const EFCStringConstant = @"VALUE";

@interface EffictiveObjc()

@end

@implementation EffictiveObjc

- (instancetype)initWithFirstName:(NSString *)firstName {
    self = [super init];
    if (self) {
        self.on = false;
        self.firstName = [firstName copy];
        [self test];
    }
    return self;
}

- (void)test {
    NSMutableArray *array = [@[@1, @2] mutableCopy];
    NSLog(@"%@", array);
    
    Method originalMethod = class_getInstanceMethod([EffictiveObjc class], @selector(lowercaseString));
    Method swappedMethod = class_getInstanceMethod([EffictiveObjc class], @selector(uppercaseString));
    
    method_exchangeImplementations(originalMethod, swappedMethod);
    
    NSString *lower = [self lowercaseString];
    NSLog(@"%@", lower);
    NSString *uppper = [self uppercaseString];
    NSLog(@"%@", uppper);
}

- (NSString *)lowercaseString {
    return @"this is lowercase string";
}

- (NSString *)uppercaseString {
    return @"this is uppercase string";
}

@end
