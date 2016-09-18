//
//  PokemonDetailTableViewCell.m
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import "PokemonDetailTableViewCell.h"

@implementation PokemonDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setupCell:(Pokemon *)pokemon {
    self.pokemonNumberLabel.text = [[NSString stringWithFormat:@"%d", pokemon.id] stringByAppendingString:@"."];
    self.pokemonNameLabel.text = [pokemon.name capitalizedString];
    self.pokemonRateLabel.text = [self getGenderRatio:pokemon.specie.genderRate];
}

- (NSString *)getGenderRatio:(int)genderRate {
    if (genderRate <= -1) {
        return @"Genderless";
    }
    
    float femaleRate = (genderRate * 100) / 8;
    float maleRate = femaleRate - 100;
    
    NSString *female = [[NSString stringWithFormat:@"%.01f", femaleRate] stringByAppendingString:@"% female"];
    NSString *male = [[NSString stringWithFormat:@"%.01f", fabsf(maleRate)] stringByAppendingString:@"% male"];
    
    return [[male stringByAppendingString:@" / "] stringByAppendingString:female];
}

@end
