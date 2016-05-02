//
//  ShippingMethodViewController.h
//  Project
//
//  Created by Possibility Solutions on 27/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@class AppDelegate;
@interface ShippingMethodViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    AppDelegate *delObj;
    UITableView *ShippingTbl;
    NSMutableArray *TopicArray;
    
    NSMutableArray *selectedArray;
       
}
@end
