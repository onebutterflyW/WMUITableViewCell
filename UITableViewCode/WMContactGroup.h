//
//  WMContactGroup.h
//  UITableViewCode
//
//  Created by 415 on 17/4/1.
//  Copyright © 2017年 415. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMContact.h"

@interface WMContactGroup : NSObject

@property (nonatomic, copy) NSString *nameOfGroup;

@property (nonatomic, copy) NSString *detailOfGroup;

@property (nonatomic, strong) NSMutableArray *contacts;

//带参数的构造方法
-(WMContactGroup *)initWithNameOfGroup:(NSString *)nameOfGroup andDetailOfGroup:(NSString *)detailOfGroup andContacts:(NSMutableArray *)contacts;

//静态带参数的构造方法
+(WMContactGroup *)initWithNameOfGroup:(NSString *)nameOfGroup andDetailOfGroup:(NSString *)detailOfGroup andContacts:(NSMutableArray *)contacts;
@end
