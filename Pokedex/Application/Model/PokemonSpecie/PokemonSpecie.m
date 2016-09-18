//
//  PokemonSpecie.m
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import "PokemonSpecie.h"

@implementation PokemonSpecie

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"genderRate": @"gender_rate"}];
}

@end
