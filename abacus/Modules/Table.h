//
//  Table.h
//  abacus
//
//  Created by Zixun Xi on 23/4/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Table : NSObject

-(instancetype)initWithTableNumber:(int)tableNumber PeopleCount:(int)peopleCount Orders:(NSArray *)orders;
@property (nonatomic) int tableNumber;
@property (nonatomic) int peopleCount;
@property (nonatomic, strong) NSArray *orders;

@end

NS_ASSUME_NONNULL_END
