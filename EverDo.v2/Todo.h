//
//  Todo.h
//  EverDo.v2
//
//  Created by Yana Kultysheva on 2016-07-12.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property NSString *title;
@property NSString *descriptionTodo;
@property NSInteger priorityNumber;
@property Boolean isCompleted;

-(instancetype)initWithTitle:(NSString*)title descriptionTodo:(NSString*)descriptionTodo priorityNumber:(NSInteger)priorityNumber;


@end
