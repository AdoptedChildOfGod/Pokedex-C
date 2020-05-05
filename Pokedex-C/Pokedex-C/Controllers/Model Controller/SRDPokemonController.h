//
//  SRDPokemonController.h
//  Pokedex-C
//
//  Created by Shannon Draeker on 5/5/20.
//  Copyright © 2020 Shannon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRDPokemon.h"

NS_ASSUME_NONNULL_BEGIN

@interface SRDPokemonController : NSObject

+ (SRDPokemon *) fetchPokemonWith: (NSString *)searchTerm;

@end

NS_ASSUME_NONNULL_END
