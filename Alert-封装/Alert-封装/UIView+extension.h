//
//  UIView+extension.h
//  Alert-封装
//
//  Created by yurong on 2017/12/12.
//  Copyright © 2017年 yurong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (extension)
//设置IB圆角
@property(nonatomic,assign)IBInspectable CGFloat cornerRadius;
/**
 设置圆角
 
 @param corner 选择哪个圆角   UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight
 @param radius 圆角大小
 */
-(void)addCornerRadiusWithCorner:(UIRectCorner)corner radius:(CGFloat)radius;
@end
