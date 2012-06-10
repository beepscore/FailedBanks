//
//  FailedBanksListViewController.h
//  FailedBanks
//
//  Created by Steve Baker on 6/7/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FailedBanksDetailViewController;

@interface FailedBanksListViewController : UITableViewController {
}

@property (nonatomic, retain) NSArray *failedBankInfos;

@property (nonatomic, retain) FailedBanksDetailViewController *details;

@end