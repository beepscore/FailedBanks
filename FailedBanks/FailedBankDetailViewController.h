//
//  FailedBankDetailViewController.h
//  FailedBanks
//
//  Created by Steve Baker on 6/10/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FailedBankDetailViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *cityLabel;
@property (nonatomic, weak) IBOutlet UILabel *stateLabel;
@property (nonatomic, weak) IBOutlet UILabel *certNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *closingDateLabel;
@property (nonatomic, weak) IBOutlet UILabel *updatedLabel;
@property (nonatomic, assign) int uniqueId;

@end