//
//  InvoiceViewController.m
//  abacus
//
//  Created by Zixun Xi on 25/4/21.
//

#import "InvoiceViewController.h"
#import "BillCell.h"
#import "Order.h"
#import "SplitBillCell.h"
#import "Person.h"
#import "HomePageViewController.h"

@interface InvoiceViewController ()

@end

@implementation InvoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableLabel.text = [NSString stringWithFormat:@"%@%d",@"Table: ", self.recepit.bill.table.tableNumber];
    self.peopleNumberLabel.text = [NSString stringWithFormat:@"%@%d",@"Number Of Guests: ", self.recepit.bill.table.peopleCount];
    self.tabLabel.text = [NSString stringWithFormat:@"%.1f", self.recepit.tab];
    self.discountLabel.text = [NSString stringWithFormat:@"%@", self.recepit.discount];
    self.subtotalLabel.text = [NSString stringWithFormat:@"%.1f", self.recepit.subtotal];
    self.taxLabel.text = [NSString stringWithFormat:@"%.1f", self.recepit.tax];
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%.1f", self.recepit.total];
    self.paymentMethodLabel.text = [NSString stringWithFormat:@"%@", self.recepit.paymentMethod];
    self.surchargeLabel.text = [NSString stringWithFormat:@"%.2f", self.recepit.surcharge];
    self.paidLabel.text = [NSString stringWithFormat:@"%.2f", self.recepit.paid];
    self.changeLabel.text = [NSString stringWithFormat:@"%.2f", self.recepit.change];
    
    self.invoiceTableView.tableFooterView = [UIView new];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.isPaidIndividuals) {
        return self.people.count;
    }else{
        return self.recepit.bill.table.orders.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isPaidIndividuals) {
        return 150;
    }
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.isPaidIndividuals) {
        SplitBillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SplitBillCell" forIndexPath:indexPath];
        Person *person = self.people[indexPath.row];
        cell.splitCustomerLabel.text = [NSString stringWithFormat:@"%@%@",@"Customer: ", person.id];
        Order *order1 = person.orders.firstObject;
        cell.itemName1.text = order1.item.name;
        cell.itemCount1.text = [NSString stringWithFormat:@"%d", order1.count];

        float price1 = [self itemPriceCalculationWithPrice:order1.item.price Count:order1.count];
        cell.itemPrice1.text = [NSString stringWithFormat:@"%0.2f", price1];
        
        Order *order2 = person.orders.lastObject;
        cell.itemName2.text = order2.item.name;
        cell.itemCount2.text = [NSString stringWithFormat:@"%d", order2.count];

        float price2 = [self itemPriceCalculationWithPrice:order2.item.price Count:order2.count];
        cell.itemPrice2.text = [NSString stringWithFormat:@"%0.2f", price2];
        return cell;
    }else{
    
    BillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BillCell" forIndexPath:indexPath];
    Order *order = self.recepit.bill.table.orders[indexPath.row];
    cell.itemNameLabel.text = order.item.name;
    cell.itemCountLabel.text = [NSString stringWithFormat:@"%d", order.count];

    float price = [self itemPriceCalculationWithPrice:order.item.price Count:order.count];
    cell.totalPriceLabel.text = [NSString stringWithFormat:@"%0.2f", price];
    
    return cell;
        
    }
}

- (float) itemPriceCalculationWithPrice:(float)price Count:(int)count{
    float sum = price * count;
    return sum;
}

- (IBAction)doneButtonTapped:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HomePageViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"Home"];
    
    [self.navigationController setViewControllers:@[viewController] animated:YES];
}


@end
