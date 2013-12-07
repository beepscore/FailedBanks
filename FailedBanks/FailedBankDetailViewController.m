//
//  FailedBankDetailViewController.m
//  FailedBanks
//
//  Created by Steve Baker on 6/10/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import "FailedBankDetailViewController.h"
#import "FailedBankDatabase.h"
#import "FailedBankDetails.h"

@interface FailedBankDetailViewController ()
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *cityLabel;
@property (nonatomic, weak) IBOutlet UILabel *stateLabel;
@property (nonatomic, weak) IBOutlet UILabel *certNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *closingDateLabel;
@property (nonatomic, weak) IBOutlet UILabel *updatedLabel;
@end

@implementation FailedBankDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    FailedBankDetails *details = [[FailedBankDatabase database] 
                                  failedBankDetails:self.uniqueId];
    if (details != nil) {
        [self.nameLabel setText:details.name];
        [self.cityLabel setText:details.city];
        [self.stateLabel setText:details.state];
        [self.certNumberLabel setText:[NSString stringWithFormat:@"%d", details.certNumber]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMMM dd, yyyy"];
        [self.closingDateLabel setText:[formatter stringFromDate:details.closingDate]];
        [self.updatedLabel setText:[formatter stringFromDate:details.updatedDate]];        
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.nameLabel = nil;
    self.cityLabel = nil;
    self.stateLabel = nil;
    self.certNumberLabel = nil;
    self.closingDateLabel = nil;
    self.updatedLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
