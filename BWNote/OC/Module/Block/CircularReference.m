//
//  CircularReference.m
//  BWNote
//
//  Created by bairdweng on 2020/9/18.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

#import "CircularReference.h"

typedef void (^TestBlock)(void);

@interface CircularReference ()

@property(nonatomic, strong) TestBlock testBlock;
@property(nonatomic, copy) NSString *name;
@end

@implementation CircularReference

- (void)willCircularReferenc {

  __weak typeof(self) weakSelf = self;
  self.testBlock = ^{
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
     It can be seen that when the variable is modified inside the block,the address
     has changed.
     
     Think about whether the memory address is transferrred from the stack area to the heap area.
   */
}

- (void)dealloc {
  NSLog(@"CircularReference：When the object is destoreyed, this method will "
        @"be excuted");
}
@end
