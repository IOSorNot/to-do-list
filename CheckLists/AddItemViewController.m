//
//  AddItemViewController.m
//  CheckLists
//
//  Created by SH205 on 14-9-18.
//  Copyright (c) 2014年 SH205. All rights reserved.
//

#import "AddItemViewController.h"


@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.itemToEdit !=nil) {//选中的对象不为nil那么就说明是编辑原来的记录；
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
        self.doneBarButton.enabled =YES;
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)cancel:(id)sender {
    [self.delegate addItemViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    if (self.itemToEdit == nil) {
        CheckListsItem *item =[[CheckListsItem alloc]init];
        item.text = self.textField.text;
        item.checked   = NO;
        [self.delegate addItemViewController:self didFinishAddingItem:item];
    }
    else {
        self.itemToEdit.text = self.textField.text;
        [self.delegate addItemViewController:self didFinishEditingItem:self.itemToEdit];
    
    }
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([newText length] > 0) {
        self.doneBarButton.enabled =YES;}
    else
        self.doneBarButton.enabled = NO;
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{//每次点击一个+号就会生产一个全新的controller 这时候需要为新生产的controller设置代理。好麻烦
    if([segue.identifier isEqualToString:@"AddItem"]){
        UINavigationController * navigationController = segue.destinationViewController;
        AddItemViewController * controller = (AddItemViewController *)navigationController.topViewController;
        controller.delegate = self;
    }
    
}


@end
