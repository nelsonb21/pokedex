//
//  PokemonDetailTableViewCell.h
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"

@interface PokemonDetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *pokemonNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *pokemonNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pokemonRateLabel;

- (void)setupCell:(Pokemon *)pokemon;

@end
