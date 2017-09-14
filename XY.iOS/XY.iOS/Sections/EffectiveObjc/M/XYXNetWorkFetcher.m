//
//  XYXNetWorkFetcher.m
//  XY.iOS
//
//  Created by Lix on 2017/9/14.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYXNetWorkFetcher.h"

@implementation XYXNetWorkFetcher

@end

@implementation XYXNetworkClass {
    NSCache *_cache;
}

- (id)init {
    if ((self = [super init])) {
        _cache = [NSCache new];
        _cache.countLimit = 100;
        _cache.totalCostLimit = 5 * 1024 * 1024;
    }
    return self;
}

- (void)downloadDataForURL:(NSURL *)url {
    NSData *cacheData = [_cache objectForKey:url];
    if (cacheData) {
        [self useData:cacheData];
    } else {
        XYXNetWorkFetcher *fetcher = [[XYXNetWorkFetcher alloc] initWithURL:url];
        [fetcher startWithCompletionHandler:^(NSData *data) {
            [_cache setObject:data forKey:url cost:data.length];
            [self useData:data];
            
        }];
    }
}

- (void)useData:(NSData *)data {
    NSLog(@"data->>> : %@", data);
}

@end
