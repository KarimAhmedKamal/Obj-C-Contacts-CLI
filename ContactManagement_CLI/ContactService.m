//
//  ContactService.m
//  ContactManagement_CLI
//
//

#import "ContactService.h"
#import "Contact.h"

@interface ContactService ()
- (BOOL)checkPhoneIsValid:(NSString *)phone; // private method
@end

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
        NSLog(@"%lu - Name: %@ (Phone Number: %@)", (unsigned long)(i + 1) , c.name, c.phone);
    }
}

- (void)addContact:(Contact *) contact{
    if(!contacts) { // not initialized
        contacts = [[NSMutableArray alloc] init];
    }
    if([self checkPhoneIsValid:contact.phone]) {
        [contacts addObject:contact];
        NSLog(@"The contact is added successfully");
    }
    else {
        NSLog(@"Wrong Phone Number !!!!!");
    }
}

- (void)updateContactAtIndex:(NSUInteger) index withContact: (Contact *) contactNew{
    // check the index
    if(index < contacts.count) {
        if([self checkPhoneIsValid:contactNew.phone]) {
            contacts[index] = contactNew;
            NSLog(@"The Contact is Updated Successfully.");
        }
        else {
            NSLog(@"Wrong Phone Number !!!!!");
        }
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

- (BOOL)checkPhoneIsValid:(NSString *)phone {
    
    // Regular expression for exactly 11 digits
    NSString *phoneRegex = @"^\\d{11}$"; // Match exactly 11 digits
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    return [phoneTest evaluateWithObject:phone];
}

@end
