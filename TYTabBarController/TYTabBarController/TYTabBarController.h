//
//  TYTabBarController.h
//
//  Created by zou tianyu on 15/1/27.
//  Copyright (c) 2015年 zou tianyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+TYTabBarControllerItem.h"
#import "TYTabBarItem.h"

@interface TYTabBarController : UITabBarController

@property (nonatomic, assign) NSInteger defaultSelectedIndex;
@property (nonatomic, strong) UIColor *tabBarBackgroundColor;
@property (nonatomic, strong) UIImage *tabBarBackgroundImage;

@end
