//
//  OrderDetailsViewController.h
//  Project
//
//  Created by Possibility Solutions on 29/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "OrderDetailsViewController.h"
#import "AppDelegate.h"
@class AppDelegate;
@interface OrderDetailsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UISearchBarDelegate, UISearchControllerDelegate>
{
    AppDelegate *delObj;
    UITableView *OrderDetailsTbl;
    NSMutableDictionary *FinalDict;
    
    
    
    UITextField *emailTextfield;
    
    
    
    // Shipping Method screen
    
    
    // Select Shipping method
    
    //  Instant shipping
    //  Same day shipping
    //   Standard Shipping
    //   Express Shipping
    
    
    UIView *headerView;
    
    NSMutableArray *contentList;
    NSMutableArray *filteredContentList;
    BOOL isSearching;
    
    NSMutableArray *TopicArray;
    UISearchBar *searchBar;
    
    
}
@end
