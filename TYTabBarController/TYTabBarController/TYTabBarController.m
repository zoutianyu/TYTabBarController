//
//  TYTabBarController.m
//
//  Created by zou tianyu on 15/1/27.
//  Copyright (c) 2015年 zou tianyu. All rights reserved.
//

#import "TYTabBarController.h"
#import "UIViewController+TYTabBarControllerItem.h"
#import "TYTabBarItem.h"

@interface TYTabBarController ()<TYTabBarItemDelagate> {
  UIImageView *_buttomView;
}

@end

@implementation TYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  _buttomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tabBar.frame), CGRectGetHeight(self.tabBar.frame))];
  _buttomView.backgroundColor = [UIColor whiteColor];
  _buttomView.userInteractionEnabled = YES;
  [self.tabBar addSubview:_buttomView];
}

- (void)setViewControllers:(NSArray *)viewControllers {
  [super setViewControllers:viewControllers];
  
  CGFloat tabWidth = [UIScreen mainScreen].bounds.size.width / (float)viewControllers.count;
  
  for (int i = 0; i < viewControllers.count; ++i) {
    UIViewController *vc = [viewControllers objectAtIndex:i];
    
    CGRect tabFrame = CGRectMake(i*tabWidth, 0, tabWidth, self.tabBar.frame.size.height);
    vc.tyTabBarItem.frame = tabFrame;
    vc.tyTabBarItem.delegate = self;
    [vc.tyTabBarItem refreshFrame:tabFrame];
    [self.tabBar addSubview:vc.tyTabBarItem];
  }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setDefaultSelectedIndex:(NSInteger)index {
  for (int i = 0; i < self.viewControllers.count; ++i) {
    UIViewController *vc = [self.viewControllers objectAtIndex:i];
    TYTabBarItem *item = ((UIViewController *)[self.viewControllers objectAtIndex:index]).tyTabBarItem;
    if (item == vc.tyTabBarItem) {
      vc.tyTabBarItem.isSelected = YES;
    } else {
      vc.tyTabBarItem.isSelected = NO;
    }
  }
  _defaultSelectedIndex = index;
  [self setSelectedIndex:index];
}

- (void)setTabBarBackgroundColor:(UIColor *)tabBarBackgroundColor {
  _buttomView.backgroundColor = tabBarBackgroundColor;
  _tabBarBackgroundColor = tabBarBackgroundColor;
}

- (void)setTabBarBackgroundImage:(UIImage *)tabBarBackgroundImage {
  [_buttomView setBackgroundColor:[UIColor colorWithPatternImage:tabBarBackgroundImage]];
  _tabBarBackgroundImage = tabBarBackgroundImage;
}

#pragma mark - TYTabBarItemDelagate
- (void)didSelectedItem:(TYTabBarItem *)item {
  for (int i = 0; i < self.viewControllers.count; ++i) {
    UIViewController *vc = [self.viewControllers objectAtIndex:i];
    if (item == vc.tyTabBarItem) {
      vc.tyTabBarItem.isSelected = YES;
      [self setSelectedIndex:i];
    } else {
      vc.tyTabBarItem.isSelected = NO;
    }
  }
}
@end
