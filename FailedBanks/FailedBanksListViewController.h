//
//  FailedBanksListViewController.h
//  FailedBanks
//
//  Created by Steve Baker on 6/7/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FailedBanksListViewController : UITableViewController {
    NSArray *_failedBankInfos;
}

@property (nonatomic, retain) NSArray *failedBankInfos;

@end