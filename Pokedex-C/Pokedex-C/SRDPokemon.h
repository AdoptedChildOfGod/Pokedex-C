//
//  SRDPokemon.h
//  Pokedex-C
//
//  Created by Shannon Draeker on 5/5/20.
//  Copyright © 2020 Shannon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRDPokemon : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, readonly, copy) NSArray<NSString *> *abilities;
@property (nonatomic, readonly, copy) NSString *spriteURL;

- (instancetype) initWithName: (NSString *)name
                   identifier:(NSInteger)indentifier
                    abilities:(NSArray<NSString *> *)abilities
                    spriteURL:(NSString *)spriteURL;

@end

@interface SRDPokemon (JSONDecoding)

- (instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)jsonDictionary;

@end

NS_ASSUME_NONNULL_END
