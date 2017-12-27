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
@property (nonatomic, strong) NSArray *urls;

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
    _reuseManager.capacity = 10;
    [_reuseManager registerClass:[ReuseViewController class] forReuseIdentifier:@"reuseViewController"];
    
    self.titles = @[@"百度", @"腾讯", @"阿里", @"头条", @"新浪", @"人民网", @"网易", @"V2EX", @"知乎", @"虎扑", @"京东"];
    self.urls = @[
                  @"http://baidu.com",
                  @"http://www.qq.com/",
                  @"http://www.taobao.com/",
                  @"http://www.toutiao.com/",
                  @"http://www.sina.com/",
                  @"http://people.com.cn/",
                  @"http://www.163.com/",
                  @"http://www.v2ex.com/",
                  @"http://www.zhihu.com/",
                  @"http://www.hupu.com/",
                  @"http://www.jd.com/",
                  ];
    [self setupSegment];
    [self setupScrollView];
    [self sliderToViewAtIndex:0];
    
}

- (void)setupSegment {
    _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:self.titles];
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
    if (index == 1) {
        [self.segmentedControl setSectionTitles:@[@"百度", @"腾讯", @"阿里", @"头条", @"新浪", @"人民网", @"网易", @"V2EX", @"知乎", @"虎扑", @"京东", @"新增的"]];
    }
    
    NSLog(@"slider to %@",@(index));
    NSInteger categoryId = index;
    ReuseViewController *vc = [self.reuseManager dequeueReuseableViewControllerWithIdentifier:@"reuseViewController" forKey:[NSString stringWithFormat:@"%@", @(categoryId)]];
    if (!vc.parentViewController) {
        [self addChildViewController:vc];
    }
    
    vc.categoryId = categoryId;
    vc.contentURL = self.urls[index];
    
    if (vc.isReused) {
        [vc reloadData];
    }
    
    [_scrollView layoutIfNeeded];
    vc.view.frame = CGRectMake(kScreenWidth * index, 0, kScreenWidth, CGRectGetHeight(_scrollView.frame));
    [_scrollView addSubview:vc.view];
    
    if (self.segmentedControl.selectedSegmentIndex != index) {
        [self.segmentedControl setSelectedSegmentIndex:index animated:true];
    }
    
    [_scrollView setContentOffset:CGPointMake(kScreenWidth * index, 0)];
}

- (void)titleSegmentControlChanged:(HMSegmentedControl *)segmentedControl {
//    NSLog(@"%ld", segmentedControl.selectedSegmentIndex);
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
