//
//  MasterViewController.m
//  EverDo.v2
//
//  Created by Yana Kultysheva on 2016-07-12.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "Todo.h"
#import "CustomCellTableViewCell.h"
#import "AddNewViewController.h"

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource, AddTodoDelegate, UIGestureRecognizerDelegate>

@property NSMutableArray* todoList;
@property (strong, nonatomic) IBOutlet UITableView *tableWithTodoList;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeGesture;
@property CustomCellTableViewCell *cell;
@property Todo *todo;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    Todo *buyPlums = [[Todo alloc] initWithTitle:@"Buy plums" descriptionTodo:@"1 lb of yellow plums" priorityNumber:1];
    Todo *buyApples = [[Todo alloc] initWithTitle:@"Buy apples" descriptionTodo:@"2 lbs of red apples" priorityNumber:2];
    buyApples.isCompleted = YES;
    Todo *buyPeaches = [[Todo alloc] initWithTitle:@"Buy peaches" descriptionTodo:@"1.5 lbs of Ontarion peaches" priorityNumber:3];
    Todo *buyGrapes = [[Todo alloc] initWithTitle:@"Buy grapes" descriptionTodo:@"0.5 lbs of seedless grapes" priorityNumber:4];
    
    
    self.todoList = [NSMutableArray arrayWithObjects:buyPlums, buyApples, buyPeaches, buyGrapes, nil];
    
    
    
    
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTodo:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveTodo:(Todo *)newTodo
{
    [self.todoList addObject:newTodo];
    
    [self.tableWithTodoList reloadData];
}

- (void)addTodo:(id)sender {
    
    [self performSegueWithIdentifier:@"AddNewSeg" sender:sender];
    
    
//    AddNewViewController *anvc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddNew"];
//    
//    [self.navigationController pushViewController:anvc animated:YES];
    
    

//    Todo *newToDo = [[Todo alloc] initWithTitle:@"New Todo" descriptionTodo:@"Buy something else" priorityNumber:4];
    
//    [self.todoList insertObject:newToDo atIndex:0];
    
//    same as reload
    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
    
        self.todo = self.todoList[selectedPath.row];
        
        DetailViewController *dvc = (DetailViewController *)[segue destinationViewController];
        dvc.todo = self.todo;
    } else if ([segue.identifier isEqualToString:@"AddNewSeg"]) {
        ((AddNewViewController*)segue.destinationViewController).delegate = self;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell switch to TodoViewCell customized
    self.cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    self.cell.userInteractionEnabled = YES;
    
    [self prepareGestureRecognizers];
    
    Todo *todo = self.todoList[indexPath.row];
//    NSDate *object = self.objects[indexPath.row];
    if (todo.isCompleted == YES) {
        
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
//        
//        NSAttributedString* titleString = [[NSAttributedString alloc] initWithString:todo.title attributes:attributes];
        
        self.cell.titleLabel.attributedText = [self  strikeOutString:todo.title];
        self.cell.descriptionLabel.attributedText = [self  strikeOutString:todo.descriptionTodo];
        
        NSString *score = [NSString stringWithFormat:@"%ld", todo.priorityNumber];
        self.cell.scoreLabel.attributedText = [self  strikeOutString:score];



    
//    cell.titleLabel.text = todo.title;
//    cell.descriptionLabel.text = todo.descriptionTodo;
//    
//    NSString *score = [NSString stringWithFormat:@"%ld", todo.priorityNumber];
//    
//        cell.scoreLabel.text = score;
    } else {
    
        self.cell.titleLabel.text = todo.title;
    
        self.cell.descriptionLabel.text = todo.descriptionTodo;
        
        NSString *score = [NSString stringWithFormat:@"%ld", todo.priorityNumber];
        
        self.cell.scoreLabel.text = score;
    }
    

    return self.cell;
    }




- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.todoList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


-(NSAttributedString*)strikeOutString:(NSString*) string {
    
    NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
    NSAttributedString* editedString = [[NSAttributedString alloc] initWithString:string attributes:attributes];
    return editedString;

}

- (void)prepareGestureRecognizers {
    [self prepareSwipeGestureRecognizer];
   
}

- (void)prepareSwipeGestureRecognizer {
    self.swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiped:)];
    [self.cell addGestureRecognizer:self.swipeGesture];
}

- (void)swiped:(UIGestureRecognizer*)recognizer {
    
    CGPoint location = [recognizer locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    self.cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    
    NSLog(@"%@",[self.todoList objectAtIndex:indexPath.row]);
    
    Todo *swipeTodo = [self.todoList objectAtIndex:indexPath.row];
    
//    NSLog(@"%@", swipeTodo.title);
    
//    swipeTodo.title = @"Sell all";
    
    swipeTodo.isCompleted = YES;
    
    [self.tableWithTodoList reloadData];
    
    
}



//
//-(void)showDetails {
//    
//    AddNewViewController *anvc = [[AddNewViewController alloc] init];
//    [self.navigationController pushViewController:anvc animated:YES];
//    
//}

@end
