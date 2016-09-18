//
//  ViewController.m
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import "PokemonListViewController.h"
#import "PokemonListTableViewCell.h"
#import "PokemonListNetworking.h"
#import "PokemonDetailViewController.h"
#import "PokemonNetworking.h"
#import "PokemonList.h"
#import "AppSegue.h"
#import "MBProgressHUD.h"

@interface PokemonListViewController ()

@property (strong, nonatomic) PokemonListNetworking *pokemonList;
@property (strong, nonatomic) NSString *cellIdentifier;
@property (strong, nonatomic) NSMutableArray *pokemonArray;
@property (nonatomic) int offset;

@end

@implementation PokemonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupView];
    [self getPokemonList:self.offset];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma SetupView
///Setup the variables of the view
- (void)setupView {
    self.pokemonList = [[PokemonListNetworking alloc] init];
    self.cellIdentifier = @"pokemonCell";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.pokemonArray = [[NSMutableArray alloc] init];
    self.offset = 0;
}

#pragma GetPokemonList
///Get Pokemon list from API
- (void)getPokemonList:(int)offset {
    MBProgressHUD *progress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.pokemonList getPokemonListWithBlock:offset withBlock:^(NSArray *object, NSError *error) {
        if (!error && object.count > 0) {
            if (self.offset == 0) {
                self.pokemonArray = [NSMutableArray arrayWithArray:object];
            }else{
                [self.pokemonArray addObjectsFromArray:object];
            }
            [self.tableView reloadData];
        }else{
            NSLog(@"Error: %@", error);
        }
        [progress hideAnimated:YES];
    }];
}

#pragma UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pokemonArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PokemonListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: self.cellIdentifier forIndexPath:indexPath];
    PokemonList *pokemon = self.pokemonArray[indexPath.row];
    cell.pokemonNameLabel.text = pokemon.name;
    return cell;
}

#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MBProgressHUD *progress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    PokemonNetworking *pokemon = [[PokemonNetworking alloc] init];
    
    [pokemon getPokemonDetailWithBlock:(int)indexPath.row + 1 withBlock:^(Pokemon *object, NSError *error) {
        [progress hideAnimated:YES];
        if (!error) {
            [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
            [self performSegueWithIdentifier: ShowPokemonDetailSegue sender:object];
        }
    }];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.pokemonArray.count-1) {
        self.offset += 20;
        [self getPokemonList:self.offset];
    }
}

#pragma Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:ShowPokemonDetailSegue]) {
        PokemonDetailViewController *viewController = segue.destinationViewController;
        viewController.pokemon = sender;
    }
}

@end
