//
//  HomePageViewController.h
//  abacus
//
//  Created by Zixun Xi on 25/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomePageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tables;
@end

NS_ASSUME_NONNULL_END
