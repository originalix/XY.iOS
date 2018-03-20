//
//  JsApiShare.m
//  XY.iOS
//
//  Created by Lix on 2018/3/20.
//  Copyright © 2018年 Lix. All rights reserved.
//

#import "JsApiShare.h"

@implementation JsApiShare

- (void)shareTimeline:(NSDictionary *)data :(void (^) (NSString* _Nullable result, BOOL complete))completionHandler {
    NSLog(@"data = %@", data);
    completionHandler(@"success", YES);
}

@end
