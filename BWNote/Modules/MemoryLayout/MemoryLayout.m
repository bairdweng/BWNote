

//
//  MemoryLayout.m
//  BWNote
//
//  Created by bairdweng on 2020/9/17.
//  Copyright © 2020 apple. All rights reserved.
//

#import "MemoryLayout.h"

@interface MemoryLayout ()

@property(nonatomic, copy) NSString *str;

@end

@implementation MemoryLayout

// initialized global variable
int a = 10;
// uninitiaized global variable
int b = 0;

- (void)hello {
  // initialized static variable
  static int c = 20;
  // uninitialzed static variable
  static int d;
  // initialized local variable
  int e = 30;
  // uninitalzed local variable
  int f;
  // object
  NSObject *obj = [[NSObject alloc] init];
  // string constant
  NSString *str = @"123";
  NSLog(@"a=%p", &a);
  NSLog(@"b=%p", &b);
  NSLog(@"c=%p", &c);
  NSLog(@"d=%p", &d);
  NSLog(@"e=%p", &e);
  NSLog(@"f=%p", &f);
  NSLog(@"obj=%p", &obj);
  NSLog(@"str=%p", &str);
}

/// 这里调用set方法，多线程的情况下，可能会被释放多次
- (void)whyWillCrach {
  NSLog(@"whyWillCrach");
  dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
  for (int i = 0; i < 1000; i++) {
    dispatch_async(queue, ^{
      self.str = [NSString stringWithFormat:@"abcdefghijk"];
    });
  }
}

/// 这个是一个标记指针，无需调用set方法。小数据的存储可以直接存放在指针
- (void)whyNotCrash {
  NSLog(@"whyNotCrash");
  dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
  for (int i = 0; i < 1000; i++) {
    dispatch_async(queue, ^{
      self.str = [NSString stringWithFormat:@"abc"];
    });
  }
}

@end
