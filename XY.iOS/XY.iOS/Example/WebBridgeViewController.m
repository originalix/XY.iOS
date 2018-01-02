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

@interface WebBridgeViewController () <WKUIDelegate, WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) WebViewJavascriptBridge *bridge;

@end

@implementation WebBridgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithWebView];
    [self initBridge];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    self.navigationItem.rightBarButtonItem = item;
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"Bridge" style:UIBarButtonItemStylePlain target:self action:@selector(testBridge)];
    self.navigationItem.leftBarButtonItem = item1;
}

- (void)refresh {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.112//yiidemo/basic/web/index.php?r=site/bridge"]]];
}

- (void)testBridge {
    [self.bridge callHandler:@"getLocalData" data:@"lixxxxxxxxxx" responseCallback:^(id responseData) {
        NSLog(@"Current UIWebView page URL is : %@", responseData);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithWebView {
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *userController = [[WKUserContentController alloc] init];
    config.userContentController = userController;
    [userController addScriptMessageHandler:self name:@"saveLocalData"];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) configuration:config];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.112//yiidemo/basic/web/index.php?r=site/bridge"]]];
    self.webView.UIDelegate = self;
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction  actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:true completion:completionHandler];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSDictionary *dic = message.body;
    NSLog(@"%@", dic);
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
    
    [self.bridge registerHandler:@"saveLocalData" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"save local data : %@", data);
    }];
}

@end
