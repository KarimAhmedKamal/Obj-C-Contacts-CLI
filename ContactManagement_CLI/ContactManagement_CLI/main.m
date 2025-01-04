//
//  main.m
//  ContactManagement_CLI
//
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "ContactService.h"
#import "MainMenu.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // initialize ann instance of a ContactService Class which carries Contacts
        ContactService * conService = [[ContactService alloc] init];
        // variable to carry the currrent user choice
        int choice = -1;
        
        // exits on correct choice for exit (0)
        while(choice != 0) {
            // print main menu
            [MainMenu showMenu];
            // scanning user's choice
            scanf("%d", &choice);
            getchar(); // Clear the newline character
            // choose service
            switch (choice) {
                case 0: { // exit
                    NSLog(@"Exiting....\nThanks :)");
                    break;
                }
                case 1: { // List
                    [conService showContacts];
                    break;
                }
                case 2: { // add
                    // buffers
                    char name[256];
                    char phone[256];
                    // recieve user's input using fgets as it prevents overflowing if the input is larger than the given buffer
                    NSLog(@"Enter Name");
                    fgets(name, sizeof(name), stdin);
                    NSString *contactName = [NSString stringWithUTF8String:name];
                    // remove newLine
                    contactName = [contactName stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                    NSLog(@"Enter Phone Number");
                    fgets(phone, sizeof(phone), stdin);
                    NSString *contactaPhone = [NSString stringWithUTF8String:phone];
                    // remove newLine
                    contactaPhone = [contactaPhone stringByReplacingOccurrencesOfString:@"\n" withString:@""];                    // initialize new contact
                    Contact *contact = [[Contact alloc] initWithName:contactName andPhone:contactaPhone];
                    // add contact to contacts array
                    [conService addContact:contact];
                    break;
                }
                case 3: {// update
                    // buffers
                    char name[256];
                    char phone[256];
                    // index
                    int index = -1;
                    NSLog(@"Enter the index of the contact you want to delete (starting from 1)");
                    // scanning user's choice
                    scanf("%d", &index);
                    getchar(); // Clear the newline character
                    // recieve user's input using fgets as it prevents overflowing if the input is larger than the given buffer
                    NSLog(@"Enter Name");
                    fgets(name, sizeof(name), stdin);
                    NSString *contactName = [NSString stringWithUTF8String:name];
                    // remove newLine
                    contactName = [contactName stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                    NSLog(@"Enter Phone Number");
                    fgets(phone, sizeof(phone), stdin);
                    NSString *contactaPhone = [NSString stringWithUTF8String:phone];
                    // remove newLine
                    contactaPhone = [contactaPhone stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                    // initialize new contact
                    Contact *contact = [[Contact alloc] initWithName:contactName andPhone:contactaPhone];
                    // add contact to contacts array
                    [conService updateContactAtIndex:((NSInteger) index - 1) withContact:contact];
                    break;
                }
                case 4: {// delete
                    // index
                    int index = -1;
                    NSLog(@"Enter the index of the contact you want to delete (starting from 1)");
                    // scanning user's choice
                    scanf("%d", &index);
                    getchar(); // Clear the newline character
                    // delete the contact from the array
                    [conService deleteContactAtIndex: ((NSUInteger)index-1)];
                    break;
                }
                    
                default:
                    NSLog(@"Bad input.\nPlease Enter a valid Input\n");
                    break;
            }
            
        }
    }
    return 0;
}
