//
//  Networking.h
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface Networking : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
