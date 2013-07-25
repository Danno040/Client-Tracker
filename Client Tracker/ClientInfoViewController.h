//
//  ClientInfoViewController.h
//  Client Tracker
//
//  Created by Michael Feineman on 7/5/13.
//  Copyright (c) 2013 Michael Feineman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Client.h"
#import "PaymentViewController.h"

@interface ClientInfoViewController : UIViewController <SavePaymentDelegate>

@property (strong, nonatomic) Client* client;

@property IBOutlet UILabel* nameLabel;
@property IBOutlet UILabel* balanceLabel;

-(IBAction)paidWithCheck:(id)sender;
-(IBAction)paidWithCash:(id)sender;
-(IBAction)owesMe:(id)sender;

-(void)updateAccountLabel;

@end
