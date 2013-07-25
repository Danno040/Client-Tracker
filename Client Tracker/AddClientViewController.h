//
//  AddClientViewController.h
//  Client Tracker
//
//  Created by Michael Feineman on 7/5/13.
//  Copyright (c) 2013 Michael Feineman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddClientViewController;


@protocol AddClientDelegate <NSObject>

-(void) saveNewClient:(AddClientViewController*) controller;

@end

@interface AddClientViewController : UITableViewController

@property IBOutlet UITextField* firstNameField;
@property IBOutlet UITextField* lastNameField;

@property (nonatomic, weak) id <AddClientDelegate> delegate;

-(IBAction)save:(id)sender;

@end

