//
//  Order.m
//  abacus
//
//  Created by Zixun Xi on 23/4/21.
//

#import "Order.h"

@implementation Order

- (instancetype)initWithItem:(Item *)item Count:(int)count{
    self = [super init];
    if (self) {
        self.item = item;
        self.count = count;
    }
    return self;
}

-(instancetype)initWithItem:(Item *)item Count:(int)count PeopleID:(int)peopleID{
    self = [super init];
    if (self) {
        self.item = item;
        self.count = count;
        self.peopleID = peopleID;
    }
    return self;
}

+(NSArray *)initOrderForTable1{
    NSMutableArray *orders = [NSMutableArray array];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Big Brekkie" Price:16.0] Count: 1 PeopleID:1]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Big Brekkie" Price:16.0] Count: 1 PeopleID:2]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Bruchetta" Price:8.0] Count: 1 PeopleID:3]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Poached Eggs" Price:12.0] Count: 1 PeopleID:3]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Coffee" Price:5.0] Count: 1 PeopleID:2]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Tea" Price:3.0] Count: 1 PeopleID:1]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Soda" Price:4.0] Count: 1 PeopleID:3]];
    return orders;
}

+(NSArray *)initOrderForTable2{
    NSMutableArray *orders = [NSMutableArray array];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Tea" Price:3.0] Count: 1]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Coffee" Price:3.0] Count: 3]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Soda" Price:4.0] Count: 1]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Big Brekkie" Price:16.0] Count: 3]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Poached Eggs" Price:12.0] Count: 1]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Garden Salad" Price:10.0] Count: 1]];
    return orders;
}

+(NSArray *)initOrderForTable3{
    NSMutableArray *orders = [NSMutableArray array];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Tea" Price:3.0] Count: 2]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Coffee" Price:3.0] Count: 3]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Soda" Price:4.0] Count: 2]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Bruchetta" Price:8.0] Count: 5]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Big Brekkie" Price:16.0] Count: 5]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Poached Eggs" Price:12.0] Count: 2]];
    [orders addObject:[[Order alloc]initWithItem:[[Item alloc]initWithName:@"Garden Salad" Price:10.0] Count: 3]];
    return orders;
}

@end
