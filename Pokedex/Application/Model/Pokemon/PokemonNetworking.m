//
//  PokemonNetworking.m
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import "PokemonNetworking.h"
#import "PokemonSpecieNetworking.h"
#import "AppConstant.h"

@implementation PokemonNetworking

- (NSURLSessionDataTask *)getPokemonDetailWithBlock:(int)pokemonID withBlock:(void (^)(Pokemon *object, NSError *error))block {
    
    NSString *url = [pokemonURL stringByAppendingString:[NSString stringWithFormat:@"%d", pokemonID]];
    
    return [[Networking sharedClient] GET: url parameters:nil progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        PokemonSpecieNetworking *specie = [[PokemonSpecieNetworking alloc] init];
        [specie getPokemonSpecieWithBlock:pokemonID withBlock:^(PokemonSpecie *object, NSError *error) {
            if (!error) {
                NSError *err;
                Pokemon *pokemon = [[Pokemon alloc] initWithDictionary:JSON error:&err];
                pokemon.specie = object;
                
                if (block) {
                    block(pokemon, nil);
                }
            }else{
                if (block) {
                    block(nil, nil);
                }
            }
        }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil, error);
        }
    }];
}

@end
