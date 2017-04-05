//
//  headerAndfooterTVC.m
//  UITableViewCode
//
//  Created by 415 on 17/4/1.
//  Copyright © 2017年 415. All rights reserved.
//

#import "headerAndfooterTVC.h"
#import "WMContact.h"
#import "WMContactGroup.h"

@interface headerAndfooterTVC ()<UITableViewDelegate>
{
    NSMutableArray *_contacts;//联系人模型
    NSIndexPath *_selectedIndexPath;//当前选中的组和行
}
@end

@implementation headerAndfooterTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
   //加载数据
    [self initData];
    
    
    
}


#pragma mark 加载数据
-(void)initData{

    _contacts = [[NSMutableArray alloc]init];
    
    
    WMContact *contact1=[WMContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    WMContact *contact2=[WMContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    WMContact *contact11=[WMContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    WMContact *contact21=[WMContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    WMContact *contact12=[WMContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    WMContact *contact22=[WMContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    WMContact *contact13=[WMContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    WMContact *contact23=[WMContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    
    WMContactGroup *group1  = [WMContactGroup initWithNameOfGroup:@"Cui" andDetailOfGroup:@"with Cui in the  name " andContacts:[NSMutableArray arrayWithObjects:contact1,contact2,contact11,contact21,contact12,contact22,contact13,contact23,nil]];
    [_contacts addObject:group1];

    
    WMContact *contact3=[WMContact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    WMContact *contact4=[WMContact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    WMContact *contact5=[WMContact initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];

    WMContactGroup *group2  = [WMContactGroup initWithNameOfGroup:@"lee" andDetailOfGroup:@"with Lee in the name" andContacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5,nil]];
    [_contacts addObject:group2];
    
    
    WMContact *contact6=[WMContact initWithFirstName:@"Sun" andLastName:@"Kaoru" andPhoneNumber:@"18500131235"];
    WMContact *contact7=[WMContact initWithFirstName:@"Sun" andLastName:@"Rosa" andPhoneNumber:@"18500131236"];
    WMContact *contact66=[WMContact initWithFirstName:@"Sun" andLastName:@"Ka" andPhoneNumber:@"18500131235"];
    WMContact *contact77=[WMContact initWithFirstName:@"Sun" andLastName:@"Ros" andPhoneNumber:@"18500131236"];
    
    WMContactGroup *group3  = [WMContactGroup initWithNameOfGroup:@"Sun" andDetailOfGroup:@"with Sun in the name " andContacts:[NSMutableArray arrayWithObjects:contact6,contact7,contact66,contact77,nil]];
    [_contacts addObject:group3];
    
    WMContact *contact56=[WMContact initWithFirstName:@"Pi" andLastName:@"Paoru" andPhoneNumber:@"18500131235"];
    WMContact *contact57=[WMContact initWithFirstName:@"Pi" andLastName:@"Posa" andPhoneNumber:@"18500131236"];
    WMContact *contact58=[WMContact initWithFirstName:@"Pi" andLastName:@"Pa" andPhoneNumber:@"18500131235"];
    WMContact *contact59=[WMContact initWithFirstName:@"Pi" andLastName:@"Pos" andPhoneNumber:@"18500131236"];
    
    WMContactGroup *group4  = [WMContactGroup initWithNameOfGroup:@"Pi" andDetailOfGroup:@"with Pi in the name " andContacts:[NSMutableArray arrayWithObjects:contact56,contact57,contact58,contact59,nil]];
    [_contacts addObject:group4];
    
 
    

}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _contacts.count;//组数
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //组中的contacts属性中存放着有多少个联系人
    WMContactGroup *group = _contacts[section];
    return group.contacts.count;
    
}




//每组的header及其高度
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    WMContactGroup *group = _contacts[section];
    
    return group.nameOfGroup;

}



//每组的footer，尾部说明；及其高度
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{

    WMContactGroup *group = _contacts[section];
    return group.detailOfGroup;

}




//返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //使用cell的重用机制
    static NSString *cellIndentifier = @"cellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    
    WMContactGroup *group = _contacts[indexPath.section];
    WMContact *contact = group.contacts[indexPath.row];

    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;

    return cell;
}

//返回索引数组
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
   
    NSMutableArray *indexs=[[NSMutableArray alloc]init];
    for(WMContactGroup *group in _contacts){
        
        NSString *str = [group.nameOfGroup substringToIndex:1];
        [indexs addObject:str];
    }
    return indexs;
}


//响应点击的索引
-(NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    NSLog(@"title=%@,index=%ld",title,(long)index);
    return 0;

}



#pragma mark  UITableViewDelegate
//每行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 60;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 100;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"baergaergawrgf");
    
    _selectedIndexPath = indexPath;
    WMContactGroup *group = _contacts[indexPath.section];
    WMContact *contact = group.contacts[indexPath.row];
    
    NSString *strName = [contact getName];
    NSString *strPhon = contact.phoneNumber;
    
    NSString *msg = [NSString stringWithFormat:@"您选择了%@,电话号码是%@",strName,strPhon];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:msg  preferredStyle:UIAlertControllerStyleAlert];

    
    UIAlertAction *actionSure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:actionSure];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:actionCancel];

    [self presentViewController:alertController animated:NO completion:nil];
}


@end
