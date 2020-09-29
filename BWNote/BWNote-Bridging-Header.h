//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//
#import "objc/runtime.h"
#import "SonViewController.h"
#import "FatherViewController.h"
#import "WengPerson.h"
#import "ISAPoint.h"
#import "AboutCopy.h"
#import "LoadExample1.h"
#import "ChildrenLoadExample1.h"
#import "GrandSonExample1.h"
#import "MemoryLayout.h"
#import "CircularReference.h"
#define SwizzleMethod(class, originalSelector, swizzledSelector) {              \
    Method originalMethod = class_getInstanceMethod(class, (originalSelector)); \
    Method swizzledMethod = class_getInstanceMethod(class, (swizzledSelector)); \
    if (!class_addMethod((class),                                               \
                         (originalSelector),                                    \
                         method_getImplementation(swizzledMethod),              \
                         method_getTypeEncoding(swizzledMethod))) {             \
        method_exchangeImplementations(originalMethod, swizzledMethod);         \
    } else {                                                                    \
        class_replaceMethod((class),                                            \
                            (swizzledSelector),                                 \
                            method_getImplementation(originalMethod),           \
                            method_getTypeEncoding(originalMethod));            \
    }                                                                           \
} 
