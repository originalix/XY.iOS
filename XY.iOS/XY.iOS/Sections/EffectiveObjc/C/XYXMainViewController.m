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
#import "XYLayerViewController.h"

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

- (IBAction)calayerButtonAction:(id)sender {
    XYLayerViewController *layerController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"XYLayerViewController"];
    [self.navigationController pushViewController:layerController animated:true];
}

- (void)testCache:(XYXNetworkClass *)p_networkClass {
    NSURL *url = [NSURL URLWithString:@"wsx.com"];
    [p_networkClass downloadDataForURL:url];
}

- (IBAction)imageDataAction:(id)sender {
    UIImage *image = [UIImage imageNamed:@"face1.jpg"];
    XYXImageZip *imageZip = [[XYXImageZip alloc] init];
    [imageZip calculateImage:image];
    [self.imageView setImage:image];
    
    UIImage *image1 = [UIImage imageNamed:@"face1.jpg"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"face2" ofType:@"png"];
    UIImage *image2 = [UIImage imageWithContentsOfFile:path];
    NSLog(@"image1 = %@, image2 = %@, path = %@", image1, image2, path);
}

@end
