//
//  AddItemViewController.h
//  CheckLists
//
//  Created by SH205 on 14-9-18.
//  Copyright (c) 2014年 SH205. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckListsItem.h"
#import "CheckListsViewController.h"
@class AddItemViewController;
@class CheckListsItem;

@protocol AddItemViewControllerDelegate <NSObject>

-(void)addItemViewControllerDidCancel:(AddItemViewController*)controller;
-(void)addItemViewController:(AddItemViewController*)controller didFinishAddingItem:(CheckListsItem*)item;
-(void)addItemViewController:(AddItemViewController *)controller didFinishEditingItem:(CheckListsItem *)item;


@end


@interface AddItemViewController : UITableViewController<UITextFieldDelegate>
- (IBAction)cancel:(id)sender;

- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic,weak) id <AddItemViewControllerDelegate> delegate;

@property (nonatomic,strong) CheckListsItem * itemToEdit;

@end
