//
//  CameraController.m
//  XY.iOS
//
//  Created by Lix on 2017/7/7.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "CameraController.h"
#import <iflyMSC/IFlyFaceSDK.h>

#define IFLY_APPID @"58413222"

@interface CameraController () <IFlyFaceRequestDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IFlyFaceDetector *faceDetector;
@property (nonatomic, strong) IFlyFaceRequest *faceRequest;

@end

@implementation CameraController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"face1"];
    self.imageView.image = image;
//    self.faceDetector = [IFlyFaceDetector sharedInstance];
//    [self.faceDetector setParameter:@"1" forKey:@"detect"];
//    [self.faceDetector setParameter:@"1" forKey:@"align"];
//    [self.faceDetector setParameter:[IFlySpeechConstant FACE_ALIGN] forKey:[IFlySpeechConstant FACE_SST]];
//    [self.faceDetector setParameter:@"1" forKey:[IFlySpeechConstant FACE_DETECT]];
//    [self.faceDetector setParameter:@"1" forKey:[IFlySpeechConstant FACE_ALIGN]];
//    [self.faceDetector setParameter:@"1" forKey:[IFlySpeechConstant FACE_ATTR]];
//    [self imageDetector];
    self.faceRequest = [IFlyFaceRequest sharedInstance];
    self.faceRequest.delegate = self;
    [self.faceRequest setParameter:[IFlySpeechConstant FACE_ALIGN] forKey:[IFlySpeechConstant FACE_SST]];
    [self.faceRequest setParameter:IFLY_APPID forKey:[IFlySpeechConstant APPID]];
    NSData *data = UIImageJPEGRepresentation(self.imageView.image, 0);
    [self.faceRequest sendRequest:data];
}

- (void)onEvent:(int)eventType WithBundle:(NSString *)params {
    NSLog(@"onEvent | params:%@",params);
}

- (void)onData:(NSData *)data {
    NSLog(@"onData |");
    NSString *rs = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"result = %@", rs);
}

- (void)onCompleted:(IFlySpeechError *)error {
    NSLog(@"onCompleted | error:%@",[error errorDesc]);
    NSString* errorInfo=[NSString stringWithFormat:@"错误码：%d\n 错误描述：%@",[error errorCode],[error errorDesc]];
    NSLog(@"error = %@", errorInfo);
}

- (void)imageDetector {
    NSString *rs = [self.faceDetector detectARGB:[self.imageView image]];
    NSLog(@"result = %@", rs);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
