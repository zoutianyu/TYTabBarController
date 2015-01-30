//
//  UIViewController+TYTabBarControllerItem.h
//
//  Created by zou tianyu on 15/1/28.
//  Copyright (c) 2015年 zou tianyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYTabBarItem;
@class TYTabBarController;

@interface UIViewController (TYTabBarControllerItem)

@property (nonatomic, strong) TYTabBarItem *tyTabBarItem;
@property (nonatomic, strong) TYTabBarController *tyTabBarController;

@end
