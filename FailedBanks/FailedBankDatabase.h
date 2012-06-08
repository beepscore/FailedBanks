//
//  FailedBankDatabase.h
//  FailedBanks
//
//  Created by Steve Baker on 6/7/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface FailedBankDatabase : NSObject {
    sqlite3 *_database;
}

// database is a singleton
// In this tutorial, the database isn't writable because it's stored in mainBundle instead of documents.
+ (FailedBankDatabase*)database;

- (NSArray *)failedBankInfos;

@end