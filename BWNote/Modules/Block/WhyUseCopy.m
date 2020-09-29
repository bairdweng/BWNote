//
//  WhyUseCopy.m
//  BWNote
//
//  Created by bairdweng on 2020/9/21.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

#import "WhyUseCopy.h"

@implementation WhyUseCopy

- (void)fire {
  if (self.strongBlock) {
    //    dispatch_after(
    //        dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)),
    //        dispatch_get_main_queue(), ^{
    //          self.strongBlock();
    //        });
    for (int i = 0; i < 10; i++) {
      dispatch_after(
          dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)),
          dispatch_get_main_queue(), ^{
            self.strongBlock();
          });
    }
  }
  if (self.copyBlock) {

    for (int i = 0; i < 10; i++) {
      dispatch_after(
          dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)),
          dispatch_get_main_queue(), ^{
            self.copyBlock();
          });
    }
  }
}

- (void)dealloc {
  NSLog(@"Excuted dealloc");
}

@end
