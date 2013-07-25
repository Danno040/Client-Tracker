//
//  PaymentViewController.m
//  Client Tracker
//
//  Created by Michael Feineman on 7/5/13.
//  Copyright (c) 2013 Michael Feineman. All rights reserved.
//

#import "PaymentViewController.h"

@interface PaymentViewController ()

@end

@implementation PaymentViewController

@synthesize delegate;
@synthesize payment;
@synthesize amountField;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)save:(id)sender
{
    payment.amount = [NSNumber numberWithDouble:[amountField.text doubleValue]];
    
    if( [payment.type isEqualToNumber:@3] ) {
        payment.amount = [NSNumber numberWithDouble:-payment.amount.doubleValue];
    }
    
    double new_account_balance = payment.client.account_balance.doubleValue + payment.amount.doubleValue;
    payment.client.account_balance = [NSNumber numberWithDouble:new_account_balance];
    [payment save];
    
    NSLog(@"Delegating to savePaymentDone");
    [delegate savePaymentDone:self];
}

@end
