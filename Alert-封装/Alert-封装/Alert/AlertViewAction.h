//
//  AlertViewAction.h
//  Alert-封装
//
//  Created by yurong on 2017/12/12.
//  Copyright © 2017年 yurong. All rights reserved.
//

#import <UIKit/UIKit.h>

//actionStyle
typedef enum : NSUInteger {
    UIAlertViewActionCancel,
    UIAlertViewActionDefault
} UIAlertViewActionStyle;

@protocol AlertViewActionDelegate <NSObject>
//点击btn回调
-(void)actionSelector;
@end

@interface AlertViewAction : UIButton
/**
 AlertAction

 @param title 按钮名字
 @param style UIAlertViewActionStyle
 @param block selector
 @return self
 */
+(instancetype)alertActionWithTitle:(NSString *)title style:(UIAlertViewActionStyle)style block:(void(^)(AlertViewAction *action))block;


@property(nonatomic,assign)UIAlertViewActionStyle style;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)void (^handle)(AlertViewAction *action);
@property(nonatomic,weak)id<AlertViewActionDelegate> delegate;
@end

