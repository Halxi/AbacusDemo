//
//  TableOrderViewController.m
//  abacus
//
//  Created by Zixun Xi on 24/4/21.
//

#import "TableOrderViewController.h"
#import "OrderCell.h"
#import "Order.h"
#import "Bill.h"
#import "PaymentViewController.h"

@interface TableOrderViewController ()

@end

@implementation TableOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableNumber.text = [NSString stringWithFormat:@"%@%d", @"Table: ",self.table.tableNumber];
    self.peopleCount.text = [NSString stringWithFormat:@"%@%d", @"People: ",self.table.peopleCount];
    self.orderTableView.tableFooterView = [UIView new];
    self.payButton.layer.borderWidth = 2;
    self.payButton.layer.cornerRadius = 10;
    self.payButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%@%0.1f",@"Total: ", self.totalPrice];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.table.orders.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderCell" forIndexPath:indexPath];
    Order *order = self.table.orders[indexPath.row];
    cell.itemName.text = order.item.name;
    cell.itemNumber.text = [NSString stringWithFormat:@"%@%d", @"Count: ", order.count];
    if (order.peopleID) {
        cell.comment.text = [NSString stringWithFormat:@"%@%d", @"Comment: #", order.peopleID];
    }
    float price = [self itemPriceCalculationWithPrice:order.item.price Count:order.count];
    self.totalPrice += price;
    cell.totalPrice.text = [NSString stringWithFormat:@"%@%0.1f", @"Price: ", price];
    
    return cell;
}

- (float) itemPriceCalculationWithPrice:(float)price Count:(int)count{
    float sum = price * count;
    return sum;
}

- (IBAction)payButtonTapped:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    Bill *bill = [[Bill alloc]initWithTable:self.table TotalPrice:self.totalPrice];
    
//    NSLog(@"%@%.1f", @"Total Price: ", self.totalPrice);
    PaymentViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"Payment"];
    viewController.bill = bill;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}


@end
