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
    item.text =@"了解Sony a7和MBP的最新价格";
    item.checked = NO;
    [_items addObject:item];
    item = [[CheckListsItem alloc]init];
    item.text =@"复习苍⽼老师的经典视频教程";
    item.checked = NO;
    [_items addObject:item];
    item = [[CheckListsItem alloc]init];
    item.text =@"去电影院看地⼼心引⼒";
    item.checked = NO;
    [_items addObject:item];
    item = [[CheckListsItem alloc]init];
    item.text =@"看⻄西甲巴萨新败的⽐比赛回放";
    item.checked = NO;
    [_items addObject:item];	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_items count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    CheckListsItem *item = _items[indexPath.row];
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    return cell;
}
-(void)configureCheckmarkForCell:(UITableViewCell *)cell withChecklistItem:(CheckListsItem *)item{
    UILabel *label =(UILabel *)[cell viewWithTag:1001];
    
    if (item.checked) {
        label.text =@"√";
    } else {
        label.text = @"";
    }

}
-(void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(CheckListsItem *)item{
    UILabel *label = (UILabel *)[cell viewWithTag:1000]; label.text = item.text;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath]; CheckListsItem *item = _items[indexPath.row];
    [item toggleChecked];
    [self configureCheckmarkForCell:cell withChecklistItem:item]; [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    [_items removeObjectAtIndex:indexPath.row];
    NSArray * indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic ];
    

}

-(void)addItemViewControllerDidCancel:(AddItemViewController *)controller{
    
    [self  dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(CheckListsItem *)item{
    NSInteger newRowIndex = [_items count ];
    [_items addObject:item];
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray * indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddItemViewController *controller = (AddItemViewController *)navigationController.topViewController;
        controller.delegate= self;
    }else if ([segue.identifier isEqualToString:@"EditItem"]){
        UINavigationController *navigationController = segue.destinationViewController;
        AddItemViewController *controller =(AddItemViewController *)navigationController.topViewController;
        controller.delegate=self;
        NSIndexPath * indexPath = [self.tableView indexPathForCell:sender];
        controller.itemToEdit=_items[indexPath.row];
    }

}

@end
