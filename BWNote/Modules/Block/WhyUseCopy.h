//
//  WhyUseCopy.h
//  BWNote
//
//  Created by bairdweng on 2020/9/21.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^CopyBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface WhyUseCopy : NSObject


/// In arc,the compiler will automatically copy the block,so there is no difference between using copy and strong.
@property(nonatomic, strong) CopyBlock strongBlock;
@property(nonatomic, copy) CopyBlock copyBlock;

- (void)fire;
@end

NS_ASSUME_NONNULL_END

