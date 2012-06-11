//
//  FailedBankDetailViewController.h
//  FailedBanks
//
//  Created by Steve Baker on 6/10/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FailedBankDetailViewController : UIViewController {
}

@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UILabel *cityLabel;
@property (nonatomic, retain) IBOutlet UILabel *stateLabel;
@property (nonatomic, retain) IBOutlet UILabel *certNumberLabel;
@property (nonatomic, retain) IBOutlet UILabel *closingDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *updatedLabel;
@property (nonatomic, assign) int uniqueId;

@end