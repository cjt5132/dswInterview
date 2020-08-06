//
//  File.s
//  007--汇编体验
//
//  Created by H on 2017/11/10.
//  Copyright © 2017年 H. All rights reserved.
//  cpu的数据吞吐量!!  一次放电 CPU能够接受多少个二进制!!

//  64CPU   64根数据总线!!!  高低电频!! 0  和  1
//

.text
.global _sum

_sum:
    movq %rdi,%rax
    addq %rsi,%rax
    retq
