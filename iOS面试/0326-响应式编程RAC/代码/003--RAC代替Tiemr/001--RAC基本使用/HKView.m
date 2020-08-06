//
//  HKView.m
//  001--RAC基本使用
//
//  Created by H on 2019/3/26.
//  Copyright © 2019 LogicEDU. All rights reserved.
//

#import "HKView.h"

@implementation HKView

//-(RACSubject *)btnClickSingnal{
//    if (!_btnClickSingnal) {
//        _btnClickSingnal = [RACSubject subject];
//    }
//    return _btnClickSingnal;
//}


-(IBAction)btnClick:(id)sender{
//    [self.btnClickSingnal sendNext:@"按钮点击咯!!"];
    [self send:@"hank"];
}

-(void)send:(id)objc{
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
