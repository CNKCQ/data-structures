//
//  Queue.h
//  data-structures
//
//  Created by Steve on 2020/6/17.
//  Copyright © 2020 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Queue<__covariant ObjectType> : NSObject

- (ObjectType)front;
- (void)enqueue:(ObjectType)value;
- (ObjectType)dequeue;

@end

NS_ASSUME_NONNULL_END
