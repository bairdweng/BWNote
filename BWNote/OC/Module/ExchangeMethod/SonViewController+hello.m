//
//  SonViewController+hello.m
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/24.
//  Copyright © 2020 apple. All rights reserved.
//

#import "SonViewController+hello.h"
#import "BWNote-Bridging-Header.h"

@implementation SonViewController (hello)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /// 将hello替换成bb_hello，如果子类未实现，会寻找父类的方法。然后替换，相当于父类调用了bb_hello。
        /// 但bbhello未在父类实现。
        Method originalMethod = class_getInstanceMethod(self , (@selector(hello)));
        Method swizzledMethod = class_getInstanceMethod(self , (@selector(bb_hello)));
        /// 判断本类是否有hello的具体实现
        BOOL didAddMethod = class_addMethod(self, @selector(hello), method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            NSLog(@"成功");
            class_replaceMethod(self, @selector(bb_hello), method_getImplementation(originalMethod), method_getTypeEncoding(swizzledMethod));
        }
        else {
            NSLog(@"失败");
            /// 如果已经存在，交换imp的实现。hello变成bb_hello
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}
- (void)bb_hello {
    // 执行原来的方法
    [self bb_hello];
}
@end
