//
//  EffictiveViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/8/10.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "EffictiveViewController.h"
#import "EffictiveObjc.h"

@interface EffictiveViewController ()<UIAlertViewDelegate>

@end

@implementation EffictiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    EffictiveObjc *objc = [[EffictiveObjc alloc] init];
    objc.on = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)askUserAQuestion {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Question" message:@"What do you want to do ?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self doCancel];
    } else {
        [self doContinue];
    }
}

- (void)doCancel {
    
}

- (void)doContinue {
    
}

@end
