//
//  CircularReference.h
//  BWNote
//
//  Created by bairdweng on 2020/9/18.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircularReference : NSObject
- (void)willCircularReferenc;
- (void)modifyValueTheBlockInside;
@end

NS_ASSUME_NONNULL_END
