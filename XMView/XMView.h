//
//  XMView.h
//  XMView
//
//  Created by mifit on 15/12/15.
//  Copyright © 2015年 mifit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(XMView)

- (void)setBoderRadius:(CGFloat)radius;
- (void)setBoderColor:(UIColor *)color;
- (void)setBoderWidth:(CGFloat)width;
- (void)setBoderWidth:(CGFloat)width radius:(CGFloat)radius;
- (void)setBoderWidth:(CGFloat)width radius:(CGFloat)radius color:(UIColor *)color;
- (void)setRoundingCorners:(UIRectCorner)corners radius:(CGFloat)radius;
@end
