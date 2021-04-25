//
//  TableCell.h
//  abacus
//
//  Created by Zixun Xi on 25/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tableNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *tableCountLabel;

@end

NS_ASSUME_NONNULL_END
