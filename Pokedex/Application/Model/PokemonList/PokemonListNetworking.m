//
//  PokemonListNetworking.m
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import "PokemonListNetworking.h"
#import "PokemonList.h"
#import "AppConstant.h"

@implementation PokemonListNetworking

- (NSURLSessionDataTask *)getPokemonListWithBlock:(int)offset withBlock:(void (^)(NSArray *object, NSError *error))block {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:[NSNumber numberWithInt:offset] forKey:@"offset"];
    
    return [[Networking sharedClient] GET: pokemonURL parameters:params progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *objectFromResponse = [JSON valueForKey:@"results"];
        NSMutableArray *mutableObjects = [NSMutableArray arrayWithCapacity:[objectFromResponse count]];
        
        for (NSDictionary *attributes in objectFromResponse) {
            NSError *err;
            PokemonList *pokemonList = [[PokemonList alloc] initWithDictionary:attributes error:&err];
            [mutableObjects addObject:pokemonList];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutableObjects], nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end
