//
//  ContactService.m
//  ContactManagement_CLI
//
//

#import "ContactService.h"
#import "Contact.h"

@implementation ContactService

- (instancetype) init{
    self = [super init];
    if(self) {
        contacts = [[NSMutableArray alloc] init];
    }
    else {
        self = nil;
    }
    return self;
}

- (void)showContacts{
    NSUInteger count = contacts.count;
    
    if (count == 0) {
        NSLog(@"No contacts.");
        return;
    }
    
    for(NSUInteger i = 0; i < count; ++i) {
        Contact *c = contacts[i];
        NSLog(@"%lu - Name: %@. Phone Number: %@", (unsigned long)(i + 1) , c.name, c.phone);
    }
}

- (void)addContact:(Contact *) contact{
    if(!contacts) { // not initialized
        contacts = [[NSMutableArray alloc] init];
    }
    [contacts addObject:contact];
    NSLog(@"The contact is added successfully");
}

- (void)updateContactAtIndex:(NSUInteger) index withContact: (Contact *) contactNew{
    // check the index
    if(index < contacts.count) {
        contacts[index] = contactNew;
        NSLog(@"The Contact is Updated Successfully.");
    }
    else {
        NSLog(@"Bad Index !!!!!");
    }
    
}

- (void)deleteContactAtIndex:(NSUInteger)index{
    // check the index
    if(index < contacts.count) {
        [contacts removeObjectAtIndex:index];
        NSLog(@"The Contact is Deleted Successfully.");
    }
    else {
        NSLog(@"Bad Index !!!!!");
    }
}

@end
