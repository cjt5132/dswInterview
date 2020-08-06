//
//  HKView.h
//  001--RAC初体验
//
//  Created by H on 2017/11/10.
//  Copyright © 2017年 H. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC.h>

@interface HKView : UIView
@property(nonatomic,strong)RACSubject * btnClickSingnal;

@end
