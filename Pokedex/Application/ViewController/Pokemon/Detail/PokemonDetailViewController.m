//
//  PokemonDetailViewController.m
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import "PokemonDetailViewController.h"
#import "PokemonDetailTableViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface PokemonDetailViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) NSString *cellIdentifier;
@property (strong, nonatomic) NSArray *datasource;

@end

@implementation PokemonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma SetupView
///Setup the variables of the view
- (void)setupView {
    self.title = [self.pokemon.name capitalizedString];
    self.cellIdentifier = @"PokemonDetailCell";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.datasource = [NSArray arrayWithObjects:@"ImageCell", @"PokemonDetailCell", nil];
    
    self.pokemonImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.pokemonImageView sd_setImageWithURL:[NSURL URLWithString:self.pokemon.imageUrl]];
}

#pragma UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = self.datasource[indexPath.row];
    
    if ([identifier isEqualToString: @"ImageCell"]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        return cell;
    }
    
    PokemonDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: self.cellIdentifier forIndexPath:indexPath];
    [cell setupCell:self.pokemon];
    return cell;
}

#pragma UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return 220;
            break;
        default:
            return 74;
            break;
    }
}

#pragma UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
   
    if (-scrollView.contentOffset.y > 0) {
        self.pokemonImageHeightConstraint.constant = -scrollView.contentOffset.y + 220;
        self.pokemonImageTopConstraint.constant = 0;
    }else{
        self.pokemonImageHeightConstraint.constant = 220;
        self.pokemonImageTopConstraint.constant = -scrollView.contentOffset.y;
    }
    
    [self.pokemonImageView layoutIfNeeded];
    [self.pokemonImageView setNeedsLayout];
}

@end
