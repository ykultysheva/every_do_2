//
//  AddNewViewController.h
//  EverDo.v2
//
//  Created by Yana Kultysheva on 2016-07-13.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Todo;

@protocol AddTodoDelegate <NSObject>

- (void)saveTodo:(Todo*)newTodo;

@end

@interface AddNewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UITextField *addTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *addDescriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *addPriorityNumberTextField;
@property (weak, nonatomic) IBOutlet UIButton *addNewButton;
@property (weak, nonatomic) IBOutlet UILabel *outPutLabel;

@property (weak, nonatomic) id delegate;

@end
