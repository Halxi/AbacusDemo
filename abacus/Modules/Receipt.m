//
//  Receipt.m
//  abacus
//
//  Created by Zixun Xi on 23/4/21.
//

#import "Receipt.h"

@implementation Receipt
- (instancetype)initWithTable:(Bill *)bill PaymentMethod:(NSString *)paymentMethod Discount:(NSString *)discount Subtotal:(float)subtotal Tax:(float)tax Total:(float)total Paid:(float)paid Change:(float)change Tab:(float)tab{
    self = [super init];
    if (self) {
        self.bill = bill;
        self.paymentMethod = paymentMethod;
        self.discount = discount;
        self.subtotal = subtotal;
        self.tax = tax;
        self.total = total;
        self.paid = paid;
        self.change = change;
        self.tab = tab;
        
    }
    return self;
}
@end
