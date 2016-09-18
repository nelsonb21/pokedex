//
//  PokemonModel.m
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"id": @"id",
                                                                  @"name": @"name",
                                                                  @"imageUrl": @"sprites.front_default"}];
}

@end
