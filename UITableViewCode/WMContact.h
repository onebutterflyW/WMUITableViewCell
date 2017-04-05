//
//  WMContact.h
//  UITableViewCode
//
//  Created by 415 on 17/4/2.
//  Copyright © 2017年 415. All rights reserved.
//

//

#import <Foundation/Foundation.h>

@interface WMContact : NSObject

#pragma mark 姓
@property (nonatomic,copy) NSString *firstName;
#pragma mark 名
@property (nonatomic,copy) NSString *lastName;
#pragma mark 手机号码
@property (nonatomic,copy) NSString *phoneNumber;

#pragma mark 带参数的构造函数
-(WMContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;

#pragma mark 取得姓名
-(NSString *)getName;


#pragma mark 带参数的静态对象初始化方法
+(WMContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;
@end
