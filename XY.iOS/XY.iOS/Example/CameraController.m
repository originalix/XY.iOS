//
//  CameraController.m
//  XY.iOS
//
//  Created by Lix on 2017/7/7.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "CameraController.h"
#import "FaceDetect.h"

@interface CameraController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) FaceDetect *faceDetect;

@end

@implementation CameraController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"face1"];
    self.imageView.image = image;
//    [self.faceDetect faceDetectWithImage:image ImageView:self.imageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (FaceDetect *)faceDetect {
    if (!_faceDetect) {
        _faceDetect = [[FaceDetect alloc] init];
    }
    return _faceDetect;
}

@end
