//
//  Stack.m
//  data-structures
//
//  Created by Steve on 2020/6/17.
//  Copyright © 2020 Steve. All rights reserved.
//

#import "Stack.h"
#include <pthread.h>

@interface Stack()

@property (nonatomic, strong) NSMutableArray<id> *array;

@end

@implementation Stack {
    __block pthread_mutex_t mutex;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _array = [NSMutableArray array];
        pthread_mutex_init(&mutex, NULL);
    }
    return self;
}

- (void)push:(id)value {
    pthread_mutex_lock(&mutex);
    [self.array addObject:value];
    pthread_mutex_unlock(&mutex);
}

- (id)top {
    return self.array.lastObject;
}

- (id)pop {
    pthread_mutex_lock(&mutex);
    id top = self.top;
    if (!top) {
        return top;
    }
    [self.array removeObject:top];
    pthread_mutex_unlock(&mutex);
    return top;
}

@end
