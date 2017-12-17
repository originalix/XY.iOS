//
//  HMRootViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/12/16.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "HMRootViewController.h"
#import "HMSegmentedControl.h"
#import "SliderPageReuseManager.h"
#import "ReuseViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface HMRootViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) SliderPageReuseManager *reuseManager;

@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *titles;

@end

@implementation HMRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor yellowColor];
    [self setupUIView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupUIView {
    _reuseManager = [[SliderPageReuseManager alloc] init];
    _reuseManager.capacity = 3;
    [_reuseManager registerClass:[ReuseViewController class] forReuseIdentifier:@"reuseViewController"];
    
    self.titles = @[@"百度", @"腾讯", @"阿里"];
    [self setupSegment];
    [self setupScrollView];
    [self sliderToViewAtIndex:0];
    
}

- (void)setupSegment {
    _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"One", @"Two", @"Three"]];
    _segmentedControl.frame = CGRectMake(0, 64, kScreenWidth, 60);
    _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    _segmentedControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName: [UIFont systemFontOfSize:17.f]}];
    [_segmentedControl setSelectedTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];
    [_segmentedControl addTarget:self action:@selector(titleSegmentControlChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentedControl];
}

- (void)setupScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 124, kScreenWidth, kScreenHeight - 124)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(kScreenWidth * self.titles.count, 0);
}

- (void)sliderToViewAtIndex:(NSInteger)index {
    
}

- (void)titleSegmentControlChanged:(HMSegmentedControl *)segmentedControl {
    NSLog(@"%ld", segmentedControl.selectedSegmentIndex);
    [self sliderToViewAtIndex:segmentedControl.selectedSegmentIndex];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    double dIndex = scrollView.contentOffset.x / kScreenWidth;
    NSInteger index = (NSInteger)(dIndex + 0.5);
    if (index == self.segmentedControl.selectedSegmentIndex) {
        return;
    }
    
    [self sliderToViewAtIndex:(index)];
}
@end
