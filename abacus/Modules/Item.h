//
//  Item.h
//  abacus
//
//  Created by Zixun Xi on 23/4/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject

- (instancetype)initWithName:(NSString *)name Price:(float)price;

@property (nonatomic, strong) NSString *name;
@property (nonatomic) float price;

+(NSArray *)getAllItems;

@end

NS_ASSUME_NONNULL_END
