//
//  JsApiTest.m
//  XY.iOS
//
//  Created by Lix on 2018/3/20.
//  Copyright © 2018年 Lix. All rights reserved.
//

#import "JsApiTest.h"

@implementation JsApiTest

- (NSString *)testSyn:(NSString *)msg {
    return [msg stringByAppendingString:@"[ sync call ]"];
}

- (void)testAsyn:(NSString *)msg :(void (^) (NSString* _Nullable result, BOOL complete))completionHandler {
    completionHandler([msg stringByAppendingString:@"[ async call]"], YES);
}

@end
