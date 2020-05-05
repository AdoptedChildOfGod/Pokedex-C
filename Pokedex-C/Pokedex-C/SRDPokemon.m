//
//  SRDPokemon.m
//  Pokedex-C
//
//  Created by Shannon Draeker on 5/5/20.
//  Copyright © 2020 Shannon. All rights reserved.
//

#import "SRDPokemon.h"

@implementation SRDPokemon

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)indentifier abilities:(NSArray<NSString *> *)abilities spriteURL:(NSString *)spriteURL
{
    self = [super init];
    if (self) {
        _name = name;
        _identifier = indentifier;
        _abilities = abilities;
        _spriteURL = spriteURL;
    }
    return self;
}

@end

@implementation SRDPokemon (JSONDecoding)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)jsonDictionary
{
    NSString *name = jsonDictionary[@"name"];
    NSInteger identifier = [jsonDictionary[@"id"] integerValue];
    NSString *spriteURL = jsonDictionary[@"sprites"][@"front_shiny"];
    
    // Extract the abilities from the nested dictionaries
    NSMutableArray<NSString *> *abilitiesArrayOfStrings = [NSMutableArray new];
    NSArray *abilitiesArrayOfDicts = jsonDictionary[@"abilities"];
    for (NSDictionary *dictionary in abilitiesArrayOfDicts)
    {
        NSDictionary *abilityDict = dictionary[@"ability"];
        [abilitiesArrayOfStrings addObject:abilityDict[@"name"]];
    }
    NSArray<NSString *> *abilities = [abilitiesArrayOfStrings copy];
    
    // Make sure all the values are valid
    if (![name isKindOfClass:[NSString class]] || [abilities isKindOfClass:[NSNull class]]) { return nil; }
    
    return [self initWithName:name identifier:identifier abilities:abilities spriteURL:spriteURL];
}

@end
