//
//  Contact.m
//  ContactManagement_CLI
//
//


#import "Contact.h"


@implementation Contact

- (instancetype) initWithName: (NSString *) name andPhone: (NSString *) phone {
    
    self = [super init];
    if (self) {
        _name = name;
        _phone = phone;
    }
    else {
        self = nil;
    }
    return  self;
}

@end
