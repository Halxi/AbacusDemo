//
//  Bill.h
//  abacus
//
//  Created by Zixun Xi on 23/4/21.
//

#import <Foundation/Foundation.h>
#import "Table.h"

NS_ASSUME_NONNULL_BEGIN

@interface Bill : NSObject

@property (nonatomic, strong) Table *table;
@property (nonatomic) float totalPrice;
@property (nonatomic) BOOL hasComments;

- (instancetype)initWithTable:(Table *)table TotalPrice:(float)totalPrice;

@end

NS_ASSUME_NONNULL_END
