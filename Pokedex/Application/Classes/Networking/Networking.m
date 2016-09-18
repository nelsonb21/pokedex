//
//  Networking.m
//  Pokedex
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import "Networking.h"

@implementation Networking

static NSString *const baseURL = @"http://pokeapi.co/api/v2/";

+ (instancetype)sharedClient {
    static Networking *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[Networking alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
