//
//  AlertViewAction.m
//  Alert-封装
//
//  Created by yurong on 2017/12/12.
//  Copyright © 2017年 yurong. All rights reserved.
//

#import "AlertViewAction.h"


@implementation AlertViewAction


//init方法  必须开头init,不然报错
-(instancetype)initWithTitle:(NSString *)title style:(UIAlertViewActionStyle)style block:(void(^_Nullable)(AlertViewAction *action))block{
    
    if (self = [super init]) {
        [self setTitle:title forState:UIControlStateNormal];
        self.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.6];
        _style = style;
        _handle = block;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(actionSelector:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
+(instancetype)alertActionWithTitle:(NSString *)title style:(UIAlertViewActionStyle)style block:(void (^)(AlertViewAction *))block{
    return [[self alloc] initWithTitle:title style:style block:block];
}

-(void)actionSelector:(AlertViewAction *)sender{
    
    if (_style == UIAlertViewActionDefault) {
        if (_handle) {
            _handle(sender);
        }   
    }
    [sender.delegate actionSelector];
    
}
@end
