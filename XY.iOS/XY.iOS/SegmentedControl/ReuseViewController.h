//
//  ReuseViewController.h
//  XY.iOS
//
//  Created by Lix on 2017/12/17.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReuseViewController : UIViewController

@property (nonatomic, copy) NSString *contentURL;
@property (nonatomic, assign) NSInteger categoryId;

- (void)reloadData;

@end
