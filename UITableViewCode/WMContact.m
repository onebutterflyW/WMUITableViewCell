//
//  WMContact.m
//  UITableViewCode
//
//  Created by 415 on 17/4/2.
//  Copyright © 2017年 415. All rights reserved.
//

#import "WMContact.h"


@implementation WMContact

-(WMContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber{
    if(self=[super init]){
        self.firstName=firstName;
        self.lastName=lastName;
        self.phoneNumber=phoneNumber;
    }
    return self;
}

-(NSString *)getName{
    return [NSString stringWithFormat:@"%@ %@",_lastName,_firstName];
}

+(WMContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber{
    WMContact *contact1=[[WMContact alloc]initWithFirstName:firstName andLastName:lastName andPhoneNumber:phoneNumber];
    return contact1;
}

@end
