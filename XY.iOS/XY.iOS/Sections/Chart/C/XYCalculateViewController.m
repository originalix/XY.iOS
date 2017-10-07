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
    [self.firstStr appendString:[self realNumber:sender.tag]];
    self.label.text = self.firstStr;
}

- (NSString *)realNumber:(NSInteger)tag {
    return [NSString stringWithFormat:@"%ld", tag - 100];
}

- (IBAction)plusFunction:(id)sender {
    
}

- (IBAction)resultFunction:(id)sender {
    
}

@end
