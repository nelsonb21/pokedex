//
//  PokedexUITests.m
//  PokedexUITests
//
//  Created by Nelson Bolivar on 9/17/16.
//  Copyright © 2016 Nelson Bolivar. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface PokedexUITests : XCTestCase

@property (strong, nonatomic) XCUIApplication *app;

@end

@implementation PokedexUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    self.app = [[XCUIApplication alloc] init];
    [self.app launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDataLoading {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Loading pokemon list"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(19 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expectation fulfill];
    });
    
    [self waitForExpectationsWithTimeout:20 handler:nil];
    XCTAssertGreaterThan(self.app.tables.cells.count, 1);
    
    XCTAssert(self.app.tables.staticTexts[@"charmander"].exists);
    
    [self.app.tables.staticTexts[@"charmander"] tap];
    
    XCTestExpectation *expectation2 = [self expectationWithDescription:@"Show pokemon detail"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(19 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expectation2 fulfill];
    });
    
    [self waitForExpectationsWithTimeout:20 handler:nil];
    XCTAssert(self.app.staticTexts[@"4."].exists);
}


@end
