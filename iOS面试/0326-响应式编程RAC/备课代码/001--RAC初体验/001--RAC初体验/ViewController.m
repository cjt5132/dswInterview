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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建信号!!
    //创建了一个数组,在信号对象中!!
    RACSubject * subject = [RACSubject subject];
    //2.订阅信号!!
    //创建一个订阅者,将Block保存到订阅者中,将订阅者保存到上面的数组里面!!
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    //3.发送信号!!
    //
    [subject sendNext:@"汉堡包!!"];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
