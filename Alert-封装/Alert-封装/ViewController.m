//
//  ViewController.m
//  Alert-封装
//
//  Created by yurong on 2017/12/12.
//  Copyright © 2017年 yurong. All rights reserved.
//

#import "ViewController.h"
#import "AlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (IBAction)buttonSelector:(UIButton *)sender {
    AlertView *view = [AlertView AlertWithMessage:@"dshajhdkajshdksahj大使馆和滚滚滚打算结婚睡个好觉回家的时候会计电算化k" title:@"哈哈"];
    [view addActionWithAction:[AlertViewAction alertActionWithTitle:@"dsds" style:UIAlertViewActionDefault block:^(AlertViewAction *action) {
        NSLog(@",sdghsghdjshd");
    }]];
    [view addActionWithAction:[AlertViewAction alertActionWithTitle:@"交互" style:UIAlertViewActionDefault block:^(AlertViewAction *action) {
        
    }]];
    [view addActionWithAction:[AlertViewAction alertActionWithTitle:@"交互" style:UIAlertViewActionDefault block:^(AlertViewAction *action) {
        
    }]];
    [view show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
