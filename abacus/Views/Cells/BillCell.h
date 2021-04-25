//
//  BillCell.h
//  abacus
//
//  Created by Zixun Xi on 25/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BillCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *itemCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;

@end

NS_ASSUME_NONNULL_END
