//
//  WMContactGroup.m
//  UITableViewCode
//
//  Created by 415 on 17/4/1.
//  Copyright © 2017年 415. All rights reserved.
//

#import "WMContactGroup.h"


@implementation WMContactGroup

//带参数的构造方法
-(WMContactGroup *)initWithNameOfGroup:(NSString *)nameOfGroup andDetailOfGroup:(NSString *)detailOfGroup andContacts:(NSMutableArray *)contacts{

    if (self = [super init]) {
        
        self.nameOfGroup = nameOfGroup;
        _detailOfGroup = detailOfGroup;
        self.contacts = contacts;
    }

    return  self;
}

//静态带参数的构造方法
+(WMContactGroup *)initWithNameOfGroup:(NSString *)nameOfGroup andDetailOfGroup:(NSString *)detailOfGroup andContacts:(NSMutableArray *)contacts{

    return [[WMContactGroup alloc]initWithNameOfGroup:nameOfGroup andDetailOfGroup:detailOfGroup andContacts:contacts];

}



@end
