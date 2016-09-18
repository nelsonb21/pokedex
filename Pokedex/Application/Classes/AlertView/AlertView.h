//
//  AlertView.h
//  Pokedex
//
//  Created by Nelson Bolivar on 9/18/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertView : NSObject

- (UIAlertController *)showAlertView:(NSString *)title withMessage:(NSString *)message;

@end
