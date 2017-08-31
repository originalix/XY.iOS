//
//  RichTextViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/8/31.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "RichTextViewController.h"

@interface RichTextViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation RichTextViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.text = @"#话题# Do you like wsx";
    [self checkRichText:self.textView.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private Method
- (void)checkRichText:(NSString *)text {
//    NSString *text = @"#话题# Do you like wsx";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange textRange = NSMakeRange(0, text.length);
    NSString *patterns = @"#[^#]+#";
    NSError *error = nil;
    NSRegularExpression *expression = [[NSRegularExpression alloc] initWithPattern:patterns options:NSRegularExpressionCaseInsensitive error:&error];
    [expression enumerateMatchesInString:text options:NSMatchingReportProgress range:textRange usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
//        NSLog(@"%@", result);
//        NSString *subString = [text substringWithRange:[result range]];
        NSDictionary *dic = @{
                              @"NSForegroundColorAttributeName" : [UIColor blueColor]
                              };
        [attributedString addAttributes:dic range:result.range];
    }];
}


@end
