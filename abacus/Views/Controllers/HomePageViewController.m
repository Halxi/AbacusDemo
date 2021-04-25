//
//  HomePageViewController.m
//  abacus
//
//  Created by Zixun Xi on 25/4/21.
//

#import "HomePageViewController.h"
#import "TableOrderViewController.h"
#import "Order.h"
#import "TableCell.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTables];
    
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tables.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell" forIndexPath:indexPath];
    Table *table = self.tables[indexPath.row];
    
    cell.tableNumberLabel.text = [NSString stringWithFormat:@"%@%d", @"Table: ", table.tableNumber];
    cell.tableCountLabel.text = [NSString stringWithFormat:@"%@%d", @"People: ", table.peopleCount];
    
    return cell;
}

- (void) initTables{
    self.tables = [NSMutableArray array];
    [self.tables addObject:[[Table alloc]initWithTableNumber:1 PeopleCount:3 Orders:[Order initOrderForTable1]]];
    [self.tables addObject:[[Table alloc]initWithTableNumber:2 PeopleCount:5 Orders:[Order initOrderForTable2]]];
    [self.tables addObject:[[Table alloc]initWithTableNumber:3 PeopleCount:7 Orders:[Order initOrderForTable3]]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    TableOrderViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"OrderView"];
    viewController.table = self.tables[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}



@end
