//
//  LoadExample1.m
//  BWNote
//
//  Created by bairdweng on 2020/9/17.
//  Copyright © 2020 apple. All rights reserved.
//

#import "LoadExample1.h"
#import "ChildrenLoadExample1.h"

@implementation LoadExample1

- (id)init {
  self = [super init];
  if (self) {
    NSLog(@"实力化后会执行这个");
    NSLog(@"someNumber======%d", someNumber);
  }
  return self;
}

+ (void)load {
  NSLog(@"load 方法无需实例化就会执行，通常在main函数之前");
}
/*
  如果类别实现了这个方法，这个方法会被覆盖
 */
+ (void)initialize {
  NSLog(@"如果类别实现了这个方法，这个方法会被覆盖");
  someArray = [[NSMutableArray alloc] init];
}

- (void)hello {
  NSLog(@"My name is LoadExample1, What are you doing?");
  NSLog(@"someArray===========%@", someArray);
}
@end
