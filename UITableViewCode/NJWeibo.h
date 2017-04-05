//
//  NJWeibo.h
//  UITableViewCode
//
//  Created by 415 on 17/4/1.
//  Copyright © 2017年 415. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJWeibo : NSObject

//微博中涉及的数据的属性
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name1;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, assign) BOOL vip;


//将数据转化为模型
-(id)initWithDict:(NSDictionary *)dict;
+(id)weiboWithDict:(NSDictionary *)dict;


@end
