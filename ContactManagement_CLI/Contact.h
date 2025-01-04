//
//  Contact.h
//  ContactManagement_CLI
//
//


/*
 containing only the properties of a contact and an initializing method
 contID, name, and phone
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;

- (instancetype) initWithName: (NSString *) name andPhone: (NSString *) phone;

@end

NS_ASSUME_NONNULL_END
