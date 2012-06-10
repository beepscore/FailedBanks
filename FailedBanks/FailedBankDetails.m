//
//  FailedBankDetails.m
//  FailedBanks
//
//  Created by Steve Baker on 6/9/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import "FailedBankDetails.h"

@implementation FailedBankDetails

@synthesize uniqueId;
@synthesize name;
@synthesize city;
@synthesize state;
@synthesize certNumber;
@synthesize closingDate;
@synthesize updatedDate;

- (id)initWithUniqueId:(int)aUniqueId 
                  name:(NSString *)aName 
                  city:(NSString *)aCity 
                 state:(NSString *)aState 
                   certNumber:(int)aCertNumber
           closingDate:(NSDate *)aClosingDate 
           updatedDate:(NSDate *)anUpdatedDate {
    
    if ((self = [super init])) {
        self.uniqueId = aUniqueId;
        self.name = aName;
        self.city = aCity;
        self.state = aState;
        self.certNumber = aCertNumber;
        self.closingDate = aClosingDate;
        self.updatedDate = anUpdatedDate;
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


- (NSString *)description {
    return [NSString stringWithFormat:@"uniqueID: %d city %@ : %@ state: %@/nCert Number: %d Closing Date: %@ Updated Date:%@\n", self.uniqueId, self.city, self.state, self.certNumber, self.closingDate, self.updatedDate];
}

@end
