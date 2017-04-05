//
//  WMWeiBoFrame.h
//  UITableViewCode
//
//  Created by 415 on 17/4/1.
//  Copyright © 2017年 415. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  NJWeibo;

@interface WMWeiBoFrame : NSObject

//WMWeiBoFrame专门用来保存每一行的frame,计算frame

//icon头像的frame
@property (nonatomic, assign) CGRect iconF;

//name昵称的frame
@property (nonatomic, assign) CGRect nameF;

//vip的frame
@property (nonatomic, assign) CGRect vipF;

//intro内容的frame
@property (nonatomic, assign) CGRect introF;

//picture配图的frame
@property (nonatomic, assign) CGRect pictireF;

//cell的行高
@property (nonatomic, assign) CGFloat cellHeight;

//拥有模型数据,根据模型中的部分数据计算frame
@property (nonatomic, strong) NJWeibo *weibo;

@end
