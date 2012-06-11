//
//  FailedBankInfo.m
//  FailedBanks
//
//  Created by Steve Baker on 6/7/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import "FailedBankInfo.h"

@implementation FailedBankInfo

@synthesize uniqueId;
@synthesize name;
@synthesize city;
@synthesize state;

- (id)initWithUniqueId:(int)aUniqueId 
                  name:(NSString *)aName 
                  city:(NSString *)aCity 
                 state:(NSString *)aState {
    if ((self = [super init])) {
        self.uniqueId = aUniqueId;
        self.name = aName;
        self.city = aCity;
        self.state = aState;
    }
    return self;
}

- (void) dealloc {
    self.name = nil;
    self.city = nil;
    self.state = nil;    
}

@end