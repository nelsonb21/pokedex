//
//  PokemonListModel.m
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import "PokemonList.h"

@implementation PokemonList

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"name": @"name",
                                                                  @"url": @"url"}];
}

@end
