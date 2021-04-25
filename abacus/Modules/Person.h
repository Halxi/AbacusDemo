//
//  Person.h
//  abacus
//
//  Created by Zixun Xi on 25/4/21.
//

#import <Foundation/Foundation.h>
#import "Order.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSMutableArray *orders;
-(instancetype)initWithID:(NSString *)id Orders:(NSMutableArray *)orders;
@end

NS_ASSUME_NONNULL_END
