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
    NSLog(@"LoadExample1: hello my funtion name is 'init',can i help you?");
    NSLog(@"someNumber======%d", someNumber);
  }
  return self;
}

+ (void)load {
  NSLog(@"LoadExample1: This 'load' method is exexuted without instantiation");
}
/*
 If there is a category implementation,this method will be overwritten。
 If the subclass is not implementation,why is it exexuted twice.
 */
+ (void)initialize {
  NSLog(@"Being exexuted initialize");
  someArray = [[NSMutableArray alloc] init];
}

- (void)hello {
  NSLog(@"My name is LoadExample1, What are you doing?");
  NSLog(@"someArray===========%@", someArray);
}
@end
