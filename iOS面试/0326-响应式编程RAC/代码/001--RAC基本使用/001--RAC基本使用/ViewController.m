//
//  ViewController.m
//  001--RAC基本使用
//
//  Created by H on 2019/3/26.
//  Copyright © 2019 LogicEDU. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //1.创建信号 创建信号对象 然后创建一个可变数组!
    RACSubject * subject = [RACSubject subject];
    //2.订阅信号 创建一个订阅者 将Block保存到订阅者中 , 将订阅者保存到上面的数组中
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    //3.发送信号 遍历信号对象中的数组,取出订阅对象! 调用订阅对象中的Block 执行!!
    [subject sendNext:@"hank"];
    
}



@end
