//
//  MainMenu.m
//  ContactManagement_CLI
//
//

#import "MainMenu.h"

@implementation MainMenu
+ (void) showMenu {
    NSLog(@"\nContact Management System");
    NSLog(@"1. List Contacts");
    NSLog(@"2. Add Contact");
    NSLog(@"3. Update Contact");
    NSLog(@"4. Delete Contact");
    NSLog(@"0. Exit");
    NSLog(@"Choose an option: ");
}
@end
