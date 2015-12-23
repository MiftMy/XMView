//
//  XMView.m
//  XMView
//
//  Created by mifit on 15/12/15.
//  Copyright © 2015年 mifit. All rights reserved.
//

#import "XMView.h"

@implementation UIView(XMView)
- (void)setBoderRadius:(CGFloat)radius{
    self.layer.cornerRadius = radius;
}

- (void)setBoderWidth:(CGFloat)width{
    self.layer.borderWidth = width;
}

- (void)setBoderColor:(UIColor *)color{
    self.layer.borderColor = color.CGColor;
}

- (void)setBoderWidth:(CGFloat)width radius:(CGFloat)radius{
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = width;
}

- (void)setBoderWidth:(CGFloat)width radius:(CGFloat)radius color:(UIColor *)color{
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}


- (void)setRoundingCorners:(UIRectCorner)corners radius:(CGFloat)radius{
    CGRect r = self.bounds;
    r.origin.x = 0;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;

    self.layer.mask = maskLayer;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
