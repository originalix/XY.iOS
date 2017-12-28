//
//  WebBridgeViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/12/28.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "WebBridgeViewController.h"
#import <WebKit/WebKit.h>
#import "WebViewJavascriptBridge.h"

@interface WebBridgeViewController ()

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) WebViewJavascriptBridge *bridge;

@end

@implementation WebBridgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithWebView {
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *userController = [[WKUserContentController alloc] init];
    config.userContentController = userController;
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) configuration:config];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
}

- (void)initBridge {
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:_webView];
    [self.bridge registerHandler:@"ObjC Echo" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"ObjC Echo called with: %@", data);
        responseCallback(data);
    }];
    
    [self.bridge callHandler:@"JS Echo" data:nil responseCallback:^(id responseData) {
        NSLog(@"ObjC received response: %@", responseData);
    }];
}

@end
