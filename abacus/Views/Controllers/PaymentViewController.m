//
//  PaymentViewController.m
//  abacus
//
//  Created by Zixun Xi on 25/4/21.
//

#import "PaymentViewController.h"
#import "Order.h"
#import "Person.h"
#import "InvoiceViewController.h"

@interface PaymentViewController ()
@end
static NSString *const PRICE_CHANGED = @"price_changed";

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBorderForButton:self.discountButton1];
    [self setBorderForButton:self.discountButton2];
    [self setBorderForButton:self.noneDiscountButtion];
    [self setBorderForButton:self.noneTabButton];
    [self setBorderForButton:self.tabButton];
    [self setBorderForButton:self.payCreditCardButton];
    [self setBorderForButton:self.paySplitButton];
    [self setBorderForButton:self.payIndividualsButton];
    [self setBorderForButton:self.payEquallyButton];
    [self setBorderForButton:self.payButton];
    self.finalPrice = self.bill.totalPrice;
    self.splitViewHeightConstraint.constant = 0;
    self.isPaidByCreditCard = YES;
    
    [self.noneDiscountButtion setSelected:YES];
    [self.payCreditCardButton setSelected:YES];
    [self.noneTabButton setSelected:YES];
    [self.payEquallyButton setSelected:YES];
    self.isPaidIndividuals = NO;
    if (self.bill.hasComments) {
        [self.payIndividualsButton setHidden:NO];
    }else{
        [self.payIndividualsButton setHidden:YES];
    }
    self.discountLabel.text = [NSString stringWithFormat:@"%@%@", @"Discount: ", self.noneDiscountButtion.titleLabel.text];
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%@%.1f",@"Total: ", self.bill.totalPrice];
    self.tabLabel.text = [NSString stringWithFormat:@"%@%@", @"Tab: ", self.noneTabButton.titleLabel.text];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(totalPriceLabelChanged) name:PRICE_CHANGED object:nil];
}


- (void) setBorderForButton:(UIButton *)button{
    button.layer.borderWidth = 2;
    button.layer.cornerRadius = 10;
    button.layer.borderColor = [UIColor darkGrayColor].CGColor;
}

- (IBAction)discountButton1Tapped:(id)sender {
    self.discount = self.discountButton1.titleLabel.text;
    [self.noneDiscountButtion setSelected:NO];
    [self.discountButton1 setSelected:YES];
    [self.discountButton2 setSelected:NO];
    self.discountLabel.text = [NSString stringWithFormat:@"%@%@", @"Discount: ", self.discount];
    self.isDiscountButton1Tapped = YES;
    self.isDiscountButton2Tapped = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:PRICE_CHANGED object:nil];
}
- (IBAction)discountButton2Tapped:(id)sender {
    self.discount = self.discountButton2.titleLabel.text;
    [self.noneDiscountButtion setSelected:NO];
    [self.discountButton1 setSelected:NO];
    [self.discountButton2 setSelected:YES];
    self.discountLabel.text = [NSString stringWithFormat:@"%@%@", @"Discount: ", self.discount];
    self.isDiscountButton1Tapped = NO;
    self.isDiscountButton2Tapped = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:PRICE_CHANGED object:nil];
}
- (IBAction)noneDiscountButtonTapped:(id)sender {
    self.discount = @"0%";
    [self.noneDiscountButtion setSelected:YES];
    [self.discountButton1 setSelected:NO];
    [self.discountButton2 setSelected:NO];
    self.discountLabel.text = [NSString stringWithFormat:@"%@%@", @"Discount: ", self.noneDiscountButtion.titleLabel.text];
    self.isDiscountButton1Tapped = NO;
    self.isDiscountButton2Tapped = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:PRICE_CHANGED object:nil];
}
- (IBAction)noneTabButtonTapped:(id)sender {
    self.tab = 0;
    [self.noneTabButton setSelected:YES];
    [self.tabButton setSelected:NO];
    self.tabLabel.text = [NSString stringWithFormat:@"%@%@", @"Tab: ", self.noneTabButton.titleLabel.text];
    self.isTabButtonTapped = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:PRICE_CHANGED object:nil];
}
- (IBAction)tabButtonTapped:(id)sender {
    self.tab = 50;
    [self.tabButton setSelected:YES];
    [self.noneTabButton setSelected:NO];
    self.tabLabel.text = [NSString stringWithFormat:@"%@%@", @"Tab: ", self.tabButton.titleLabel.text];
    self.isTabButtonTapped = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:PRICE_CHANGED object:nil];
}
- (IBAction)payCreditButtonTapped:(id)sender {
    self.paymentMethod = @"Credit Card";
    self.isPaidByCreditCard = YES;
    self.splitViewHeightConstraint.constant = 0;
    [[NSNotificationCenter defaultCenter] postNotificationName:PRICE_CHANGED object:nil];
}
- (IBAction)splitPayButtonTapped:(id)sender {
    self.paymentMethod = [NSString stringWithFormat:@"%@%d%@", @"Split(", self.bill.table.peopleCount, @")"];
    self.isPaidByCreditCard = NO;
    self.splitViewHeightConstraint.constant = 315;
    [[NSNotificationCenter defaultCenter] postNotificationName:PRICE_CHANGED object:nil];
}
- (IBAction)payIndividualsButtonTapped:(id)sender {
    [self.payIndividualsButton setSelected:YES];
    [self.payEquallyButton setSelected:NO];
    self.isPaidIndividuals = YES;
    
  
}
- (IBAction)payEquallyButtonTapped:(id)sender {
    [self.payEquallyButton setSelected:YES];
    [self.payIndividualsButton setSelected:NO];
    
    
}

- (IBAction)payButtonTapped:(id)sender {
    
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        float tax = self.finalPrice * 0.1;
        float subtotal = self.finalPrice - tax;
        float paid = [self calculationForPayment:self.finalPrice];
        float change = paid - self.finalPrice;
        
        self.paymentMethod = self.paymentMethod ?: @"Credit Card";
        self.discount = self.discount ?: @"0";

        Receipt *receipt = [[Receipt alloc]initWithTable:self.bill PaymentMethod:self.paymentMethod Discount:self.discount Subtotal:subtotal Tax:tax Total:self.finalPrice Paid:paid Change:change Tab:self.tab];
        if (self.isPaidByCreditCard) {
            receipt.surcharge = self.finalPrice * 0.012;
            receipt.change = 0;
            receipt.paid = self.finalPrice * 1.012;
        }else{
            receipt.surcharge = 0;
        }
    
        
        InvoiceViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"normalInvoice"];
    
        viewController.recepit = receipt;
        
    if (self.isPaidIndividuals) {
        NSArray *people = [self individualsPaymentWithBill:self.bill];
        viewController.people = people;
        viewController.isPaidIndividuals = YES;
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (float)calculationForPayment:(float)price{
    if (price < 5) {
        return 5;
    }else if(price < 10){
        return 10;
    }
    if(price < 100){
        int unitPlace = (int)price / 1 % 10;
        int tenPlace = (int)price / 10 % 10;
        if (unitPlace < 5) {
            return tenPlace * 10 + 5;
        }else{
            if (tenPlace == 9) {
                return 100;
            }else{
                return (tenPlace + 1) * 10;
            }
        }
    }else{
        int unitPlace = (int)price / 1 % 10;
        int tenPlace = (int)price / 10 % 10;
        int hundredPlace = (int)price/100 % 10;
        if (unitPlace < 5) {
            return hundredPlace * 100 + tenPlace * 10 + 5;
        }else{
            if (tenPlace == 9) {
                return (hundredPlace + 1) * 100;
            }else{
                return hundredPlace * 100 + (tenPlace + 1) * 10;
            }
        }
    }
}

- (void)totalPriceLabelChanged{
    
    float price = self.bill.totalPrice;
    if (self.isTabButtonTapped) {
        price = price - 50;
    }
    if (self.isDiscountButton1Tapped) {
        price = price * 0.9;
    }else if(self.isDiscountButton2Tapped){
        price = price - 25;
    }
    
    if (self.isPaidByCreditCard) {
        float surcharge = price * 0.012;
        price = price * 1.012;
        [self.surchangeLabel setHidden:NO];
        [self.payCreditCardButton setSelected:YES];
        [self.paySplitButton setSelected:NO];
        [self.splitPayView setHidden:YES];
        self.surchangeLabel.text = [NSString stringWithFormat:@"%@%.2f",@"Surcharge: ", surcharge];
    }else{
        [self.surchangeLabel setHidden:YES];
        [self.payCreditCardButton setSelected:NO];
        [self.paySplitButton setSelected:YES];
        [self.splitPayView setHidden:NO];
    }
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%@%.2f",@"Total: ", price];
    
    self.finalPrice = price;
}
    
- (NSArray *)individualsPaymentWithBill:(Bill *)bill{
    NSMutableArray *people = [NSMutableArray array];
    Person *person1 = [[Person alloc]initWithID:[NSString stringWithFormat:@"%@%d", @"#", 1] Orders:[NSMutableArray array]];
    Person *person2 = [[Person alloc]initWithID:[NSString stringWithFormat:@"%@%d", @"#", 2] Orders:[NSMutableArray array]];
    Person *person3 = [[Person alloc]initWithID:[NSString stringWithFormat:@"%@%d", @"#", 3] Orders:[NSMutableArray array]];
    for(Order *order in bill.table.orders){
        switch (order.peopleID) {
            case 1:
                [person1.orders addObject:order];
                break;
            case 2:
                [person2.orders addObject:order];
                break;
            case 3:
                [person3.orders addObject:order];
                break;
            default:
                break;
        }
    }
    [people addObject:person1];
    [people addObject:person2];
    [people addObject:person3];
    
    return people;
}



@end
