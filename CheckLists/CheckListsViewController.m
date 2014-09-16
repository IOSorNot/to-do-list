//
//  CheckListsViewController.m
//  CheckLists
//
//  Created by SH205 on 14-9-16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "CheckListsViewController.h"
#import "CheckListsItem.h"

@interface CheckListsViewController ()

@end

@implementation CheckListsViewController{

    NSMutableArray *_items;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _items = [[NSMutableArray alloc]initWithCapacity:20];
    CheckListsItem *item;
    item = [[CheckListsItem alloc] init];
    
    item.text =@"观看嫦娥⻜飞天和⽟玉兔升空的视频";
    item.checked = NO;
    [_items addObject:item];
    item = [[CheckListsItem alloc]init];
    item.text =@"了解Sony a7和MBP的最新价格"; item.checked = NO;
    [_items addObject:item];
    item = [[CheckListsItem alloc]init]; item.text =@"复习苍⽼老师的经典视频教程"; item.checked = NO;
    [_items addObject:item];
    item = [[CheckListsItem alloc]init]; item.text =@"去电影院看地⼼心引⼒力"; item.checked = NO;
    [_items addObject:item];
    item = [[CheckListsItem alloc]init]; item.text =@"看⻄西甲巴萨新败的⽐比赛回放"; item.checked = NO;
    [_items addObject:item];	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    CheckListsItem * item = _items[indexPath.row];
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
    [self configureCheckmarkForCell:cell atIndexPath:indexPath]; return cell;}

-(void)configureCheckmarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    CheckListsItem *item = _items[indexPath.row];
    if(item.checked){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone; }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    CheckListsItem *item =_items[indexPath.row];
    item.checked = !item.checked;
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
