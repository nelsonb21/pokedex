//
//  PokemonNetworking.h
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Networking.h"
#import "Pokemon.h"

@interface PokemonNetworking : NSObject

- (NSURLSessionDataTask *)getPokemonDetailWithBlock:(int)pokemonID withBlock:(void (^)(Pokemon *object, NSError *error))block;

@end
