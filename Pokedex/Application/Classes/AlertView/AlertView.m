//
//  AlertView.m
//  Pokedex
//
//  Created by Nelson Bolivar on 9/18/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

- (UIAlertController *)showAlertView:(NSString *)title withMessage:(NSString *)message {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                            message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleCancel
                         handler:nil];
    [alert addAction:ok];
    
    return alert;
}

@end
