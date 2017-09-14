//
//  XYXMainViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/14.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYXMainViewController.h"
#import "XYXNetWorkFetcher.h"

@interface XYXMainViewController ()

@end

@implementation XYXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)cacheButtonAction:(id)sender {
    [self testCache];
}

- (void)testCache {
    XYXNetworkClass *networkClass = [[XYXNetworkClass alloc] init];
    NSURL *url = [NSURL URLWithString:@"wsx.com"];
    [networkClass downloadDataForURL:url];
}

@end
