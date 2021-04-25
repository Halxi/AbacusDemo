//
//  Table.m
//  abacus
//
//  Created by Zixun Xi on 23/4/21.
//

#import "Table.h"

@implementation Table

-(instancetype)initWithTableNumber:(int)tableNumber PeopleCount:(int)peopleCount Orders:(NSArray *)orders{
    self = [super init];
    if (self) {
        self.tableNumber = tableNumber;
        self.peopleCount = peopleCount;
        self.orders = orders;
    }
    return self;
}

@end
