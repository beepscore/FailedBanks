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

@end

@implementation FailedBankDetailViewController

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (void) dealloc {
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
