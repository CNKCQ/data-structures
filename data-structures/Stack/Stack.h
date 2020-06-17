//
//  Stack.h
//  data-structures
//
//  Created by Steve on 2020/6/17.
//  Copyright © 2020 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stack<__covariant ObjectType> : NSObject

- (void)push:(ObjectType)value;

- (ObjectType)top;

- (ObjectType)pop;

@end

NS_ASSUME_NONNULL_END
