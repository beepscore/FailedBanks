//
//  FailedBanksListViewController.m
//  FailedBanks
//
//  Created by Steve Baker on 6/7/12.
//  Copyright (c) 2012 Beepscore LLC. All rights reserved.
//

#import "FailedBanksListViewController.h"
#import "FailedBankDatabase.h"
#import "FailedBankInfo.h"
#import "FailedBankDetailViewController.h"

@interface FailedBanksListViewController ()

@end

@implementation FailedBanksListViewController

@synthesize failedBankInfos;
@synthesize failedBankDetailViewController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.failedBankInfos = [FailedBankDatabase database].failedBankInfos;
    self.title = @"Failed Banks";
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.failedBankDetailViewController = nil;
}

- (void)dealloc {
    self.failedBankInfos = nil;
    self.failedBankDetailViewController = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.failedBankInfos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = 
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                       reuseIdentifier:CellIdentifier];
    }
    
    // Set up the cell...
    FailedBankInfo *failedBankInfo = [self.failedBankInfos objectAtIndex:indexPath.row];
    cell.textLabel.text = failedBankInfo.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@", 
                                 failedBankInfo.city, failedBankInfo.state];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.failedBankDetailViewController == nil) {
        self.failedBankDetailViewController = [[FailedBankDetailViewController alloc] 
                        initWithNibName:@"FailedBankDetailViewController" 
                        bundle:nil];        
    }
    FailedBankInfo *failedBankInfo = [self.failedBankInfos objectAtIndex:indexPath.row];
    self.failedBankDetailViewController.uniqueId = failedBankInfo.uniqueId;
    [self.navigationController pushViewController:self.failedBankDetailViewController animated:YES];
}

@end