//
//  JSBridgeController.m
//  XY.iOS
//
//  Created by Lix on 2018/2/5.
//  Copyright © 2018年 Lix. All rights reserved.
//

#import "JSBridgeController.h"
//#import <JavaScriptCore/JavaScriptCore.h>
#import "UIWebView+TS_JavaScriptContext.h"

@interface JSBridgeController ()<TSWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation JSBridgeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.110/code-repo/bridge.html"]]];
//    self.webView.delegate = self;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)refresh {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.110/code-repo/bridge.html"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)webView:(UIWebView *)webView didCreateJavaScriptContext:(JSContext *)ctx {
    ctx[@"htmlCallApp"] = ^NSDictionary *(NSString *eventName, NSString *params) {
        if ([eventName isEqualToString:@"getUserAgent"]) {
            return @{
                     @"app_token" : @"lixxxxxx",
                     @"user_id" : @2150,
                     @"platform_id" : @2,
                     };
        } else if ([eventName isEqualToString:@"login"]) {
            NSLog(@"调起登录, 包含参数: %@", params);
            return nil;
        } else if ([eventName isEqualToString:@"pay"]) {
            NSLog(@"弹起支付, 包含参数: %@", params);
            return @{
                     @"orderInfo": @"order"
                     };
        }
        
        return nil;
    };
}

@end
