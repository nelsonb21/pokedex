//
//  PokemonSpecieNetworking.m
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import "PokemonSpecieNetworking.h"

@implementation PokemonSpecieNetworking

- (NSURLSessionDataTask *)getPokemonSpecieWithBlock:(int)pokemonID withBlock:(void (^)(PokemonSpecie *object, NSError *error))block {
    
    NSString *url = [@"pokemon-species/" stringByAppendingString:[NSString stringWithFormat:@"%d", pokemonID]];
    
    return [[Networking sharedClient] GET: url parameters:nil progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
    
        NSError *err;
        PokemonSpecie *specie = [[PokemonSpecie alloc] initWithDictionary:JSON error:&err];
        
        if (block) {
            block(specie, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil, error);
        }
    }];
}

@end
