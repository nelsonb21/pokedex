//
//  AppConstant.h
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#ifndef AppConstant_h
#define AppConstant_h

//AlertView titles and messages
static NSString *const errorMessage = @"It seems to be a problem with the server";

static NSString *const getPokemonListErrorTitle = @"Couldn't Load Pokemon List";
static NSString *const getPokemonDetailErrorTitle = @"Couldn't Load Pokemon Detail";

//API URL
static NSString *const baseURL = @"http://pokeapi.co/api/v2/";
static NSString *const pokemonURL = @"pokemon/";
static NSString *const pokemonSpecieURL = @"pokemon-species/";

#endif /* AppConstant_h */
