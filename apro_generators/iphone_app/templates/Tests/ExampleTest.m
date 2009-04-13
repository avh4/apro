//
//  ExampleTest.m
//  iPhoneApp (apro generator)
//
//  Created by Aaron VonderHaar on 2/6/09.
//  Copyright 2009 Aaron VonderHaar. All rights reserved.
//

#import "GTMUIKit+UnitTesting.h"
#import <OCMock/OCMock.h>

@interface ExampleTest : SenTestCase { }
@end

@implementation ExampleTest

- (void)testTrue
{
  STAssertNotNULL(self, nil);
}

- (void)testButton
{
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
  [button setTitle:@"Button" forState:UIControlStateNormal];
  GTMAssertObjectImageEqualToImageNamed(button, @"ExampleTest.testButton", nil);
}

- (void)testMock
{
  id mock = [OCMockObject mockForClass:[UIView class]];
  [[[mock stub] andReturn:[UIColor brownColor]] backgroundColor];
  STAssertEquals([mock backgroundColor], [UIColor brownColor], nil);
}

@end
