//
//  main.m
//  007--汇编体验
//
//  Created by H on 2017/11/10.
//  Copyright © 2017年 H. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//直接用汇编!!
int sum(int a,int b);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"%d",sum(10, 20));
    }
    return 0;
}
