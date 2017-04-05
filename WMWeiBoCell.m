//
//  WMWeiBoCell.m
//  UITableViewCode
//
//  Created by 415 on 17/4/1.
//  Copyright © 2017年 415. All rights reserved.
//

#import "WMWeiBoCell.h"
#import "NJWeibo.h"
#import "WMWeiBoFrame.h"

#define  WMNameFont [UIFont systemFontOfSize:15]
#define  WMTextFont [UIFont systemFontOfSize:16]


@interface WMWeiBoCell ()

//头像
@property (nonatomic, weak) UIImageView *iconViewOfCell;

//vip
@property (nonatomic, weak) UIImageView *vipViewOfCell;

//配图
@property (nonatomic, weak) UIImageView *pictureViewOfCell;

//昵称
@property (nonatomic, weak) UILabel *nameLabelOfCell;

//正文
@property (nonatomic, weak) UILabel *introLabelOfCell;

@end



@implementation WMWeiBoCell



+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *identifier = @"status";
    
    //1.使用重用机制
    WMWeiBoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
    //2.创建
        cell = [[WMWeiBoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    return  cell;
}


//构造方法，在初始化对象时会调用；在这个方法中添加需要显示的子控件
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //注意自定义的cell和系统cell一样，一创建出来就拥有一些子控件供我们使用
        
        //1、创建头像
        UIImageView *iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconViewOfCell = iconView;
        
        //2、创建昵称
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.font = WMNameFont;
        [self.contentView addSubview:nameLabel];
        self.nameLabelOfCell = nameLabel;
        
        //3、创建vip
        UIImageView *vipView = [[UIImageView alloc]init];
        vipView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipView];
        self.vipViewOfCell = vipView;
        
        //4、创建正文
        UILabel *introLabel = [[UILabel alloc]init];
        introLabel.font = WMTextFont;
        introLabel.numberOfLines = 0;
        [self.contentView addSubview:introLabel];
        self.introLabelOfCell = introLabel;
        
        //5、创建配图
        UIImageView *pictureView = [[UIImageView alloc]init];
        [self.contentView addSubview:pictureView];
        self.pictureViewOfCell = pictureView;
        
    }
    

    return self;
}

//重写属性weiBoFrame的设置方法
-(void)setWeiBoFrame:(WMWeiBoFrame *)weiBoFrame{

    _weiBoFrame = weiBoFrame;
    
    //给自定义cell中子控件设置数据
    [self settingData];
    
    //设置cell中子控件的frame
    [self settingFrame];

}



//设置子控件Cell的数据,使用weibo的模型中数据
-(void)settingData{

    NJWeibo *weiboInstance = self.weiBoFrame.weibo;
   
    //设置头像
    self.iconViewOfCell.image = [UIImage imageNamed:weiboInstance.icon];
    
    //设置昵称
    self.nameLabelOfCell.text = weiboInstance.name1;
    
    //设置vip
    if (weiboInstance.vip) {
        
        self.vipViewOfCell.hidden = NO;
        self.nameLabelOfCell.textColor = [UIColor redColor];
        
    }else{
        
        self.vipViewOfCell.hidden = YES;
        self.nameLabelOfCell.textColor = [UIColor blackColor];
    
    }
    
    //设置内容
    self.introLabelOfCell.text = weiboInstance.text;
    
    
    //设置配图
    
    
    if (weiboInstance.picture) {
        
        self.pictureViewOfCell.image = [UIImage imageNamed:weiboInstance.picture];
        self.pictureViewOfCell.backgroundColor = [UIColor redColor];
        self.pictureViewOfCell.hidden = NO;
        
    }else{
    
        self.pictureViewOfCell.hidden = YES;
    
    }

}


//设置cell的frame
-(void)settingFrame{

    //设置头像的frame
    self.iconViewOfCell.frame = self.weiBoFrame.iconF;
    
    //设置昵称的frame
    self.nameLabelOfCell.frame = self.weiBoFrame.nameF;
    
    //设置vipView的frame
    self.vipViewOfCell.frame = self.weiBoFrame.vipF;
    
    //设置内容introLabel的frame
    self.introLabelOfCell.frame = self.weiBoFrame.introF;
    
    //如果有配图,设置配图的pictureView的frame
    if (self.weiBoFrame.weibo.picture) {
        
        self.pictureViewOfCell.frame = self.weiBoFrame.pictireF;
    }

}




@end
