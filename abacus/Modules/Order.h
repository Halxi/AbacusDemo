//
//  Order.h
//  abacus
//
//  Created by Zixun Xi on 23/4/21.
//

#import <Foundation/Foundation.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface Order : NSObject

-(instancetype)initWithItem:(Item *)item Count:(int)count;
-(instancetype)initWithItem:(Item *)item Count:(int)count PeopleID:(int)peopleID;
@property (nonatomic, strong) Item *item;
@property (nonatomic) int count;
@property (nonatomic) int peopleID;

+(NSArray *)initOrderForTable1;
+(NSArray *)initOrderForTable2;
+(NSArray *)initOrderForTable3;

@end

NS_ASSUME_NONNULL_END
