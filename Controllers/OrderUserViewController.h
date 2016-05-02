//
//  OrderUserViewController.h
//  Project
//
//  Created by Possibility Solutions on 25/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "PaymentViewController.h"
#import "ShippingMethodViewController.h"
#import "CartViewController.h"
#import "AppDelegate.h"
@class AppDelegate;
@interface OrderUserViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    AppDelegate *delObj;
    UITableView *ProductDetailTbl;
    NSMutableDictionary *FinalDict;
    
    
    
    UITextField *emailTextfield;
    
    
    
    // Shipping Method screen
     
     
    // Select Shipping method
     
   //  Instant shipping
   //  Same day shipping
  //   Standard Shipping
  //   Express Shipping
    
}
@end
