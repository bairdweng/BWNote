//
//  AboutCopy.m
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/24.
//  Copyright © 2020 apple. All rights reserved.
//

#import "AboutCopy.h"

@implementation AboutCopy
-(void)hello {
    
    NSString *hello = @"hello";
    NSLog(@"hello======%p",hello);
    NSLog(@"hello_copy======%p",[hello copy]);
    NSLog(@"hello_mutableCopy======%p",[hello mutableCopy]);
    NSMutableString *m_hello = [[NSMutableString alloc]initWithString:@"m_hello"];
    NSLog(@"m_hello======%p",m_hello);
    NSLog(@"m_hello_copy======%p",[m_hello copy]);
    NSLog(@"m_hello_copy_mutableCopy======%p",[m_hello mutableCopy]);
    NSArray *att = @[@"hello1",@"hello2"];
    
    NSMutableArray *m_att = [[NSMutableArray alloc]initWithArray:@[@"hello1",@"hello2"]];
    // 这时候应该是NSArray
    NSMutableArray *att2 = [m_att copy];
    // 闪退
//    [att2 removeLastObject];
    self.att = [att2 mutableCopy];
    NSMutableString *testStr = [NSMutableString stringWithFormat:@"aaa"];
    self.test = testStr;
    self.test2 = testStr;
    [testStr appendString:@"bbb"];

    
    
    
//    NSLog(@"hello_ary_copy======%p",[hello_ary copy]);
//    NSLog(@"hello_ary_mutableCopy======%p",[hello_ary mutableCopy]);
//    hello_ary = @[@""];
//    NSLog(@"hello_ary======%p",hello_ary);

    

}
@end
