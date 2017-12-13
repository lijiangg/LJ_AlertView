//
//  AlertView.h
//  Alert-封装
//
//  Created by yurong on 2017/12/12.
//  Copyright © 2017年 yurong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+extension.h"
#import "AlertViewAction.h"
@interface AlertView : UIView
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *message;

/**
 AlertView

 @param message 内容
 @param title 标题
 @return self
 */
+(instancetype)AlertWithMessage:(NSString *)message title:(NSString *)title;

/**
 添加action

 @param action AlertViewAction
 */
-(void)addActionWithAction:(AlertViewAction *)action;
//显示
-(void)show;
//隐藏
-(void)hide;

@end



