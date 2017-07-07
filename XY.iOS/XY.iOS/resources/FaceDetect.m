//
//  FaceDetect.m
//  XY.iOS
//
//  Created by Lix on 2017/7/7.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "FaceDetect.h"

@implementation FaceDetect

- (void)faceDetectWithImage:(UIImage *)image ImageView:(UIImageView *)imageView {
    NSDictionary *opts = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
    CIImage *faceImage = [CIImage imageWithCGImage:image.CGImage];
    CIDetector *faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:opts];
    NSArray *features = [faceDetector featuresInImage:faceImage];
    CGSize inputImageSize = [faceImage extent].size;
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, -1);
    transform = CGAffineTransformTranslate(transform, 0, -inputImageSize.height);
    
    for (CIFaceFeature *faceFeature in features) {
        CGRect faceViewBounds = CGRectApplyAffineTransform(faceFeature.bounds, transform);
        CGSize viewSize = imageView.bounds.size;
        CGFloat scale = MIN(viewSize.width / inputImageSize.width, viewSize.height / inputImageSize.height);
        CGFloat offsetX = (viewSize.width - inputImageSize.width * scale) / 2;
        CGFloat offsetY = (viewSize.height - inputImageSize.height * scale) /2;
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scale, scale);
        faceViewBounds = CGRectApplyAffineTransform(faceViewBounds, scaleTransform);
        faceViewBounds.origin.x += offsetX;
        faceViewBounds.origin.y += offsetY;
        UIView *faceView = [[UIView alloc] initWithFrame:faceViewBounds];
        faceView.layer.borderWidth = 2;
        faceView.layer.borderColor = [[UIColor redColor] CGColor];
        [imageView addSubview: faceView];
        if (faceFeature.hasLeftEyePosition) {
            NSLog(@"左眼坐标 x: %f y: %f", faceFeature.leftEyePosition.x, faceFeature.leftEyePosition.y);
        }
        if (faceFeature.hasRightEyePosition) {
            NSLog(@"右眼坐标 x: %f y: %f", faceFeature.rightEyePosition.x, faceFeature.rightEyePosition.y);
        }
        if (faceFeature.hasMouthPosition) {
            NSLog(@"嘴巴坐标 x: %f y: %f", faceFeature.mouthPosition.x, faceFeature.mouthPosition.y);
        }
    }
}

@end
