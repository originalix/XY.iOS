//
//  JSBridgeController.m
//  XY.iOS
//
//  Created by Lix on 2018/2/5.
//  Copyright © 2018年 Lix. All rights reserved.
//

#import "JSBridgeController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol WebExport <JSExport>

JSExportAs
(myLog ,
 - (NSString *)myOCLog :(NSString *)string
 );


@end

@interface JSBridgeController ()<UIWebViewDelegate,WebExport>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic,strong)JSContext *context;

@end

@implementation JSBridgeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.110/code-repo/bridge.html"]]];
    self.webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSString *)myOCLog :(NSString *)string{
    
    NSLog(@"你好,世界!");
    return @"hello world";
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    self.context.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue)
    {
        context.exception = exceptionValue;
    };
    
    __weak typeof(self)temp = self;
    //    self.context[@"myAction"] = ^(){
    //
    //        [temp.navigationController popViewControllerAnimated:YES];
    //
    //    };
    //    self.context[@"log"] = ^(NSString *string){
    //
    //        NSLog(@"%@",string);
    //
    //    };
    //
    //    self.context[@"native"] = self;
    
    //    NSString* (^logBlock)(NSString *,NSString *) = ^(NSString * str1,NSString *str2){
    //        return [NSString stringWithFormat:@"%@%@",str1,str2];
    //    };
    //
    //    self.context[@"htmlCallApp"] =  ^(NSString *a, NSString *b) {
    //        logBlock(a, b);
    //    };
    
    //    self.context[@"htmlCallApp"]  = ^JSValue *(JSValue *string, JSValue *a){
    //        NSLog(@"%@", [string toString]);
    //        return [JSValue valueWithObject:@"asdfasdfad" inContext:temp.context];
    //    };
    
    self.context[@"ocAlert"] = ^JSValue *(JSValue *string){
        NSLog(@"%@", [string toString]);
        return [JSValue valueWithObject:@"oc ahh" inContext:temp.context];
    };
    
    self.context[@"jsCallApp"]  = ^JSValue *(JSValue *string, JSValue *a){
        NSLog(@"%@", [string toString]);
        return [JSValue valueWithObject:@"apptokennnnnnn" inContext:temp.context];
    };
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    self.context.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue)
    {
        context.exception = exceptionValue;
    };
    
    __weak typeof(self)temp = self;
    //    self.context[@"myAction"] = ^(){
    //
    //        [temp.navigationController popViewControllerAnimated:YES];
    //
    //    };
    //    self.context[@"log"] = ^(NSString *string){
    //
    //        NSLog(@"%@",string);
    //
    //    };
    //
    //    self.context[@"native"] = self;
    
    //    NSString* (^logBlock)(NSString *,NSString *) = ^(NSString * str1,NSString *str2){
    //        return [NSString stringWithFormat:@"%@%@",str1,str2];
    //    };
    //
    //    self.context[@"htmlCallApp"] =  ^(NSString *a, NSString *b) {
    //        logBlock(a, b);
    //    };
    
    self.context[@"htmlCallApp"]  = ^JSValue *(JSValue *string, JSValue *a){
        NSLog(@"%@", [string toString]);
        return [JSValue valueWithObject:@"asdfasdfad" inContext:temp.context];
    };
    
    self.context[@"ocAlert"] = ^JSValue *(JSValue *string){
        NSLog(@"%@", [string toString]);
        return [JSValue valueWithObject:@"oc ahh" inContext:temp.context];
    };
    
    self.context[@"jsCallApp"]  = ^JSValue *(JSValue *string, JSValue *a){
        NSLog(@"%@", [string toString]);
        return [JSValue valueWithObject:@"apptokennnnnnn" inContext:temp.context];
    };
}

@end
