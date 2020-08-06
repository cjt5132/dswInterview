//
//  ViewController.m
//  001--RAC初体验
//
//  Created by H on 2017/11/10.
//  Copyright © 2017年 H. All rights reserved.
//   RAC : 响应函数式编程!!


/*
 你的strong只是保住了OC对象!!! 线程是CPU调度的!! 你没有办法控制!!
 */
#import "ViewController.h"
#import <ReactiveObjC.h>
#import "HKThread.h"

@interface ViewController ()
//@property(nonatomic,strong)HKThread * thread;
@property(nonatomic,strong)dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[RACSignal interval:1.0 onScheduler:[RACScheduler scheduler]] subscribeNext:^(NSDate * _Nullable x) {
        NSLog(@"%@",[NSThread currentThread]);
    }];
   
}


-(void)GCDTiemr{
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1000000000, 0);
    
    dispatch_source_set_event_handler(self.timer, ^{
        NSLog(@"----%@",[NSThread currentThread]);
    });
    
    
    dispatch_resume(self.timer);

}

-(void)tiemrDemo{
    HKThread * thread = [[HKThread alloc] initWithBlock:^{
        
        NSTimer * timer =   [NSTimer timerWithTimeInterval:1.0 target:self  selector:@selector(timerMethod) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"来了!!");
        
    }];
    
    [thread start];
}

- (void)timerMethod {
    NSLog(@"%@",[NSThread currentThread]);
    
}


@end
