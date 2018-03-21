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

- (NSString *)testParams:(NSDictionary *)dic {
    NSLog(@"%@", dic);
//    NSLog(@"%@", dic2);
    
    return @"Hello world";
}

- (void)testAsyn:(NSString *)msg :(void (^) (NSString* _Nullable result, BOOL complete))completionHandler {
    completionHandler([msg stringByAppendingString:@"[ async call]"], YES);
}

- (void)chooseImage:(NSDictionary *)args :(void (^) (NSDictionary* _Nullable result, BOOL complete)) completionHandler {
    NSDictionary *dic = @{
                          @"srcList" : @[
                                    @"https://ps.ssl.qhmsg.com/t01f1a1c26b103424b7.jpg"
                                    ],
                          };
    
    completionHandler(dic, YES);
}

- (void)previewImage:(NSDictionary *)data {
    NSLog(@"data = %@", data);
    // data.current  data.urls
    NSLog(@"调用图片浏览控件");
}

- (void)uploadImage:(NSDictionary *)data :(void (^) (NSDictionary* _Nullable result, BOOL complete))completionHandler {
    NSLog(@"data = %@", data);
    NSInteger state = 0;
    NSInteger count = 0;
    NSString *result = @"continue";
    switch (state) {
        case 0:
            result = @"continue";
            break;
        case 1:
            result = @"cancel";
            break;
        case 2:
            result = @"fail";
            break;
        default:
            result = @"confirm";
            break;
    }
    NSDictionary *dic = @{
                          @"state" : result,
                          @"count" : [NSNumber numberWithInteger:count],
                          };
    if ([result isEqualToString:@"continue"]) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            for (int i = 1; i < 10; i++) {
                NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithDictionary:dic];
                [dic1 setObject:[NSNumber numberWithInt:i] forKey:@"count"];
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionHandler(dic1, NO);
                });
                [NSThread sleepForTimeInterval:2];
            }
        });
    } else {
        completionHandler(dic, YES);
    }
}

@end
