//
//  XYXNetWorkFetcher.m
//  XY.iOS
//
//  Created by Lix on 2017/9/14.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYXNetWorkFetcher.h"

@implementation XYXNetWorkFetcher {
    NSURL *_url;
}

- (id)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

- (void)startWithCompletionHandler:(XYXNetworkFetcherCompletionHandler)handler {
    if (handler) {
        NSString *string = @"Hello wsx";
        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
        handler(data);
    }
}

@end

@implementation XYXNetworkClass {
    NSCache *_cache;
}

- (id)init {
    if ((self = [super init])) {
        _cache = [[NSCache alloc] init];
        _cache.countLimit = 100;
        _cache.totalCostLimit = 5 * 1024 * 1024;
    }
    return self;
}

- (void)downloadDataForURL:(NSURL *)url {
    NSData *cachedData = [_cache objectForKey:url];
    if (cachedData) {
        NSLog(@"显示缓存data");
        [self p_useData:cachedData];
    } else {
        XYXNetWorkFetcher *fetcher = [[XYXNetWorkFetcher alloc] initWithURL:url];
        [fetcher startWithCompletionHandler:^(NSData *data) {
            [_cache setObject:data forKey:url];
            [self p_useData:data];
        }];
    }
}

- (void)p_useData:(NSData *)data {
    NSLog(@"data->>> : %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

@end
