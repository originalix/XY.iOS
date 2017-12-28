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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
