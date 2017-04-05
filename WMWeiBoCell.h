//
//  WMWeiBoCell.h
//  UITableViewCode
//
//  Created by 415 on 17/4/1.
//  Copyright © 2017年 415. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WMWeiBoFrame;

@interface WMWeiBoCell : UITableViewCell

//接受外界传入的模型
@property (nonatomic,strong) WMWeiBoFrame *weiBoFrame;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
