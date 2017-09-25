//
//  ImageZip.m
//  XY.iOS
//
//  Created by Lix on 2017/9/14.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYXImageZip.h"

@implementation XYXImageZip

- (void)calculateImage:(UIImage *)image {
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    
    NSString *docsDir;
    NSArray *dirPaths;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"foo.jpg"]];
    NSLog(@"%@", databasePath);
    [data writeToFile:databasePath atomically:true];
    UIImage *testImage = [UIImage imageWithData:data];
    
    
    NSInteger imageDataLen = [data length];
    NSLog(@"image data length = %ld", imageDataLen);
    NSLog(@"image size = %@",[NSByteCountFormatter stringFromByteCount:data.length countStyle:NSByteCountFormatterCountStyleFile]);
    NSLog(@"File size is : %.2f MB",(float)data.length/1024.0f/1024.0f);
}

@end
