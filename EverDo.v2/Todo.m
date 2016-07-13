//
//  Todo.m
//  EverDo.v2
//
//  Created by Yana Kultysheva on 2016-07-12.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import "Todo.h"

@implementation Todo
-(instancetype)initWithTitle:(NSString*)title descriptionTodo:(NSString*)descriptionTodo priorityNumber:(NSInteger)priorityNumber {
    if (self = [super init]) {
        _title = title;
        _descriptionTodo = descriptionTodo;
        _priorityNumber = priorityNumber;
        _isCompleted = NO;
        
    }
    return self;
}


@end
