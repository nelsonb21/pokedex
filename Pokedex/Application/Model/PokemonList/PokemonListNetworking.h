//
//  PokemonListNetworking.h
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Networking.h"

@interface PokemonListNetworking : NSObject

- (NSURLSessionDataTask *)getPokemonListWithBlock:(int)offset withBlock:(void (^)(NSArray *object, NSError *error))block;

@end
