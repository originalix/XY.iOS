//
//  XYXImageViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/28.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYXImageViewController.h"

@interface XYXImageViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation XYXImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.image) {
        return;
    }
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.imageView setImage: self.image];
    [self.view addSubview:self.imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
