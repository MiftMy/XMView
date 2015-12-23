//
//  XMSegDetailView.h
//  XMSegDetailView
//
//  Created by mifit on 15/9/15.
//  Copyright (c) 2015年 mifit. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol XMViewDelegate<NSObject>
@required
/// 设置选中哪个，跟系统的segmentControl的同名
- (void)setSelectedSegmentIndex:(NSInteger)index;
@end

@interface XMSegDetailView : UIView
/// 关联的view
@property (nonatomic,weak) UIView<XMViewDelegate> *segment;

/// 个数要和关联的segment一样，frame自动设置为xmview大小
@property (nonatomic,strong) NSArray *arrViews;

/// 选中的那个
@property (nonatomic,assign) NSInteger selectedIndex;
@end
