//
//  NJWeibo.m
//  UITableViewCode
//
//  Created by 415 on 17/4/1.
//  Copyright © 2017年 415. All rights reserved.
//

#import "NJWeibo.h"

@implementation NJWeibo

//将数据转化为模型
-(id)initWithDict:(NSDictionary *)dict{

    if (self = [super init]) {
        

    [self setValuesForKeysWithDictionary:dict];
    
    
    }
    return self;

}

//setValue:forUndefinedKey:的作用
//1.在setValue:forUndefinedKey:中可以处理模型中属性名和数据中属性名不一致的情况
//2、为了防止模型中没有数据中的某个属性值
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
   

    if ([key isEqualToString:@"name"]) {
        
        self.name1 = value;
        
    }


}

/*//此处实现setValue:forKey:原因,时证明
 //有setValue:forKey:时,系统不调用setValue:forUndefinedKey:
-(void)setValue:(id)value forKey:(NSString *)key{
 NSLog(@"%s",__func__);
    
    if ([key isEqualToString:@"icon"])  self.icon  = value;
    if ([key isEqualToString:@"name"])  self.name1 = value;
    if ([key isEqualToString:@"vip"])   self.vip   = value;
    if ([key isEqualToString:@"text"])  self.text  = value;
    if ([key isEqualToString:@"picture"])self.picture = value;
}
*/





+(id)weiboWithDict:(NSDictionary *)dict{

    
    
    return [[self alloc] initWithDict:dict];

}


@end
