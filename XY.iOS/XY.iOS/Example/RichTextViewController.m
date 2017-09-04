//
//  RichTextViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/8/31.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "RichTextViewController.h"

@interface RichTextViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation RichTextViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.text = @"#话题# hello world";
    [self checkRichText:self.textView.text];
    self.textView.editable = false;
    self.textView.selectable = true;
//    //设置链接的属性 设置那一段颜色
//    NSDictionary *linkAttributes =@{
//                                    NSForegroundColorAttributeName:[UIColor redColor]};
//    self.textView.linkTextAttributes = linkAttributes;
//    /** 设置自动检测类型为链接网址. */
//    self.textView.dataDetectorTypes = UIDataDetectorTypeAll;
    
    self.textView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private Method
- (void)checkRichText:(NSString *)text {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange textRange = NSMakeRange(0, text.length);
    NSString *patterns = @"#[^#]+#";
    NSError *error = nil;
    NSRegularExpression *expression = [[NSRegularExpression alloc] initWithPattern:patterns options:NSRegularExpressionCaseInsensitive error:&error];
    
    [expression enumerateMatchesInString:text options:NSMatchingReportProgress range:textRange usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:[result range]];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:[result range]];
        NSString *matchString = [text substringWithRange:result.range];
        NSLog(@"%@", matchString);
        NSString *test = @"话题";
        test = [test stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [attributedString addAttribute:NSLinkAttributeName value:test range:[result range]];
        self.textView.attributedText = attributedString;
    }];
}

#pragma mark - textView delegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"-> : %@", textView.text);
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"->> : %@", textView.text);
    [self checkRichText:textView.text];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSString *url = [[URL absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@", url);
    return true;
}

@end
