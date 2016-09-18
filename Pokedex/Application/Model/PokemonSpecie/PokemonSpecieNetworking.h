//
//  PokemonSpecieNetworking.h
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Networking.h"
#import "PokemonSpecie.h"

@interface PokemonSpecieNetworking : NSObject

- (NSURLSessionDataTask *)getPokemonSpecieWithBlock:(int)pokemonID withBlock:(void (^)(PokemonSpecie *object, NSError *error))block;

@end
