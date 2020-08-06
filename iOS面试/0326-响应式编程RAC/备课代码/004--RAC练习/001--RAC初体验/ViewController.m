//
//  ViewController.m
//  001--RAC初体验
//
//  Created by H on 2017/11/10.
//  Copyright © 2017年 H. All rights reserved.
//   RAC : 响应函数式编程!!

#import "ViewController.h"
#import <ReactiveObjC.h>

@interface ViewController ()
@property(assign,nonatomic) int  time;
@property (weak, nonatomic) IBOutlet UIButton *reSendBtn;
@property(nonatomic,strong)RACDisposable * disposable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
- (IBAction)reSendClick:(id)sender {
    //改变按钮状态!!
    self.reSendBtn.enabled = NO;
    
    //设置倒计时
    self.time = 10;
    //每一秒中进来
    _disposable = [[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
        //设置文字
        NSString * btnText = _time > 0 ? [NSString stringWithFormat:@"请等待%d秒",_time] : @"重新发送!!";
        //文字设置!!
        [_reSendBtn setTitle:btnText forState:_time > 0 ? (UIControlStateDisabled):(UIControlStateNormal)];
        //设置按钮
        if (_time > 0) {
            _reSendBtn.enabled = NO;
        }else{
            _reSendBtn.enabled = YES;
            //取消订阅
            [_disposable dispose];
        }
        //时间 --
        _time--;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
