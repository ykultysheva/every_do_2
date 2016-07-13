//
//  AddNewViewController.m
//  EverDo.v2
//
//  Created by Yana Kultysheva on 2016-07-13.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import "AddNewViewController.h"
#import "MasterViewController.h"
#import "Todo.h"

@interface AddNewViewController () <UITextFieldDelegate>

//@property (weak, nonatomic) IBOutlet UILabel *testLabel;
//@property (weak, nonatomic) IBOutlet UITextField *addTitleTextField;
//@property (weak, nonatomic) IBOutlet UITextField *addDescriptionTextField;
//@property (weak, nonatomic) IBOutlet UITextField *addPriorityNumberTextField;
//@property (weak, nonatomic) IBOutlet UIButton *addNewButton;
//@property (weak, nonatomic) IBOutlet UILabel *outPutLabel;


@end

@implementation AddNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextField];
//    [self addKeyboardObserver];
    // Do any additional setup after loading the view.
}

- (void)setupTextField {
    self.addTitleTextField.delegate = self;
    self.addDescriptionTextField.delegate = self;
    self.addPriorityNumberTextField.delegate = self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.addTitleTextField isFirstResponder]) {
        [self.addTitleTextField resignFirstResponder];
    } else if ([self.addDescriptionTextField isFirstResponder]) {
        [self.addDescriptionTextField resignFirstResponder];
    } else if ([self.addPriorityNumberTextField isFirstResponder]) {
        [self.addPriorityNumberTextField resignFirstResponder];
    }
}

// This is a delegate method that fires when the keyboard's return key is tapped
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    
////    NSString *titleString = [self.addTitleTextField.text stringByReplacingCharactersInRange:range withString:string];
////    NSString *descriptionString = [self.addDescriptionTextField.text stringByReplacingCharactersInRange:range withString:string];
//////    NSString *priorityNumberString = [self.addPriorityNumberTextField.text stringByReplacingCharactersInRange:range withString:string];
//
////    NSLog(@"range: %@", NSStringFromRange(range));
////    NSLog(@"%@", str);
////    self.outPutLabel.text = descriptionString;
//    return YES;
//}


- (IBAction)AddNewButton:(id)sender {
    
    Todo *newToDo = [[Todo alloc] initWithTitle:self.addTitleTextField.text descriptionTodo:self.addDescriptionTextField.text priorityNumber:[self.addPriorityNumberTextField.text integerValue]];
    
    [self.delegate saveTodo:newToDo];

    [self.navigationController popViewControllerAnimated:YES];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
