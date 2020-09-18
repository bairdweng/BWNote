//
//  ChildrenLoadExample1.m
//  BWNote
//
//  Created by bairdweng on 2020/9/17.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ChildrenLoadExample1.h"

@implementation ChildrenLoadExample1 : LoadExample1

+ (void)load {
  NSLog(@"Hello,my father is LoadExample1, my method name is 'load'");
}

// If there is no implemention, the parent class will replace the implemention.
+ (void)initialize {
  NSLog(@"ChildrenLoadExample1：This method is initialize,i will overwite my "
        @"father");
}
- (void)hello {
  NSLog(@"Hello, my name is ChildrenLoadExample1 ");
  // Why this value is empty?
  NSLog(@"someArray===========%@", someArray);
}
@end
