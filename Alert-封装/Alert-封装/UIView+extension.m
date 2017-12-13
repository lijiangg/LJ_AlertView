//
//  UIView+extension.m
//  Alert-封装
//
//  Created by yurong on 2017/12/12.
//  Copyright © 2017年 yurong. All rights reserved.
//

#import "UIView+extension.h"




@implementation UIView (extension)
@dynamic cornerRadius;
-(void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
}


-(void)addCornerRadiusWithCorner:(UIRectCorner)corner radius:(CGFloat)radius{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    self.layer.mask = layer;
}
@end
