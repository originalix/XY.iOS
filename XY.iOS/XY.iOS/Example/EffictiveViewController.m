//
//  EffictiveViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/8/10.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "EffictiveViewController.h"
#import "EffictiveObjc.h"
#import <objc/objc-runtime.h>

static const NSString *EOCMyAlertViewKey = @"EOCMyAlertViewKey";

@interface EffictiveViewController ()<UIAlertViewDelegate>

@end

@implementation EffictiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    EffictiveObjc *objc = [[EffictiveObjc alloc] initWithFirstName:@"Lix"];
    objc.on = YES;
    [self askUserAQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)askUserAQuestion {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Question" message:@"What do you want to do ?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    void (^block) (NSInteger) = ^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            [self doCancel];
        } else {
            [self doContinue];
        }
    };
    
    objc_setAssociatedObject(alert, (__bridge const void *)(EOCMyAlertViewKey), block, OBJC_ASSOCIATION_COPY);
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    void (^block) (NSInteger) = objc_getAssociatedObject(alertView, (__bridge const void *)(EOCMyAlertViewKey));
    block(buttonIndex);
}

- (void)doCancel {
    
}

- (void)doContinue {
    
}

@end
