//
//  AlertView.m
//  Alert-封装
//
//  Created by yurong on 2017/12/12.
//  Copyright © 2017年 yurong. All rights reserved.
//

#import "AlertView.h"

#define AlertView_cornerRadius 8
#define messageHeightMax 125
@interface AlertView()<AlertViewActionDelegate>



//IBOutlet
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIView *buttontContainsView;



@property(strong,nonatomic)UIControl *bgView;

@property(copy,nonatomic)NSMutableArray *buttonsArray;

@end
@implementation AlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


#pragma mark -init


+(instancetype)AlertWithMessage:(NSString *)message title:(NSString *)title{
    AlertView *view = [[UINib nibWithNibName:@"AlertView" bundle:nil] instantiateWithOwner:self options:nil].firstObject;
    view.center = [UIApplication sharedApplication].keyWindow.center;
    view.layer.cornerRadius = AlertView_cornerRadius;
    view.message = message;
    view.title = title;
    return view;
}
#pragma mark -show
-(void)show{
    if (self.superview) {
        [self.bgView removeFromSuperview];
        [self removeFromSuperview];
    }
    [[UIApplication sharedApplication].keyWindow addSubview:self.bgView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.alpha = 0;
    self.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformIdentity;
    }];

}
#pragma mark - hide
-(void)hide{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformMakeScale(0.1, 0.1);
    }completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

#pragma mark -setter
-(void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}
-(void)setMessage:(NSString *)message{
    _messageLabel.text = message;
    //计算messageSize
    CGSize messageSize = [message boundingRectWithSize:CGSizeMake(_messageLabel.frame.size.width, messageHeightMax) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:_messageLabel.font} context:nil].size;
    //改变messageLabel高度
    CGRect messageFrame = _messageLabel.frame;
    messageFrame.size = messageSize;
    _messageLabel.frame = messageFrame;
    //改变self高度
    CGRect alertFrame = self.frame;
    alertFrame.size.height = 110 + messageSize.height;
    self.frame = alertFrame;

}

#pragma mark -addAction
-(void)addActionWithAction:(AlertViewAction *)action {
    action.delegate = self;
    [_buttontContainsView addSubview:action];
    [self.buttonsArray addObject:action];
    [self layoutButtons];
}

-(void)layoutButtons{
    for (int index = 0; index < self.buttonsArray.count; index++) {
        CGFloat width = _buttontContainsView.frame.size.width-(self.buttonsArray.count-1)/self.buttonsArray.count;
        CGFloat x = index * width;
        CGFloat height = _buttontContainsView.frame.size.height;
        CGFloat y = 0;
        UIButton *btn = self.buttonsArray[index];
        btn.frame = CGRectMake(x, y, width, height);
        //设置圆角
        if (self.buttonsArray.count>1) {
            if (index == 0) {
                [btn addCornerRadiusWithCorner:UIRectCornerTopLeft|UIRectCornerBottomLeft radius:5];
            }else if(index == self.buttonsArray.count-1){
                [btn addCornerRadiusWithCorner:UIRectCornerTopRight|UIRectCornerBottomRight radius:5];
            }
        }else{
            [btn addCornerRadiusWithCorner:UIRectCornerAllCorners radius:5];
        }
    }
}
#pragma mark -selector
-(void)controlSelector:(UIControl *)sender{
    [self hide];
}
#pragma mark -lazy
-(NSMutableArray *)buttonsArray{
    if (!_buttonsArray) {
        _buttonsArray = [NSMutableArray array];
    }
    return _buttonsArray;
}
-(UIControl *)bgView{
    if (!_bgView) {
        _bgView = [[UIControl alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _bgView.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.5];
        [_bgView addTarget:self action:@selector(controlSelector:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bgView;
}

#pragma mark -AlertViewActionDelegate

-(void)actionSelector{
    [self hide];
}


@end





