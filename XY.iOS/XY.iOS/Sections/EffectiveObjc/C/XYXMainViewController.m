//
//  XYXMainViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/14.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYXMainViewController.h"
#import "XYXNetWorkFetcher.h"
#import "XYXImageZip.h"

@interface XYXMainViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation XYXMainViewController {
    XYXNetworkClass *_networkClass;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _networkClass = [[XYXNetworkClass alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)cacheButtonAction:(id)sender {
    [self testCache:_networkClass];
}

- (void)testCache:(XYXNetworkClass *)p_networkClass {
    NSURL *url = [NSURL URLWithString:@"wsx.com"];
    [p_networkClass downloadDataForURL:url];
}

- (IBAction)imageDataAction:(id)sender {
    UIImage *image = [UIImage imageNamed:@"face"];
    XYXImageZip *imageZip = [[XYXImageZip alloc] init];
    [imageZip calculateImage:image];
    [self.imageView setImage:image];
}

@end
