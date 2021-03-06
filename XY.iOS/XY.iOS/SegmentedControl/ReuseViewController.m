//
//  ReuseViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/12/17.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "ReuseViewController.h"
#import <WebKit/WebKit.h>
#import "UIViewController+Reuse.h"
#import "MJRefresh.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ReuseViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIView *refreshView;

@end

@implementation ReuseViewController {
    BOOL _isRegisterObserver;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewUI];
    [self.webView.scrollView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    if (_isRegisterObserver) {
        [self.webView.scrollView removeObserver:self forKeyPath:@"contentSize" context:@"LNArticleDetailController"];
    }
}

- (void)reloadData {
    NSLog(@"----> %s", __func__);
}

- (void)prepareForReuse {
    NSLog(@"----> %s", __func__);
    [self.webView loadHTMLString:[self html] baseURL:nil];
    [self.webView.scrollView.mj_header beginRefreshing];
}

- (void)setupViewUI {
    [self setupWebView];
}

- (void)setupWebView {
    
    self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    self.webView.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self.view addSubview:self.webView];
    self.webView.navigationDelegate = self;
    [self.webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:@"LNArticleDetailController"];

    _isRegisterObserver = true;
    if (_contentURL) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_contentURL]]];
    }
}

- (void)loadData {
    if (_contentURL) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_contentURL]]];
    }
}


#pragma mark - 监测WebView高度
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (![keyPath isEqualToString:@"contentSize"]) {
        return;
    }
    
    NSValue *sizeValue = change[NSKeyValueChangeNewKey];
    CGSize size = [sizeValue CGSizeValue];
    
    if (!((UIScrollView*)object == self.webView.scrollView)) {
        return;
    }
    if (size.height != self.webView.frame.size.height) {
        
    }
}

#pragma mark - WKWebView Navigation delegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"------>加载完成");
    [webView evaluateJavaScript:@"document.title" completionHandler:^(NSString * _Nullable title, NSError * _Nullable error) {
        if (title) {
            self.navigationItem.title = title;
        }
    }];
    NSString *url = webView.URL.absoluteString;

    if ([url isEqualToString:@"about:blank"]) {
        return;
    }
    [self.webView.scrollView.mj_header endRefreshing];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"date : %@", [NSDate date]);
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"----->error navi: %@", error.userInfo);
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"----->error prov: %@", error.userInfo);
}

#pragma mark - get && set
- (WKWebView *)webView {
    if (!_webView) {
        WKUserContentController *userContentController = [[WKUserContentController alloc] init];
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.allowsInlineMediaPlayback = true;
        config.requiresUserActionForMediaPlayback = false;
        config.allowsAirPlayForMediaPlayback = true;
        config.userContentController = userContentController;
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.view.frame.size.height) configuration:config];
        _webView.scrollView.scrollEnabled = true;
    }
    return _webView;
}

- (UIView *)refreshView {
    if (!_refreshView) {
        _refreshView = [[UIView alloc] init];
        _refreshView.backgroundColor = [UIColor redColor];
    }
    
    return _refreshView;
}

- (NSString *)html {
    return @"<!DOCTYPE html> <html lang='en'> <head> <meta charset='UTF-8'> <title></title> </head> <body> </body> </html>";
}

@end
