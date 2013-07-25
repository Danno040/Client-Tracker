//
//  PaymentViewController.h
//  Client Tracker
//
//  Created by Michael Feineman on 7/5/13.
//  Copyright (c) 2013 Michael Feineman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Payment.h"

@class PaymentViewController;

@protocol SavePaymentDelegate

-(void)savePaymentDone:(PaymentViewController*)controller;

@end

@interface PaymentViewController : UIViewController

@property (nonatomic, weak) id <SavePaymentDelegate> delegate;
@property (strong, nonatomic) Payment* payment;

@property IBOutlet UITextField* amountField;

-(IBAction)save:(id)sender;

@end
