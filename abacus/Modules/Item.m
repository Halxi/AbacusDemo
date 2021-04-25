//
//  Item.m
//  abacus
//
//  Created by Zixun Xi on 23/4/21.
//

#import "Item.h"

@implementation Item

- (instancetype)initWithName:(NSString *)name Price:(float)price{
    self = [super init];
    if (self) {
        self.name = name;
        self.price = price;
    }
    return self;
}

+ (NSArray *)getAllItems{
    NSMutableArray *items = [NSMutableArray array];
    
    [items addObject:[[Item alloc]initWithName:@"Big Brekkie" Price:16.0]];
    [items addObject:[[Item alloc]initWithName:@"Bruchetta" Price:8.0]];
    [items addObject:[[Item alloc]initWithName:@"Poached Eggs" Price:12.0]];
    [items addObject:[[Item alloc]initWithName:@"Coffee" Price:5.0]];
    [items addObject:[[Item alloc]initWithName:@"Tea" Price:3.0]];
    [items addObject:[[Item alloc]initWithName:@"Soda" Price:4.0]];
    [items addObject:[[Item alloc]initWithName:@"Garden Salad" Price:10.0]];
    
    return items;
}

@end
