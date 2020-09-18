//
//  LoadExample1+catgory1.m
//  BWNote
//
//  Created by bairdweng on 2020/9/17.
//  Copyright © 2020 apple. All rights reserved.
//

#import "LoadExample1+catgory1.h"

@implementation LoadExample1 (catgory1)
+ (void)load {

  NSLog(@"This method is load, my class name is catgory1");
}
// Will overwrite the current class
//+(void)initialize {
//    NSLog(@"This method is initialize,my class name is catgory1");
//}
@end
