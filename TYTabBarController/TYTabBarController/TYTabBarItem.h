//
//  TYTabBarItem.h
//
//  Created by zou tianyu on 15/1/28.
//  Copyright (c) 2015年 zou tianyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYTabBarItem;

@protocol TYTabBarItemDelagate <NSObject>

@optional
- (void)didSelectedItem:(TYTabBarItem *)item;

@end

@interface TYTabBarItem : UIView

@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *normalTitleColor;
@property (nonatomic, strong) UIColor *selectedTitleColor;

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) id<TYTabBarItemDelagate> delegate;

- (void)refreshFrame:(CGRect)frame;
@end
