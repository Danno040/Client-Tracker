//
//  ClientInfoViewController.m
//  Client Tracker
//
//  Created by Michael Feineman on 7/5/13.
//  Copyright (c) 2013 Michael Feineman. All rights reserved.
//

#import "ClientInfoViewController.h"
#import "PaymentViewController.h"
#import "Payment.h"
#import "AppDelegate.h"

@interface ClientInfoViewController ()

@end

@implementation ClientInfoViewController

@synthesize client;
@synthesize nameLabel;
@synthesize balanceLabel;

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
    
    nameLabel.text = [NSString stringWithFormat:@"%@ %@", client.first_name, client.last_name];
    
    [self updateAccountLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [segue.identifier isEqualToString:@"Paid With Check Segue"] ) {
        NSLog(@"Preparing for Paid With Check Segue");
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        Payment *newPayment = [NSEntityDescription insertNewObjectForEntityForName:@"Payment" inManagedObjectContext:appDelegate.managedObjectContext];
        
        newPayment.client = client;
        // Checks are type 1
        newPayment.type = @1;
        
        PaymentViewController* paymentViewController = segue.destinationViewController;
        paymentViewController.payment = newPayment;
        paymentViewController.delegate = self;
        
    } else if ( [segue.identifier isEqualToString:@"Paid With Cash Segue"] ) {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        Payment *newPayment = [NSEntityDescription insertNewObjectForEntityForName:@"Payment" inManagedObjectContext:appDelegate.managedObjectContext];
        
        newPayment.client = client;
        // Cash is type 2
        newPayment.type = @2;
        
        PaymentViewController* paymentViewController = segue.destinationViewController;
        paymentViewController.payment = newPayment;
        paymentViewController.delegate = self;
    } else if( [segue.identifier isEqualToString:@"IOU Segue"] ) {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        Payment *newPayment = [NSEntityDescription insertNewObjectForEntityForName:@"Payment" inManagedObjectContext:appDelegate.managedObjectContext];
        
        newPayment.client = client;
        // IOUs are type 3
        newPayment.type = @3;
        
        PaymentViewController* paymentViewController = segue.destinationViewController;
        paymentViewController.payment = newPayment;
        paymentViewController.delegate = self;
    }
}

#pragma mark - IBActions
-(IBAction)paidWithCheck:(id)sender {
    [self performSegueWithIdentifier:@"Paid With Check Segue" sender:nil];
}

-(IBAction)paidWithCash:(id)sender {
    
}

-(IBAction)owesMe:(id)sender {
    
}

#pragma mark - Delfate
-(void)savePaymentDone:(PaymentViewController*)controller {
    NSLog(@"self.client: %@, controller.client: %@", client, controller.payment.client);
    [self updateAccountLabel];
    [controller.navigationController popViewControllerAnimated:YES];
}

-(void)updateAccountLabel {
    if( client.account_balance.doubleValue >= 0.0 ) {
        balanceLabel.text = [NSString stringWithFormat:@"$%3.2f", client.account_balance.doubleValue];
        [balanceLabel setTextColor:[UIColor greenColor]];
    } else {
        balanceLabel.text = [NSString stringWithFormat:@"-$%3.2f", -client.account_balance.doubleValue];
        [balanceLabel setTextColor:[UIColor redColor]];
    }
}

@end
