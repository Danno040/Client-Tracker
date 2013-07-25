//
//  Payment.m
//  Client Tracker
//
//  Created by Michael Feineman on 7/5/13.
//  Copyright (c) 2013 Michael Feineman. All rights reserved.
//

#import "Payment.h"
#import "Client.h"
#import "AppDelegate.h"


@implementation Payment

@dynamic amount;
@dynamic type;
@dynamic client;

-(void) save {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSError* error = nil;
    if([appDelegate.managedObjectContext hasChanges] && ![appDelegate.managedObjectContext save:&error]) {
        NSLog(@"Error! %@, %@", error, [error userInfo]);
        abort();
    }
}

@end
