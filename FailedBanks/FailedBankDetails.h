//
//  FailedBankDetails.h
//  FailedBanks
//
//  Created by Steve Baker on 6/9/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface FailedBankDetails : NSObject {
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, assign) int certNumber;
@property (nonatomic, retain) NSDate *closingDate;
@property (nonatomic, retain) NSDate *updatedDate;

- (id)initWithUniqueId:(int)aUniqueId 
                  name:(NSString *)aName 
                  city:(NSString *)aCity 
                 state:(NSString *)aState 
            certNumber:(int)aCertNumber 
           closingDate:(NSDate *)aClosingDate 
           updatedDate:(NSDate *)anUpdatedDate;
@end