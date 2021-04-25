//
//  Receipt.h
//  abacus
//
//  Created by Zixun Xi on 23/4/21.
//

#import <Foundation/Foundation.h>
#import "Bill.h"
#import "Table.h"

NS_ASSUME_NONNULL_BEGIN

@interface Receipt : NSObject

@property (nonatomic, strong) Bill *bill;
@property (nonatomic, strong) NSString *paymentMethod;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic) float subtotal;
@property (nonatomic) float tax;
@property (nonatomic) float total;
@property (nonatomic) float paid;
@property (nonatomic) float change;
@property (nonatomic) float tab;
@property (nonatomic) float surcharge;

- (instancetype)initWithTable:(Bill *)bill PaymentMethod:(NSString *)paymentMethod Discount:(NSString *)discount Subtotal:(float)subtotal Tax:(float)tax Total:(float)total Paid:(float)paid Change:(float)change Tab:(float)tab;
@end

NS_ASSUME_NONNULL_END
