//
//  PokemonModel.h
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "PokemonSpecie.h"

@interface Pokemon : JSONModel

@property (nonatomic) int id;
@property (nonatomic) NSString *name;
@property (nonatomic) PokemonSpecie <Ignore> *specie;
@property (nonatomic) NSString *imageUrl;

@end
