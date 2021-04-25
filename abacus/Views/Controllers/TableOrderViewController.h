//
//  TableOrderViewController.h
//  abacus
//
//  Created by Zixun Xi on 24/4/21.
//

#import <UIKit/UIKit.h>
#import "Table.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableOrderViewController : UIViewController

@property (nonatomic, strong) Table *table;
@property (weak, nonatomic) IBOutlet UILabel *tableNumber;
@property (weak, nonatomic) IBOutlet UILabel *peopleCount;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UITableView *orderTableView;
@property (nonatomic) float totalPrice;
@property (weak, nonatomic) IBOutlet UIButton *payButton;

@end

NS_ASSUME_NONNULL_END
