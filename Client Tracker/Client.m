//
//  Client.m
//  Client Tracker
//
//  Created by Michael Feineman on 7/5/13.
//  Copyright (c) 2013 Michael Feineman. All rights reserved.
//

#import "Client.h"
#import "AppDelegate.h"

@implementation Client

@dynamic first_name;
@dynamic last_name;
@dynamic account_balance;
@dynamic payments;

+(NSArray*)getAllClients {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSSortDescriptor* lastNameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"last_name" ascending:NO];
    NSSortDescriptor* firstNameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"first_name" ascending:NO];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Client" inManagedObjectContext:appDelegate.managedObjectContext];
    request.fetchBatchSize = 30;
    request.sortDescriptors = @[lastNameSortDescriptor, firstNameSortDescriptor];
    request.predicate = nil;
    
    NSError *error = nil;
    NSArray* results = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    return results;
}

+(int)getTotalClientCount {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSSortDescriptor* lastNameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"last_name" ascending:NO];
    NSSortDescriptor* firstNameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"first_name" ascending:NO];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Client" inManagedObjectContext:appDelegate.managedObjectContext];
    request.fetchBatchSize = 30;
    request.sortDescriptors = @[lastNameSortDescriptor, firstNameSortDescriptor];
    request.predicate = nil;
    
    NSError *error = nil;
    NSArray* results = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    return [results count];
}

@end
