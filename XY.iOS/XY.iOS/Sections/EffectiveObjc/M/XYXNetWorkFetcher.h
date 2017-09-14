//
//  XYXNetWorkFetcher.h
//  XY.iOS
//
//  Created by Lix on 2017/9/14.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^XYXNetworkFetcherCompletionHandler)(NSData *data);
@interface XYXNetWorkFetcher : NSObject
- (id)initWithURL:(NSURL *)url;
- (void)startWithCompletionHandler:(XYXNetworkFetcherCompletionHandler)handler;

@end

@interface XYXNetworkClass: NSObject
- (id)init;
- (void)downloadDataForURL:(NSURL *)url;
@end
