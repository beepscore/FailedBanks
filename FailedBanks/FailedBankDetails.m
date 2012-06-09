//
//  FailedBankDetails.m
//  FailedBanks
//
//  Created by Steve Baker on 6/9/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import "FailedBankDetails.h"

@implementation FailedBankDetails
@synthesize uniqueId = _uniqueId;
@synthesize name = _name;
@synthesize city = _city;
@synthesize state = _state;
@synthesize zip = _zip;
@synthesize closingDate = _closingDate;
@synthesize updatedDate = _updatedDate;

- (id)initWithUniqueId:(int)uniqueId name:(NSString *)name 
                  city:(NSString *)city 
                 state:(NSString *)state 
                   zip:(int)zip 
           closingDate:(NSDate *)closingDate 
           updatedDate:(NSDate *)updatedDate {
    
    if ((self = [super init])) {
        self.uniqueId = uniqueId;
        self.name = name;
        self.city = city;
        self.state = state;
        self.zip = zip;
        self.closingDate = closingDate;
        self.updatedDate = updatedDate;
    }
    return self;
}

- (void) dealloc
{
    self.name = nil;
    self.city = nil;
    self.state = nil;
    self.closingDate = nil;
    self.updatedDate = nil;
}

@end
