//
//  ViewController.m
//  UITableViewCode
//
//  Created by 415 on 17/4/1.
//  Copyright © 2017年 415. All rights reserved.
//

/*
 1、新建一个继承自UITableViewCell的类
 2、重写initWithStyle:reuseIdentifier:方法
      添加所有需要显示的子控件(不需设置子控件的数据和frame，子控件要添加到contentView中)
      进行子控件一次性的属性设置(有些属性只需要设置一次,比如字体\固定图片)
 3、提供两个模型
    数据模型:存放文字数据\图片数据
    frame模型:存放数据模型\所有子控件的frame\cell的高度
 4、cell拥有一个frame模型(不直接拥有数据)
 5、重写framen模型属性的setter方法，在这个方法中设置子控件的显示数据和frame
 6、frame模型数据的初始化已经采取懒加载的方式(每一个cell对应的frame模型数据只加载一次)
 */

#import "ViewController.h"
#import "UseWMWeiBoCellTVC.h"
#import "headerAndfooterTVC.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
 
    UIButton *weiBoBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 150, 150, 50)];
    weiBoBtn.backgroundColor = [UIColor lightGrayColor];
    [weiBoBtn setTitle:@"使用自定义Cell" forState:UIControlStateNormal];
    
    [weiBoBtn addTarget:self action:@selector(useCellTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weiBoBtn];
    
    
    
    UIButton *headerBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 220, 150, 50)];
    headerBtn.backgroundColor = [UIColor lightGrayColor];
    [headerBtn setTitle:@"使用header的Cell" forState:UIControlStateNormal];
    
    [headerBtn addTarget:self action:@selector(headerBtnTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headerBtn];
    
    
}


-(void)useCellTap{

    UseWMWeiBoCellTVC *wmView = [[UseWMWeiBoCellTVC alloc]init];
    [self.navigationController pushViewController:wmView animated:NO];
    
}


-(void)headerBtnTap{

    headerAndfooterTVC *headerView = [[headerAndfooterTVC alloc]init];
    [self.navigationController pushViewController:headerView animated:NO];

}



@end
