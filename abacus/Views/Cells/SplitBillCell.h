//
//  SplitBillCell.h
//  abacus
//
//  Created by Zixun Xi on 25/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SplitBillCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *splitCustomerLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemCount1;
@property (weak, nonatomic) IBOutlet UILabel *itemName1;
@property (weak, nonatomic) IBOutlet UILabel *itemPrice1;
@property (weak, nonatomic) IBOutlet UILabel *itemCount2;
@property (weak, nonatomic) IBOutlet UILabel *itemName2;
@property (weak, nonatomic) IBOutlet UILabel *itemPrice2;
@end

NS_ASSUME_NONNULL_END
