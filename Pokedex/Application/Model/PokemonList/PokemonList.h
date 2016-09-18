//
//  PokemonListModel.h
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface PokemonList : JSONModel

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *url;

@end
