//
//  XMSegDetailView.m
//  XMSegDetailView
//
//  Created by mifit on 15/9/15.
//  Copyright (c) 2015年 mifit. All rights reserved.
//

#import "XMSegDetailView.h"
@interface XMSegDetailView()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,assign) BOOL isInit;
@end

@implementation XMSegDetailView
- (void)layoutSubviews{
    if (!_isInit) {
        [self initView];
    }
}

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)setSelectedIndex:(NSInteger)index{
    self.scrollView.contentOffset = CGPointMake(index * CGRectGetWidth(self.scrollView.frame), 0);
    _selectedIndex = index;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGFloat)width{
    return self.frame.size.width;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)initView{
    _isInit = YES;
    CGRect rect = self.frame;
    rect.origin.y = 0;
    _scrollView = [[UIScrollView alloc]initWithFrame:rect];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    
    [self addSubview:_scrollView];
}

- (void)scrollViewRemoveAllSubview{
    for (UIView *temView in _scrollView.subviews) {
        [temView removeFromSuperview];
    }
    _arrViews = nil;
}
/// 667  603
- (void)setArrViews:(NSArray *)arrViews{
    [self scrollViewRemoveAllSubview];
    NSInteger index = 0;
    CGFloat width = [self width];
    CGFloat heigth = [self height];
    for (UIView *tView in arrViews) {
        CGRect f = CGRectMake(index * width, 0, width, heigth);
        tView.frame = f;
        [_scrollView addSubview:tView];
        index++;
    }
    _scrollView.contentSize = CGSizeMake(index * width, 0);
    _arrViews = arrViews;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat f = scrollView.contentOffset.x;
    NSInteger t = f / [self width];
    NSLog(@"%ld",(long)t);
    if (self.segment) {
        [self.segment setSelectedSegmentIndex:t];
    }
}
@end
