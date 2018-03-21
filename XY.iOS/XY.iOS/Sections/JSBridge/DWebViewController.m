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
#import <objc/runtime.h>

@interface DWebViewController ()

@property (nonatomic, strong) DWKWebView *dwebView;
@property (nonatomic, strong) UIButton *backBtn;

@end

@implementation DWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dwebView = [[DWKWebView alloc] initWithFrame:self.view.bounds];
    [self.dwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.102/code-repo/hybrid/hybrid.html"]]];
    [self.view addSubview:self.dwebView];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backBtn.frame = CGRectMake(0, 0, 50, 30);
    [self.backBtn setTitle:@"返回" forState: UIControlStateNormal];
    [self.backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.backBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self.backBtn addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
    self.navigationItem.leftBarButtonItem = item;
    
    [self.dwebView addJavascriptObject:[[JsApiTest alloc] init] namespace:nil];
    
    [self.dwebView callHandler:@"addValue" arguments:@[@3, @5] completionHandler:^(id  _Nullable value) {
        NSLog(@"%@", value);
    }];
    
    [self.dwebView addJavascriptObject:[[JsApiShare alloc] init] namespace:@"share"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(takeoverBackBtn:) name:@"TAKE_OVER_BACK_BTN" object:nil];
}

- (void)takeoverBackBtn:(NSNotification *)notification {
    NSLog(@"%@", notification.userInfo);
    NSDictionary *userInfo = notification.userInfo;
    NSString *jscode = nil;
    if (userInfo[@"isTakeOver"] != nil && [userInfo[@"isTakeOver"] boolValue]) {
        jscode = userInfo[@"jscode"];
    }
    objc_setAssociatedObject(self.backBtn, @"jscode", jscode, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)refresh {
    NSString *jscode = objc_getAssociatedObject(self.backBtn, @"jscode");
    NSLog(@"jscode ===== %@", jscode);
    if (jscode) {
        NSLog(@"接管返回键");
        [self.dwebView evaluateJavaScript:jscode completionHandler:nil];
    } else {
        NSLog(@"原生返回");
//        [self.dwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.102/code-repo/hybrid/hybrid.html"]]];
    }
    objc_setAssociatedObject(self.backBtn, @"jscode", nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
