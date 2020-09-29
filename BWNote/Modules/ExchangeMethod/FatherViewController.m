//
//  CustomViewController.m
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/24.
//  Copyright © 2020 apple. All rights reserved.
//

#import "FatherViewController.h"
#import "BWNote-Bridging-Header.h"

@interface FatherViewController ()

@end

@implementation FatherViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor yellowColor];
  // Do any additional setup after loading the view.
}
- (void)hello {
  //    NSLog(@"")
  NSLog(@"FatherViewController：say hello");
}
- (void)hello2 {
  NSLog(@"FatherViewController：say hello2");
}
+ (void)load {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{

    Method originalMethod = class_getInstanceMethod(self, (@selector(hello2)));
    Method swizzledMethod =
        class_getInstanceMethod(self, (@selector(bb_hello2)));

    /// 本类未实现
    if (!originalMethod) {
      class_addMethod(self, @selector(hello2),
                      method_getImplementation(swizzledMethod),
                      method_getTypeEncoding(swizzledMethod));
      method_setImplementation(
          swizzledMethod, imp_implementationWithBlock(^(id self, SEL _cmd) {
            NSLog(@"方法未实现");
          }));
      return;
    }

    BOOL didAddMethod = class_addMethod(
        self, @selector(hello2), method_getImplementation(swizzledMethod),
        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
      NSLog(@"成功");
      class_replaceMethod(self, @selector(bb_hello2),
                          method_getImplementation(originalMethod),
                          method_getTypeEncoding(swizzledMethod));
    } else {
      NSLog(@"失败");
      /// 如果已经存在，交换imp的实现。hello变成bb_hello
      method_exchangeImplementations(originalMethod, swizzledMethod);
    }
  });
}
- (void)bb_hello2 {
  NSLog(@"FatherViewController：say bb_hello2");
  [self bb_hello2];
}
- (void)printSelf {
  NSLog(@"self_class======%@\nsuper_class=========%@", [self class],
        [super class]);
}
- (void)aboutSuper {
    NSLog(@"父类about_super");
}
@end
