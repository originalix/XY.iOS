//
//  JSBridgeController.m
//  XY.iOS
//
//  Created by Lix on 2018/2/5.
//  Copyright © 2018年 Lix. All rights reserved.
//

#import "JSBridgeController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface JSBridgeController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation JSBridgeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.110/code-repo/bridge.html"]]];
    self.webView.delegate = self;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)refresh {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.110/code-repo/bridge.html"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
}

@end
