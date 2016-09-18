//
//  PokemonDetailViewController.h
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"

@interface PokemonDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *pokemonImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pokemonImageTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pokemonImageHeightConstraint;

@property (strong, nonatomic) Pokemon *pokemon;

@end
