//
//  InvoiceViewController.h
//  abacus
//
//  Created by Zixun Xi on 25/4/21.
//

#import <UIKit/UIKit.h>
#import "Receipt.h"

NS_ASSUME_NONNULL_BEGIN

@interface InvoiceViewController : UIViewController

@property(nonatomic, strong) Receipt *recepit;
@property (weak, nonatomic) IBOutlet UILabel *tableLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *taxLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *paymentMethodLabel;
@property (weak, nonatomic) IBOutlet UILabel *paidLabel;
@property (weak, nonatomic) IBOutlet UILabel *changeLabel;
@property (weak, nonatomic) IBOutlet UILabel *tabLabel;
@property (weak, nonatomic) IBOutlet UILabel *surchargeLabel;
@property (weak, nonatomic) IBOutlet UITableView *invoiceTableView;

@property (nonatomic) BOOL isPaidIndividuals;
@property (nonatomic, strong) NSArray *people;
@end

NS_ASSUME_NONNULL_END
