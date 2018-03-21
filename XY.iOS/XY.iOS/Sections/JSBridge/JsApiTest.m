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
                                    @"https://google.com"
                                    ],
                          };
    
    completionHandler(dic, YES);
}

- (void)previewImage:(NSDictionary *)data {
    NSLog(@"data = %@", data);
    // data.current  data.urls
    NSLog(@"调用图片浏览控件");
}

@end
