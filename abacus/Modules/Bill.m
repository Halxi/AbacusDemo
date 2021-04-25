//
//  Bill.m
//  abacus
//
//  Created by Zixun Xi on 23/4/21.
//

#import "Bill.h"
#import "Order.h"

@implementation Bill

- (instancetype)initWithTable:(Table *)table TotalPrice:(float)totalPrice{
    self = [super init];
    if (self) {
        self.table = table;
        self.totalPrice = totalPrice;
        for(Order *order in table.orders){
            if (order.peopleID) {
                self.hasComments = YES;
                return self;
            }else{
                self.hasComments = NO;
            }
        }
        
    }
    return self;
}

@end
