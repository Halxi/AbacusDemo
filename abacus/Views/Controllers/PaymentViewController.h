//
//  PaymentViewController.h
//  abacus
//
//  Created by Zixun Xi on 25/4/21.
//

#import <UIKit/UIKit.h>
#import "Table.h"
#import "Bill.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaymentViewController : UIViewController
@property (nonatomic, strong) Bill *bill;

@property (nonatomic) BOOL isTabButtonTapped;
@property (nonatomic) BOOL isDiscountButton1Tapped;
@property (nonatomic) BOOL isDiscountButton2Tapped;
@property (nonatomic) BOOL isPaidByCreditCard;
@property (nonatomic) BOOL isPaidIndividuals;

@property (nonatomic, strong) NSString *paymentMethod;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic) float tab;
@property (nonatomic) float finalPrice;

@property (weak, nonatomic) IBOutlet UIButton *discountButton1;
@property (weak, nonatomic) IBOutlet UIButton *discountButton2;
@property (weak, nonatomic) IBOutlet UIButton *noneDiscountButtion;
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;
@property (weak, nonatomic) IBOutlet UIButton *payCreditCardButton;
@property (weak, nonatomic) IBOutlet UIButton *paySplitButton;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *noneTabButton;
@property (weak, nonatomic) IBOutlet UIButton *tabButton;
@property (weak, nonatomic) IBOutlet UILabel *tabLabel;
@property (weak, nonatomic) IBOutlet UIView *splitPayView;
@property (weak, nonatomic) IBOutlet UILabel *surchangeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *splitViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UIButton *payIndividualsButton;
@property (weak, nonatomic) IBOutlet UIButton *payEquallyButton;
@property (weak, nonatomic) IBOutlet UIButton *payButton;


@end

NS_ASSUME_NONNULL_END
