//
//  UseWMWeiBoCellTVC.m
//  UITableViewCode
//
//  Created by 415 on 17/4/1.
//  Copyright © 2017年 415. All rights reserved.
//

#import "UseWMWeiBoCellTVC.h"
#import "NJWeibo.h"
#import "WMWeiBoFrame.h"
#import "WMWeiBoCell.h"

@interface UseWMWeiBoCellTVC ()
@property (nonatomic, strong) NSArray *statusFrames;
@end

@implementation UseWMWeiBoCellTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self statusFrames];
    
}

#pragma mark ---懒加载
-(NSArray *)statusFrames{

    if (_statusFrames == nil) {
        
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dicArr = [NSArray arrayWithContentsOfFile:fullPath];
       
        NSMutableArray *modelArr = [NSMutableArray arrayWithCapacity:dicArr.count];
        
        for (NSDictionary *dic in dicArr) {
            
            NJWeibo *weiboModel = [NJWeibo weiboWithDict:dic];
            
            //根据模型数据创建frame模型
            WMWeiBoFrame *weiboFrame = [[WMWeiBoFrame alloc]init];
            weiboFrame.weibo = weiboModel;
            
            [modelArr addObject:weiboFrame];
        }
        self.statusFrames = [modelArr copy];
        
    }


    return  _statusFrames;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.statusFrames.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WMWeiBoCell *cell = [WMWeiBoCell cellWithTableView:tableView];
    //3.设置数据
    cell.weiBoFrame = self.statusFrames[indexPath.row];
    
    //4.返回cell
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    //自定义的cell的frame返回每个cell的高度
    WMWeiBoFrame *wbF = self.statusFrames[indexPath.row];
    NSLog(@"heightForRowAtIndexPath-cell高度＝%f",wbF.cellHeight);
    
    return wbF.cellHeight;
}



@end
