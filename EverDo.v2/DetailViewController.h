//
//  DetailViewController.h
//  EverDo.v2
//
//  Created by Yana Kultysheva on 2016-07-12.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;


@property (strong, nonatomic) Todo *todo;


//@property NSString *title;
//@property NSString *descriptionTodo;
//@property NSInteger priorityNumber;
//@property Boolean isCompleted;

@end

