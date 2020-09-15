//
//  AboutCopy.h
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/24.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AboutCopy : NSObject
-(void)hello;
@property(nonnull,strong)NSArray *att;

@property(nonatomic,strong)NSString *test;
@property(nonatomic,  copy)NSString *test2;

@end

NS_ASSUME_NONNULL_END
