//
//  UIViewController+TYTabBarControllerItem.m
//
//  Created by zou tianyu on 15/1/28.
//  Copyright (c) 2015年 zou tianyu. All rights reserved.
//

#import "UIViewController+TYTabBarControllerItem.h"
#import <objc/runtime.h>

static void * const kTabBarItemAssociatedStorageKey = (void*)&kTabBarItemAssociatedStorageKey;
static void * const kTabBarControllerAssociatedStorageKey = (void*)&kTabBarControllerAssociatedStorageKey;

@implementation UIViewController (TYTabBarControllerItem)

- (void)setTyTabBarItem:(TYTabBarItem *)tyTabBarItem {
  objc_setAssociatedObject(self, kTabBarItemAssociatedStorageKey, tyTabBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TYTabBarItem *)tyTabBarItem {
  return objc_getAssociatedObject(self, kTabBarItemAssociatedStorageKey);
}

- (void)setTyTabBarController:(TYTabBarController *)tyTabBarController {
  objc_setAssociatedObject(self, kTabBarControllerAssociatedStorageKey, tyTabBarController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TYTabBarController *)tyTabBarController {
  return objc_getAssociatedObject(self, kTabBarControllerAssociatedStorageKey);
}
@end
