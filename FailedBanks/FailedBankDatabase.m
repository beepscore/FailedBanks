//
//  FailedBankDatabase.m
//  FailedBanks
//
//  Created by Steve Baker on 6/7/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import "FailedBankDatabase.h"
#import "FailedBankInfo.h"

@implementation FailedBankDatabase

static FailedBankDatabase *_database;

+ (FailedBankDatabase*)database {
    if (_database == nil) {
        _database = [[FailedBankDatabase alloc] init];
    }
    return _database;
}


- (id)init {
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"banklist" 
                                                             ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}


- (void)dealloc {
    sqlite3_close(_database);
}


- (NSArray *)failedBankInfos {
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT id, bank_name, city, state FROM failed_banks ORDER BY closing_date DESC";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) 
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *cityChars = (char *) sqlite3_column_text(statement, 2);
            char *stateChars = (char *) sqlite3_column_text(statement, 3);
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *city = [[NSString alloc] initWithUTF8String:cityChars];
            NSString *state = [[NSString alloc] initWithUTF8String:stateChars];
            FailedBankInfo *failedBankInfo = [[FailedBankInfo alloc] 
                                    initWithUniqueId:uniqueId name:name city:city state:state];                        
            [retval addObject:failedBankInfo];
        }
        sqlite3_finalize(statement);
    }
    
    for (FailedBankInfo *info in retval) {
        NSLog(@"%d: %@, %@, %@", info.uniqueId, info.name, info.city, info.state);
    }
    return retval;
}

@end