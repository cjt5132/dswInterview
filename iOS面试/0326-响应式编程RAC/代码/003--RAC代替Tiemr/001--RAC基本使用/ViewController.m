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
#import "HKThread.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet HKView *hkview;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UITextField *textField;

/**  */
//@property (nonatomic, strong) HKThread * thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //看有没有事情
    
//  HKThread * thread = [[HKThread alloc] initWithBlock:^{
//        NSTimer * timer  = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
//
//        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//
//      //while(条件){0.001}
//
//
//      //让线程不死,有执行不玩的任务!!
//      [[NSRunLoop currentRunLoop] run];//死循环!!
//
//       NSLog(@"来了!!");
//    }];
//
//    [thread start];
    

    
    [[RACSignal interval:1.0 onScheduler:[RACScheduler scheduler]] subscribeNext:^(NSDate * _Nullable x) {
        NSLog(@"%@ --- %@",x,[NSThread currentThread]);
    }];
    
    
    
}


-(void)timerMethod{
    NSLog(@"timer来了!");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.hkview.frame = CGRectMake(50, 50, 200, 200);
}



@end
