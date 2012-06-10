//
//  FailedBanksDetailViewController.h
//  FailedBanks
//
//  Created by Steve Baker on 6/10/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FailedBanksDetailViewController : UIViewController {
    UILabel *_nameLabel;
    UILabel *_cityLabel;
    UILabel *_stateLabel;
    UILabel *_zipLabel;
    UILabel *_closedLabel;
    UILabel *_updatedLabel;
    int _uniqueId;
}

@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UILabel *cityLabel;
@property (nonatomic, retain) IBOutlet UILabel *stateLabel;
@property (nonatomic, retain) IBOutlet UILabel *zipLabel;
@property (nonatomic, retain) IBOutlet UILabel *closingDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *updatedLabel;
@property (nonatomic, assign) int uniqueId;

@end