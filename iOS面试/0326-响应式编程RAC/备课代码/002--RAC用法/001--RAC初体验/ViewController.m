//
//  ViewController.m
//  001--RAC初体验
//
//  Created by H on 2017/11/10.
//  Copyright © 2017年 H. All rights reserved.
//   RAC : 响应函数式编程!!

#import "ViewController.h"
#import <ReactiveObjC.h>
#import <NSObject+RACKVOWrapper.h>
#import "HKView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet HKView *hkView;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UITextField *textFiled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [_textFiled.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
    }];
}

-(void)demo3{
    
    //通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"%@",x);
    }];
}

-(void)demo2{
    //监听事件
    [[self.btn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"%@",x);
    }];
    
}

-(void)demo1{
    //KVO
    //    [self.hkView rac_observeKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
    //
    //    }];
    
    [[self.hkView rac_valuesForKeyPath:@"frame" observer:nil] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
}


-(void)demo{
    [[self.hkView rac_signalForSelector:@selector(send:)] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"哥么监听到了!!%@",x);
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.hkView.frame = CGRectMake(50, 50, 200, 20);
}


@end
