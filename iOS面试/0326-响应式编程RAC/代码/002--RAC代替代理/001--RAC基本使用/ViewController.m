//
//  ViewController.m
//  001--RAC基本使用
//
//  Created by H on 2019/3/26.
//  Copyright © 2019 LogicEDU. All rights reserved.
//  响应式  Timer
/**
 KVO 三个步骤
 1\ addObserver 注册观察者!!
 2\ obser 实现回调方法
 */

#import "ViewController.h"
#import <ReactiveObjC.h>
#import "HKView.h"
#import <NSObject+RACKVOWrapper.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet HKView *hkview;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    [[_btn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    
//    [self.hkview.btnClickSingnal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
    
//    [[self.hkview rac_signalForSelector:@selector(send:)] subscribeNext:^(RACTuple * _Nullable x) {
//        NSLog(@"收到信号了!!%@",x);
//    }];

    //KVO
//    [self.hkview rac_observeKeyPath:@"frame" options:(NSKeyValueObservingOptionNew) observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
//        NSLog(@"变化了!!");
//    }];
    
    [[self.hkview rac_valuesForKeyPath:@"frame" observer:nil] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    
    
    //tongzhi
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    
    //textField
    [_textField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
    }];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.hkview.frame = CGRectMake(50, 50, 200, 200);
}



@end
