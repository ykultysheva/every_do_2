//
//  DetailViewController.m
//  EverDo.v2
//
//  Created by Yana Kultysheva on 2016-07-12.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import "DetailViewController.h"
#import "Todo.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

//- (void)setDetailItem:(id)newDetailItem {
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//            
//        // Update the view.
//        [self configureView];
//    }
//}
//
//- (void)configureView {
//    // Update the user interface for the detail item.
//    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [self.detailItem description];
//    }
//}


//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self configureView];
    
    [self showTodoDescription];
    
    UILabel* todoDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 150,250, 100)];
    todoDescriptionLabel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:todoDescriptionLabel];
    todoDescriptionLabel.text = [NSString stringWithFormat:@"Description: %@", self.todo.descriptionTodo];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)showTodoDescription{
    NSLog (@"Description: %@", self.todo.descriptionTodo);
        
}

@end
