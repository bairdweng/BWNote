

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

/// Here will call the set method of name, there are multiple threads releasing at the same time.
- (void)whyWillCrach {
  NSLog(@"whyWillCrach");
  dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
  for (int i = 0; i < 1000; i++) {
    dispatch_async(queue, ^{
      self.str = [NSString stringWithFormat:@"abcdefghijk"];
    });
  }
}

/// This is a Tagged Pointer, No need to call set method, So it won't crash
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
