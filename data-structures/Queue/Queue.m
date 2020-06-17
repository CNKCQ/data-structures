//
//  Queue.m
//  data-structures
//
//  Created by Steve on 2020/6/17.
//  Copyright © 2020 Steve. All rights reserved.
//

#import "Queue.h"
#include <pthread.h>

@interface Queue()

@property (nonatomic, strong) NSMutableArray<id> *array;

@end

@implementation Queue {
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

- (id)front {
    if (self.array.count < 1) {
        return nil;
    }
    pthread_mutex_lock(&mutex);
    id front = self.array[0];
    pthread_mutex_unlock(&mutex);
    return front;
}

- (void)enqueue:(id)value {
    pthread_mutex_lock(&mutex);
    [self.array addObject:value];
    pthread_mutex_unlock(&mutex);
}

- (id)dequeue {
    pthread_mutex_lock(&mutex);
    id front = self.front;
    if (front) {
        [self.array removeObject:front];
    }
    pthread_mutex_unlock(&mutex);
    return front;
}

@end
