//
//  FailedBanksDetailViewController.m
//  FailedBanks
//
//  Created by Steve Baker on 6/10/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import "FailedBanksDetailViewController.h"
#import "FailedBankDatabase.h"
#import "FailedBankDetails.h"

@interface FailedBanksDetailViewController ()

@end

@implementation FailedBanksDetailViewController

@synthesize nameLabel = _nameLabel;
@synthesize cityLabel = _cityLabel;
@synthesize stateLabel = _stateLabel;
@synthesize zipLabel = _zipLabel;
@synthesize closingDateLabel = _closingDateLabel;
@synthesize updatedLabel = _updatedLabel;
@synthesize uniqueId = _uniqueId;

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
                                  failedBankDetails:_uniqueId];
    if (details != nil) {
        [_nameLabel setText:details.name];
        [_cityLabel setText:details.city];
        [_stateLabel setText:details.state];
        [_zipLabel setText:[NSString stringWithFormat:@"%d", details.name]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMMM dd, yyyy"];
        [_closingDateLabel setText:[formatter stringFromDate:details.closingDate]];
        [_updatedLabel setText:[formatter stringFromDate:details.updatedDate]];        
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
    self.zipLabel = nil;
    self.closingDateLabel = nil;
    self.updatedLabel = nil;
}

- (void) dealloc {
    self.nameLabel = nil;
    self.cityLabel = nil;
    self.stateLabel = nil;
    self.zipLabel = nil;
    self.closingDateLabel = nil;
    self.updatedLabel = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
