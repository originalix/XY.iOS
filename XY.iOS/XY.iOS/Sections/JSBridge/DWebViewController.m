//
//  DWebViewController.m
//  XY.iOS
//
//  Created by Lix on 2018/3/20.
//  Copyright © 2018年 Lix. All rights reserved.
//

#import "DWebViewController.h"
#import "DWKWebView.h"
#import "JsApiTest.h"
#import "JsApiShare.h"

@interface DWebViewController ()

@property (nonatomic, strong) DWKWebView *dwebView;

@end

@implementation DWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dwebView = [[DWKWebView alloc] initWithFrame:self.view.bounds];
    [self.dwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.102/code-repo/hybrid/hybrid.html"]]];
    [self.view addSubview:self.dwebView];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    self.navigationItem.leftBarButtonItem = item;
    
    [self.dwebView addJavascriptObject:[[JsApiTest alloc] init] namespace:nil];
    
    [self.dwebView callHandler:@"addValue" arguments:@[@3, @5] completionHandler:^(id  _Nullable value) {
        NSLog(@"%@", value);
    }];
    
    [self.dwebView addJavascriptObject:[[JsApiShare alloc] init] namespace:@"share"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)refresh {
    [self.dwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.102/code-repo/hybrid/hybrid.html"]]];
}

@end
