//
//  ISAPoint.m
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/24.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ISAPoint.h"
#import "Person.h"
#import "WengPerson.h"
#import "objc/runtime.h"
@implementation ISAPoint
+(void)hello {
    Person *p = [[Person alloc] init];
    Class c1 = [p class];
    Class c2 = [Person class];
    //输出 1
    NSLog(@"c1--%@", NSStringFromClass(c1));
    NSLog(@"c2--%@", NSStringFromClass(c2));
    
    
//    //输出1
//    NSLog(@"%d", [p class] == object_getClass(p));
//    //输出0
//    NSLog(@"%d", class_isMetaClass(object_getClass(p)));
//    //输出1
//    NSLog(@"%d", class_isMetaClass(object_getClass([Person class])));
//    //输出0
//    NSLog(@"%d", object_getClass(p) == object_getClass([Person class]));
//
    
//    [self isMemberOfClass:[Person class]];
}
@end
