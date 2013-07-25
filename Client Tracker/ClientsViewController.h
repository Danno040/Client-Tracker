//
//  ClientsViewController.h
//  Client Tracker
//
//  Created by Michael Feineman on 7/5/13.
//  Copyright (c) 2013 Michael Feineman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddClientViewController.h"

@interface ClientsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AddClientDelegate>

@property (strong, atomic) IBOutlet UITableView* table;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
