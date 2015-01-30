//
//  TYTabBarItem.m
//
//  Created by zou tianyu on 15/1/28.
//  Copyright (c) 2015年 zou tianyu. All rights reserved.
//

#import "TYTabBarItem.h"

@interface TYTabBarItem() {
  UIImageView *_iconImageView;
  UILabel *_titleLabel;
}

@end

@implementation TYTabBarItem

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    _normalTitleColor = [UIColor blackColor];
    _selectedTitleColor = [UIColor blackColor];
    
    [self initView];
  }
  return self;
}

- (id)init {
  self = [super init];
  if (self) {
    _normalTitleColor = [UIColor blackColor];
    _selectedTitleColor = [UIColor blackColor];
    
    [self initView];
  }
  return self;
}

- (void)initView {
  self.backgroundColor = [UIColor clearColor];
  _iconImageView = [[UIImageView alloc] init];
  _iconImageView.userInteractionEnabled = YES;
  _iconImageView.contentMode = UIViewContentModeCenter;
  [self addSubview:_iconImageView];
  
  _titleLabel = [[UILabel alloc] init];
  _titleLabel.textAlignment = NSTextAlignmentCenter;
  _titleLabel.backgroundColor = [UIColor clearColor];
  _titleLabel.textColor = _normalTitleColor;
  _titleLabel.font = [UIFont systemFontOfSize:10.f];
  [self addSubview:_titleLabel];
  
  UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTabBar)];
  [self addGestureRecognizer:tapGesture];
}

- (void)layoutSubviews {
  
}

- (void)refreshFrame:(CGRect)frame {
  _iconImageView.frame = CGRectMake(0, 8, CGRectGetWidth(frame), 23);
  _titleLabel.frame = CGRectMake(0, _iconImageView.frame.origin.y + _iconImageView.frame.size.height + 6, CGRectGetWidth(frame), 10);
}

- (void)setTitle:(NSString *)title {
  _titleLabel.text = title;
  _title = title;
}

- (void)setIsSelected:(BOOL)isSelected {
  if (isSelected) {
    _iconImageView.image = self.selectedImage;
    _titleLabel.textColor = self.selectedTitleColor;
  } else {
    _iconImageView.image = self.normalImage;
    _titleLabel.textColor = self.normalTitleColor;
  }
  _isSelected = isSelected;
}

- (void)pressTabBar {
  if ([_delegate respondsToSelector:@selector(didSelectedItem:)]) {
    [_delegate didSelectedItem:self];
  }
}
@end
