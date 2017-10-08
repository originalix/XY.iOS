//
//  XYCalculateViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/10/7.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYCalculateViewController.h"

@interface XYCalculateViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) NSMutableString *firstStr;
@property (nonatomic, strong) NSMutableString *secondStr;
@property (nonatomic, assign) BOOL isFirst;
@property (nonatomic, assign) BOOL isPlus;
@end

@implementation XYCalculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isFirst = true;
    self.firstStr = [NSMutableString string];
    self.secondStr = [NSMutableString string];
    self.label.text = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showNumbers:(UIButton *)sender {
    if (self.isFirst) {
        [self.firstStr appendString:[self realNumber:sender.tag]];
        self.label.text = self.firstStr;
    } else {
        [self.secondStr appendString:[self realNumber:sender.tag]];
        self.label.text = self.secondStr;
    }
    
}

- (NSString *)realNumber:(NSInteger)tag {
    return [NSString stringWithFormat:@"%ld", tag - 100];
}

- (IBAction)plusFunction:(id)sender {
    self.isFirst = false;
    self.isPlus = true;
}

- (IBAction)resultFunction:(id)sender {
    NSInteger firstNum = [self.firstStr integerValue];
    NSInteger secondNum = [self.secondStr integerValue];
    if (self.isPlus) {
        NSInteger result = firstNum + secondNum;
        self.label.text = [NSString stringWithFormat:@"%ld", result];
    }
    self.firstStr = [NSMutableString string];
    self.secondStr = [NSMutableString string];
}

@end
