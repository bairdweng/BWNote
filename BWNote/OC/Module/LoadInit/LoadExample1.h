//
//  LoadExample1.h
//  BWNote
//
//  Created by bairdweng on 2020/9/17.
//  Copyright © 2020 apple. All rights reserved.
//
//

/*
 summary: What is the diffrentce between load and initialize?

 load:
 1. When both the parant class and subclass implement the load funtion,the
 parent class has a higher priority
 than the child class.
 2. When a class does not implemention the load method,the parent class load
 method will not be called.
 3. The class has a higher priority the the catgory.
 4. When multiple Categories have implemented the load method,the order is
 consistent with the order in which the
 categories appear in Compile Sources
 5. It is thread-safe, before the main funtion

 initialize:
 1. Same as load,When both the pareant class and subclass implement the
 initialize, the parant class has a higher
 priority the the child class.
 2. When the subclass not implement, the parent class will be implement again.
 3. If there are multiple category implementations, the last one will cover all
 previous implementions，the order is
 consistent with the order in which the categories appear in Complie Sources.
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 The int type can be assigned at compile time

 So the initialize method is mainly used for the assignment of static variables
*/
static int someNumber = 2;

static NSMutableArray *_Nullable someArray;

@interface LoadExample1 : NSObject

- (void)hello;
@end

NS_ASSUME_NONNULL_END
