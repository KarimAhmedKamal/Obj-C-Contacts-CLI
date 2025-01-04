//
//  ContactService.h
//  ContactManagement_CLI
//
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class Contact;

@interface ContactService : NSObject

{
    NSMutableArray<Contact *> *contacts;
}

- (void)showContacts;
- (void)addContact:(Contact *) contact;
- (void)updateContactAtIndex:(NSUInteger) index withContact: (Contact *) contactNew;
- (void)deleteContactAtIndex:(NSUInteger)index;

@end
NS_ASSUME_NONNULL_END

