//
//  CartViewController.h
//  Project
//
//  Created by Possibility Solutions on 03/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MessageViewController.h"
#import "VisaCheakOutViewController.h"
#import "CustomOrderViewController.h"
#import "AddCustomViewController.h"

@class AppDelegate;
@interface CartViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    AppDelegate *delObj;
    UITableView *ShippingTbl;
    NSMutableArray *TopicArray;
    UIView* headerView;
    NSMutableArray *selectedArray;
    
}
@end
