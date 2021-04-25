//
//  Person.m
//  abacus
//
//  Created by Zixun Xi on 25/4/21.
//

#import "Person.h"

@implementation Person
-(instancetype)initWithID:(NSString *)id Orders:(NSMutableArray *)orders{
    self = [super init];
    if (self) {
        self.id = id;
        self.orders = orders;
    }
    return self;
}
@end
