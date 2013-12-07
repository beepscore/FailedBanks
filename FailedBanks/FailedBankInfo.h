//
//  FailedBankInfo.h
//  FailedBanks
//
//  Created by Steve Baker on 6/7/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FailedBankInfo : NSObject

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;

- (id)initWithUniqueId:(int)aUniqueId 
                  name:(NSString *)aName 
                  city:(NSString *)aCity 
                 state:(NSString *)aState;

@end
