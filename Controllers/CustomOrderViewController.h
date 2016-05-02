//
//  CustomOrderViewController.h
//  Project
//
//  Created by Possibility Solutions on 28/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@class AppDelegate;
@interface CustomOrderViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    AppDelegate *delObj;
    UITableView *CustomTbl;
    NSMutableArray *CustomArray;
    UIView* headerView;
    UIView *mainView;
    NSMutableArray *selectedArray;
    
    
    UITextField *FirstNameTxt,*CreditCardNoTxt,*YearTxt,*CountryTxt,*StateTxt,*LastNameTxt,*CityTxt,*CodeTxt,*AddLineTxt,*AddLine2Txt,*TelephoneTxt;
    
    
    
    CGRect pickerFrame;
    CGRect toolbarFrame ;
    CGRect frame;
    UIView *subView;
    BOOL Count;
    UIPickerView *picker;
    UIDatePicker *datePicker;
    NSMutableArray *CountryArray;
    NSMutableArray *StateArray;
    NSMutableArray *CityArray;
    
    NSString *StrValue;
    
    UIButton *CountryBtn;
    UIButton *StateBtn;
    UIButton *CityBtn;
    
    
    UIButton *AddToCartBtn;

}
@property (strong, nonatomic)  NSString *StrValue;

@end
