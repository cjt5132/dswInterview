//
//  HKViewController.m
//  001--RAC初体验
//
//  Created by H on 2017/11/10.
//  Copyright © 2017年 H. All rights reserved.
//

#import "HKViewController.h"
#import <ReactiveObjC.h>

@interface HKViewController ()

@property(nonatomic,strong)RACSignal * signal;

@end

@implementation HKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    
    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        @strongify(self);
        
        NSLog(@"%@",self);
        
        return nil;
    }];
    _signal = signal;
}
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)dealloc
{
    NSLog(@"成功的走了!!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
