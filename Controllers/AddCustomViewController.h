//
//  AddCustomViewController.h
//  Project
//
//  Created by Possibility Solutions on 28/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "PaymentViewController.h"
#import "AppDelegate.h"
@class AppDelegate;
@interface AddCustomViewController : UIViewController <UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIScrollViewDelegate>
{
    AppDelegate *delObj;
    UIView *mainView;
    NSMutableDictionary *FinalDict;
    
    UITextField *StoreWebTxt,*StoreNameTxt,*ColourTxt,*SizeTxt,*WebsiteTxt,*PriceTxt,*CodeTxt,*ProductNameTxt,*ProductTxt;
    
    UIScrollView *ScrollView;
    
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
    
    UIButton *ColourButton;
    UIButton *SizeButton;
    UIButton *PriceButton;
    
    
    UIButton *AddToCartBtn;
    
    
}
@property (strong, nonatomic) NSMutableDictionary *FinalDict;
@property (strong, nonatomic)  NSString *StrValue;


@end
