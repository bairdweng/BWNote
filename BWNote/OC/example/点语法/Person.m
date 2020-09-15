//
//  Person.m
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/24.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id)init {
    self = [super init];
    if (self) {
//        self.lastName = @"";
//        _lastName = @"";
//        self.lastName = @"";
        _lastName = @"";
    }
    return self;
}
-(void)setLastName:(NSString *)lastName {
    NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, @"根本不会调用这个方法");
    _lastName = lastName;
    
}
@end
