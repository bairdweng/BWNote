

//
//  CircularReference.m
//  BWNote
//
//  Created by bairdweng on 2020/9/18.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

#import "CircularReference.h"

#import "WhyUseCopy.h"
typedef void (^TestBlock)(void);

@interface CircularReference ()
// Why use copy for this attribute?
@property(nonatomic, copy) TestBlock testBlock;
@property(nonatomic, copy) NSString *name;
@end

@implementation CircularReference

- (void)willCircularReferenc {

  __weak typeof(self) weakSelf = self;
  self.testBlock = ^{
   // In multithreading,you need to use strong to declare.
//    __strong typeof(weakSelf) strongSelf = weakSelf;
    weakSelf.name = @"My name is CircularReference";
    NSLog(@"weakSelf:%p", weakSelf);
  };

  self.testBlock();

  // This will retain cycle, if you the follwing code, dealloc will not be
  // excuted.
  /*
   self.testBlock = ^{
   self.name = @"My name is CircularReference";
   };
   */
}

/// This is a global block, which will be destoryed after the program is
/// destoryed
- (void)theGlobalBlock {
  //  NSString *name = @"my name is test";
  void (^testOnBlock)(void) = ^() {
    // If an external variable is accessed,the block will be moved to the heap
    // area.
    //    NSLog(@"I am a global block, and I can read name? %@",name);
  };
  testOnBlock();
  NSLog(@"theGlobalBlock %@", testOnBlock);
}

- (void)modifyValueTheBlockInside {

  __block int a = 0;
  NSLog(@"A memory address is %p", &a);
  int b = 0;
  NSLog(@"B memory address is %p", &b);
  void (^foo)(void) = ^{
    a = 1;
  };
  //    a = 1;

  foo();
  b = 1;
  NSLog(@"a:%p", &a);
  NSLog(@"b:%p", &b);

  /*
   It can be seen that when the variable is modified inside the block,the
   address
   has changed.

   Think about whether the memory address is transferrred from the stack area to
   the heap area.
   */
}

/// Here us why the block should be modified with copy?
- (void)blockUseCopy {
  WhyUseCopy *hello = [WhyUseCopy new];

  //  __weak typeof(hello) weakHello = hello;
  hello.strongBlock = ^{
    //        NSLog(@"I am a strongBlock====%@",weakHello.strongBlock);
    NSLog(@"strongBlock");
  };

  hello.copyBlock = ^{
    //        NSLog(@"I am a copyBlock====%@",weakHello.copyBlock);
    NSLog(@"copyBlock");

  };
  NSLog(@"external strong block====%@", hello.strongBlock);
  NSLog(@"external copy block====%@", hello.copyBlock);

  // Wait for two seconds...
  [hello fire];
}
- (void)dealloc {
  NSLog(@"CircularReference：When the object is destoreyed, this method will "
        @"be excuted");
}
@end
