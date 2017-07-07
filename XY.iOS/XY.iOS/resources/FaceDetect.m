//
//  FaceDetect.m
//  XY.iOS
//
//  Created by Lix on 2017/7/7.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "FaceDetect.h"

@implementation FaceDetect

//- (void)faceDetectWithImage:(UIImage *)image ImageView:(UIImageView *)imageView {
//    NSDictionary *opts = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
//    CIImage *faceImage = [CIImage imageWithCGImage:image.CGImage];
//    CIDetector *faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:opts];
//    NSArray *features = [faceDetector featuresInImage:faceImage];
//    CGSize inputImageSize = [faceImage extent].size;
//    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, -1);
//    transform = CGAffineTransformTranslate(transform, 0, -inputImageSize.height);
//    
//    for (CIFaceFeature *faceFeature in features) {
//        CGRect faceViewBounds = CGRectApplyAffineTransform(faceFeature.bounds, transform);
//        CGSize viewSize = imageView.bounds.size;
//        CGFloat scale = MIN(viewSize.width / inputImageSize.width, viewSize.height / inputImageSize.height);
//        CGFloat offsetX = (viewSize.width - inputImageSize.width * scale) / 2;
//        CGFloat offsetY = (viewSize.height - inputImageSize.height * scale) /2;
//        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scale, scale);
//        faceViewBounds = CGRectApplyAffineTransform(faceViewBounds, scaleTransform);
//        faceViewBounds.origin.x += offsetX;
//        faceViewBounds.origin.y += offsetY;
//        UIView *faceView = [[UIView alloc] initWithFrame:faceViewBounds];
//        faceView.layer.borderWidth = 2;
//        faceView.layer.borderColor = [[UIColor redColor] CGColor];
//        [imageView addSubview: faceView];
//        if (faceFeature.hasLeftEyePosition) {
//            NSLog(@"左眼坐标 x: %f y: %f", faceFeature.leftEyePosition.x, faceFeature.leftEyePosition.y);
//        }
//        if (faceFeature.hasRightEyePosition) {
//            NSLog(@"右眼坐标 x: %f y: %f", faceFeature.rightEyePosition.x, faceFeature.rightEyePosition.y);
//        }
//        if (faceFeature.hasMouthPosition) {
//            NSLog(@"嘴巴坐标 x: %f y: %f", faceFeature.mouthPosition.x, faceFeature.mouthPosition.y);
//        }
//        NSLog(@"x: %f, y: %f, width: %f, height: %f", faceViewBounds.origin.x, faceViewBounds.origin.y, faceViewBounds.size.width, faceViewBounds.size.height);
//    }
//}

- (void)faceDetectWithImage:(UIImage *)image ImageView:(UIImageView *)imageView {
    // 图像识别能力：可以在CIDetectorAccuracyHigh(较强的处理能力)与CIDetectorAccuracyLow(较弱的处理能力)中选择
    NSDictionary *opts = [NSDictionary dictionaryWithObject:
                          CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
    // 将图像转换为CIImage
    CIImage *faceImage = [CIImage imageWithCGImage:image.CGImage];
    CIDetector *faceDetector=[CIDetector detectorOfType:CIDetectorTypeFace context:nil options:opts];
    // 识别出人脸数组
    NSArray *features = [faceDetector featuresInImage:faceImage];
    // 得到图片的尺寸
    CGSize inputImageSize = [faceImage extent].size;
    //将image沿y轴对称
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, -1);
    //将图片上移
    transform = CGAffineTransformTranslate(transform, 0, -inputImageSize.height);
    
    // 取出所有人脸
    for (CIFaceFeature *faceFeature in features){
        //获取人脸的frame
        CGRect faceViewBounds = CGRectApplyAffineTransform(faceFeature.bounds, transform);
        CGSize viewSize = imageView.bounds.size;
        CGFloat scale = MIN(viewSize.width / inputImageSize.width,
                            viewSize.height / inputImageSize.height);
        CGFloat offsetX = (viewSize.width - inputImageSize.width * scale) / 2;
        CGFloat offsetY = (viewSize.height - inputImageSize.height * scale) / 2;
        // 缩放
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scale, scale);
        // 修正
        faceViewBounds = CGRectApplyAffineTransform(faceViewBounds,scaleTransform);
        faceViewBounds.origin.x += offsetX;
        faceViewBounds.origin.y += offsetY;
        
        //描绘人脸区域
        UIView* faceView = [[UIView alloc] initWithFrame:faceViewBounds];
        faceView.layer.borderWidth = 2;
        faceView.layer.borderColor = [[UIColor redColor] CGColor];
        [imageView addSubview:faceView];
        
        // 判断是否有左眼位置
        if(faceFeature.hasLeftEyePosition){}
        // 判断是否有右眼位置
        if(faceFeature.hasRightEyePosition){}
        // 判断是否有嘴位置
        if(faceFeature.hasMouthPosition){}
    }
}

- (void)drawWithPoint:(CGPoint)point ImageView:(UIImageView *)imageView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, 10, 10)];
    view.backgroundColor = [UIColor yellowColor];
    [imageView addSubview:view];
}

@end
