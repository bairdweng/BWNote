//
//  LoadExample1+catgory2.m
//  BWNote
//
//  Created by bairdweng on 2020/9/17.
//  Copyright © 2020 apple. All rights reserved.
//

#import "LoadExample1+catgory2.h"

@implementation LoadExample1 (catgory2)

+ (void)load {
  NSLog(@"This method is load, my class name is catgory2");
}
// Will overwrite the current class The order of coverage depends on compile
// Sources
//+(void)initialize {
//    NSLog(@"This method is initialize,my class name is catgory2，Because I am
//    at the end of the compilation source,so only i excute");
//}
@end
