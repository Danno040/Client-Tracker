//
//  ClientsViewController.m
//  Client Tracker
//
//  Created by Michael Feineman on 7/5/13.
//  Copyright (c) 2013 Michael Feineman. All rights reserved.
//

#import "ClientsViewController.h"
#import "ClientInfoViewController.h"
#import "Client.h"
#import "ClientCell.h"

@interface ClientsViewController ()

@end

@implementation ClientsViewController

@synthesize table;

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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [segue.identifier isEqualToString:@"Add New Client Segue"] ) {
        AddClientViewController* addClientVC = segue.destinationViewController;
        addClientVC.delegate = self;
    } else if ([segue.identifier isEqualToString:@"Selected Client Segue"]) {
        NSLog(@"prepareForSegue: %@", sender);
        ClientInfoViewController* clientInfoViewController = segue.destinationViewController;
        ClientCell* cs = (ClientCell*)sender;
        clientInfoViewController.client = cs.client;
    }
}

#pragma mark - AddClientDelegate

-(void) saveNewClient:(AddClientViewController *)controller
{
    // Do something here like refesh the list
    [table reloadData];
    
    // close the delegated view
    [controller.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    // Need to return a count of total number of clients.
    return [Client getTotalClientCount];
}

-(UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Load client data into a view cell.
    
    ClientCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // Create a cell
    if( cell == nil)
    {
        cell = [[ClientCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    // Fill cell
    NSArray* clients = [Client getAllClients];
    Client* client = [clients objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", client.first_name, client.last_name ];
    cell.client = client;
    
    NSLog(@"Rendering cell with label %@", cell.textLabel.text);
    
    // Return cell
    return cell;
}


#pragma mark - UITableViewDelegate

// For when a row is selected.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
