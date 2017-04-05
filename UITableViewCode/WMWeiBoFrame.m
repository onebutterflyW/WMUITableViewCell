//
//  WMWeiBoFrame.m
//  UITableViewCode
//
//  Created by 415 on 17/4/1.
//  Copyright © 2017年 415. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WMWeiBoFrame.h"
#import "NJWeibo.h"

#define WMNameFont [UIFont systemFontOfSize:15]
#define WMTextFont [UIFont systemFontOfSize:16]


@implementation WMWeiBoFrame


-(void)setWeibo:(NJWeibo *)weibo{

    _weibo = weibo;
    
    //间隔
    CGFloat  padding = 10;
    
    //设置头像的frame
    CGFloat iconViewX = padding;
    CGFloat iconViewY = padding;
    CGFloat iconViewW = 30;
    CGFloat iconViewH = 30;

    self.iconF = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    
    
    //设置昵称的frame
    CGFloat nameLabelX = CGRectGetMaxX(self.iconF) + padding;
    //计算文字高度
    CGSize nameSize = [self sizeWithString:_weibo.name1 font:WMNameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    CGFloat nameLabelH = nameSize.height;
    CGFloat nameLabelW = nameSize.width;
    
    CGFloat nameLabelY = iconViewY + (iconViewH - nameLabelH)*0.5;
    self.nameF = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    
    //设置vip的frame
    CGFloat vipViewX = CGRectGetMaxX(self.nameF)+padding;
    CGFloat vipViewY = nameLabelY;
    CGFloat vipViewH = 14;
    CGFloat vipViewW = 14;
    
    self.vipF = CGRectMake(vipViewX, vipViewY, vipViewW, vipViewH);
    
    
    //设置内容introl的frame
    CGFloat introLabelX = iconViewX;
    CGFloat introLabelY = CGRectGetMaxY(self.iconF) +padding;
    CGSize textsize = [self sizeWithString:_weibo.text font:WMTextFont maxSize:CGSizeMake(300, MAXFLOAT)];
    
    CGFloat introLabelW = textsize.width;
    CGFloat introLabelH = textsize.height;
    
    self.introF = CGRectMake(introLabelX, introLabelY, introLabelW, introLabelH);
    
    //设置配图的frame
    if (_weibo.picture) {
        
        CGFloat pictureViewX = iconViewX;
        CGFloat pictureViewY = CGRectGetMaxY(self.introF)+padding;
        CGFloat pictureViewW = 100;
        CGFloat pictureViewH = 100;
        self.pictireF = CGRectMake(pictureViewX, pictureViewY, pictureViewW, pictureViewH);
        
        self.cellHeight = CGRectGetMaxY(self.pictireF)+padding;
        
    }else{
    
        self.cellHeight = CGRectGetMaxY(self.introF)+padding;
        
    }
    
    
}



//辅助的函数
-(CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize{

    NSDictionary *dict = @{NSFontAttributeName :font};
    
    //若计算出来的文字范围超出指定范围,返回真实指定的范围
    //若计算出来的文字范围小于指定范围,返回真实范围
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;

    return size;
}


@end
