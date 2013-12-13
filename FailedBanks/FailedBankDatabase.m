//
//  FailedBankDatabase.m
//  FailedBanks
//
//  Created by Steve Baker on 6/7/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import "FailedBankDatabase.h"
#import "FailedBankInfo.h"
#import "FailedBankDetails.h"

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
            int aUniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *cityChars = (char *) sqlite3_column_text(statement, 2);
            char *stateChars = (char *) sqlite3_column_text(statement, 3);
            NSString *aName = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *aCity = [[NSString alloc] initWithUTF8String:cityChars];
            NSString *aState = [[NSString alloc] initWithUTF8String:stateChars];
            FailedBankInfo *failedBankInfo = [[FailedBankInfo alloc]
                initWithUniqueId:aUniqueId
                            name:aName
                            city:aCity
                           state:aState];
            [retval addObject:failedBankInfo];
        }
        sqlite3_finalize(statement);
    }

    for (FailedBankInfo *info in retval) {
        NSLog(@"%d: %@, %@, %@", info.uniqueId, info.name, info.city, info.state);
    }
    return retval;
}

- (FailedBankDetails *)failedBankDetails:(int)uniqueId {
    FailedBankDetails *retval = nil;

    NSString *query = [NSString stringWithFormat:@"SELECT id, bank_name, city, state, cert_number, closing_date, updated_date FROM failed_banks WHERE id=%d", uniqueId];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int aUniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *cityChars = (char *) sqlite3_column_text(statement, 2);
            char *stateChars = (char *) sqlite3_column_text(statement, 3);
            int aCertNumber = sqlite3_column_int(statement, 4);
            char *Chars = (char *) sqlite3_column_text(statement, 5);
            char *updatedDateChars = (char *) sqlite3_column_text(statement, 6);
            NSString *aName = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *aCity = [[NSString alloc] initWithUTF8String:cityChars];
            NSString *aState = [[NSString alloc] initWithUTF8String:stateChars];
            NSString *String =
                [[NSString alloc] initWithUTF8String:Chars];
            NSString *updatedDateString =
                [[NSString alloc] initWithUTF8String:updatedDateChars];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
            NSDate *aClosingDate = [formatter dateFromString:String];
            NSDate *anUpdateDate = [formatter dateFromString:updatedDateString];

            retval = [[FailedBankDetails alloc] initWithUniqueId:aUniqueId
                                                            name:aName
                                                            city:aCity
                                                           state:aState
                                                      certNumber:aCertNumber
                                                     closingDate:aClosingDate
                                                     updatedDate:anUpdateDate];
            break;
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

@end
