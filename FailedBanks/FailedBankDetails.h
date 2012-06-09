//
//  FailedBankDetails.h
//  FailedBanks
//
//  Created by Steve Baker on 6/9/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface FailedBankDetails : NSObject {
    int _uniqueId;
    NSString *_name;
    NSString *_city;
    NSString *_state;
    int _zip;
    NSDate *_closingDate;
    NSDate *_updatedDate;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, assign) int zip;
@property (nonatomic, retain) NSDate *closingDate;
@property (nonatomic, retain) NSDate *updatedDate;

- (id)initWithUniqueId:(int)uniqueId 
                  name:(NSString *)name 
                  city:(NSString *)city 
                 state:(NSString *)state 
                   zip:(int)zip 
           closingDate:(NSDate *)closingDate 
           updatedDate:(NSDate *)updatedDate;

@end

