//
//  WengPerson.m
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/24.
//  Copyright © 2020 apple. All rights reserved.
//

#import "WengPerson.h"

@implementation WengPerson

@synthesize lastName = _lastName;

- (instancetype)init {
  self = [super init];
  if (self) {
  }
  return self;
}

- (void)setLastName:(NSString *)lastName {
  _lastName = @"翁";
}
@end
