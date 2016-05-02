//
//  AddCustomViewController.m
//  Project
//
//  Created by Possibility Solutions on 28/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "AddCustomViewController.h"

@interface AddCustomViewController ()

@end

@implementation AddCustomViewController
@synthesize FinalDict,StrValue;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    CountryArray=[[[NSMutableArray alloc] init] mutableCopy];
    [CountryArray addObject:@"iNDIA"];
    [CountryArray addObject:@"austrila"];
    [CountryArray addObject:@"new york"];
    [CountryArray addObject:@"england"];
    [CountryArray addObject:@"japan"];
    [CountryArray addObject:@"shriLanka"];
    [CountryArray addObject:@"china"];
    [CountryArray addObject:@"bangladesh"];
    [CountryArray addObject:@"pakistan"];
    
    StateArray=[[[NSMutableArray alloc] init] mutableCopy];
    [StateArray addObject:@"himachal"];
    [StateArray addObject:@"chandigarh"];
    [StateArray addObject:@"mumbai"];
    [StateArray addObject:@"shrinazar"];
    [StateArray addObject:@"jammu"];
    [StateArray addObject:@"behair"];
    [StateArray addObject:@"channi"];
    [StateArray addObject:@"lekhnow"];
    [StateArray addObject:@"hariyana"];
    [StateArray addObject:@"goa"];
    [StateArray addObject:@"maharaster"];
    [StateArray addObject:@"delhi"];
    
    
    CityArray=[[[NSMutableArray alloc] init] mutableCopy];
    [CityArray addObject:@"bilaspur"];
    [CityArray addObject:@"una"];
    [CityArray addObject:@"kangra"];
    [CityArray addObject:@"lahouspatti"];
    [CityArray addObject:@"chamba"];
    [CityArray addObject:@"kullu"];
    [CityArray addObject:@"shimla"];
    [CityArray addObject:@"dharamshala"];
    [CityArray addObject:@"kinnor"];
    [CityArray addObject:@"mandi"];
    [CityArray addObject:@"hamirpur"];
    [CityArray addObject:@"sirmor"];
    
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 49, self.view.frame.size.width, self.view.frame.size.height)];

    ScrollView.contentSize = CGSizeMake(10,800);
    [ScrollView setBackgroundColor:[UIColor clearColor]];
    ScrollView.delegate = self;
    
    
    UIImageView *BgImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg@2x.png"]];
    BgImg.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [BgImg setBackgroundColor:[UIColor clearColor]];
    [ScrollView addSubview:BgImg];

    UILabel *Textlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,0, self.view.frame.size.width-20, 20)];
    Textlbl.backgroundColor=[UIColor clearColor];
    Textlbl.text=@"can't find what you are looking for ?  no problem just add the product from the stores website or complete the product details in the form below";
    Textlbl.numberOfLines=3;
    Textlbl.textAlignment=NSTextAlignmentLeft;
    Textlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:12];
    Textlbl.textColor=[UIColor colorWithRed:150.0/255.0 green:157.0/255.0 blue:159.0/255.0 alpha:1.0];
    [Textlbl sizeToFit];
    [ScrollView addSubview:Textlbl];

    
    UIImageView *Store_Img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
    Store_Img.frame=CGRectMake(0,50, self.view.frame.size.width, 77/2);
    [Store_Img setBackgroundColor:[UIColor greenColor]];
    [ScrollView addSubview:Store_Img];

    
    UILabel *StoreWebsitelbl=[[UILabel alloc] initWithFrame:CGRectMake(10,13.5, self.view.frame.size.width-20, 25)];
    StoreWebsitelbl.font = [UIFont fontWithName:@"Arial" size:12];
    StoreWebsitelbl.text=@"STORE WEBSITE";
    StoreWebsitelbl.textAlignment=NSTextAlignmentCenter;
    StoreWebsitelbl.textColor=[UIColor whiteColor];
    StoreWebsitelbl.numberOfLines = 1;
    [StoreWebsitelbl sizeToFit];
    [Store_Img addSubview:StoreWebsitelbl];

    StoreWebTxt=[[UITextField alloc] init];
    StoreWebTxt.frame=CGRectMake(10,95, self.view.frame.size.width-20, 25);
    StoreWebTxt.tag=9;
    StoreWebTxt.delegate=self;
    StoreWebTxt.borderStyle=UITextBorderStyleNone;
    StoreWebTxt.textAlignment=NSTextAlignmentLeft;
    StoreWebTxt.returnKeyType = UIReturnKeyNext;
    StoreWebTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [StoreWebTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    StoreWebTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    StoreWebTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    StoreWebTxt.placeholder=@"Add Product From Store Wabsite";
    [StoreWebTxt setBackgroundColor:[UIColor clearColor]];
    
    [ScrollView addSubview:StoreWebTxt];
    
    UIImageView *ArrowImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowBtn@2x.png"]];
    ArrowImg.frame=CGRectMake(self.view.frame.size.width-17,102.5, 13/2, 21/2);
    [ArrowImg setBackgroundColor:[UIColor clearColor]];
    [ScrollView addSubview:ArrowImg];

    
    UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
    FormaIcon.frame=CGRectMake(0,130, self.view.frame.size.width, 77/2);
    [FormaIcon setBackgroundColor:[UIColor greenColor]];
    [ScrollView addSubview:FormaIcon];
    
    UILabel *Websitelbl=[[UILabel alloc] initWithFrame:CGRectMake(10,13.5, self.view.frame.size.width-20, 25)];
    Websitelbl.font = [UIFont fontWithName:@"Arial" size:12];
    Websitelbl.text=@"FORM";
    Websitelbl.textAlignment=NSTextAlignmentCenter;
    Websitelbl.textColor=[UIColor whiteColor];
    Websitelbl.numberOfLines = 1;
    [Websitelbl sizeToFit];
    [FormaIcon addSubview:Websitelbl];
    
    StoreNameTxt=[[UITextField alloc] init];
    StoreNameTxt.frame=CGRectMake(10,185, self.view.frame.size.width-20, 25);
    StoreNameTxt.tag=1;
    StoreNameTxt.delegate=self;
    StoreNameTxt.borderStyle=UITextBorderStyleNone;
    StoreNameTxt.textAlignment=NSTextAlignmentLeft;
    StoreNameTxt.returnKeyType = UIReturnKeyNext;
    StoreNameTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [StoreNameTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    StoreNameTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    StoreNameTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    StoreNameTxt.placeholder=@"Store Name";
    [StoreNameTxt setBackgroundColor:[UIColor clearColor]];
    [ScrollView addSubview:StoreNameTxt];
    
    UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg.frame=CGRectMake(10,212, self.view.frame.size.width, 2/2);
    [ScrollView addSubview:LineImg];
    
    
    
    WebsiteTxt=[[UITextField alloc] init];
    WebsiteTxt.frame=CGRectMake(10,215, self.view.frame.size.width-20, 25);
    WebsiteTxt.tag=2;
    WebsiteTxt.delegate=self;
    WebsiteTxt.borderStyle=UITextBorderStyleNone;
    WebsiteTxt.textAlignment=NSTextAlignmentLeft;
    WebsiteTxt.returnKeyType = UIReturnKeyNext;
    WebsiteTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [WebsiteTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    WebsiteTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    WebsiteTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    WebsiteTxt.placeholder=@"Store Website";
    [WebsiteTxt setBackgroundColor:[UIColor clearColor]];
    
    [ScrollView addSubview:WebsiteTxt];
    
    
    UIImageView *LineImg3=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg3.frame=CGRectMake(10,242, self.view.frame.size.width, 2/2);
    [ScrollView addSubview:LineImg3];
    
    
    ProductNameTxt=[[UITextField alloc] init];
    ProductNameTxt.frame=CGRectMake(10,245, self.view.frame.size.width-20, 25);
    ProductNameTxt.tag=3;
    ProductNameTxt.delegate=self;
    ProductNameTxt.borderStyle=UITextBorderStyleNone;
    ProductNameTxt.textAlignment=NSTextAlignmentLeft;
    ProductNameTxt.returnKeyType = UIReturnKeyNext;
    ProductNameTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [ProductNameTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    ProductNameTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    ProductNameTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    ProductNameTxt.placeholder=@"Product Name";
    [ProductNameTxt setBackgroundColor:[UIColor clearColor]];
    
    [ScrollView addSubview:ProductNameTxt];
    
    UIImageView *LineImg8=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg8.frame=CGRectMake(10,272, self.view.frame.size.width, 2/2);
    [ScrollView addSubview:LineImg8];
    
    ProductTxt=[[UITextField alloc] init];
    ProductTxt.frame=CGRectMake(10,275, self.view.frame.size.width-20, 25);
    ProductTxt.tag=4;
    ProductTxt.delegate=self;
    ProductTxt.borderStyle=UITextBorderStyleNone;
    ProductTxt.textAlignment=NSTextAlignmentLeft;
    ProductTxt.returnKeyType = UIReturnKeyNext;
    ProductTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [ProductTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    ProductTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    ProductTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    ProductTxt.placeholder=@"Product sku (optional)";
    [ProductTxt setBackgroundColor:[UIColor clearColor]];
    
    [ScrollView addSubview:ProductTxt];
    
    UIImageView *LineImg9=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg9.frame=CGRectMake(10,302, self.view.frame.size.width, 2/2);
    [ScrollView addSubview:LineImg9];
    
    
    ColourTxt=[[UITextField alloc] init];
    ColourTxt.frame=CGRectMake(10,305, self.view.frame.size.width-20, 25);
    ColourTxt.tag=5;
    ColourTxt.delegate=self;
    ColourTxt.borderStyle=UITextBorderStyleNone;
    ColourTxt.textAlignment=NSTextAlignmentLeft;
    ColourTxt.returnKeyType = UIReturnKeyNext;
    ColourTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [ColourTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    ColourTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    ColourTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    ColourTxt.placeholder=@"Colour perference (if applicable)";
    [ColourTxt setBackgroundColor:[UIColor clearColor]];
    
    [ScrollView addSubview:ColourTxt];
    
    ColourButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    ColourButton.frame=CGRectMake(self.view.frame.size.width-20.5,305, 21/2, 13/2);
    [ColourButton setBackgroundColor:[UIColor redColor]];
    UIImage *Image = [UIImage imageNamed:@"arrow_down@2x.png"];
    [ColourButton setBackgroundImage:Image forState:UIControlStateNormal];
    ColourButton.titleLabel.textAlignment=NSTextAlignmentLeft;
    [ColourButton addTarget:self action:@selector(ColourButton) forControlEvents:UIControlEventTouchUpInside];
    [ScrollView addSubview:ColourButton];
    
    
    
    
    
    UIImageView *LineImg4=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg4.frame=CGRectMake(10,332, self.view.frame.size.width, 2/2);
    [ScrollView addSubview:LineImg4];
    
    
    SizeTxt=[[UITextField alloc] init];
    SizeTxt.frame=CGRectMake(10,335, self.view.frame.size.width-20, 25);
    SizeTxt.tag=6;
    SizeTxt.delegate=self;
    SizeTxt.borderStyle=UITextBorderStyleNone;
    SizeTxt.textAlignment=NSTextAlignmentLeft;
    SizeTxt.returnKeyType = UIReturnKeyNext;
    SizeTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [SizeTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    SizeTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    SizeTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    SizeTxt.placeholder=@"Size (if applicable)";
    [SizeTxt setBackgroundColor:[UIColor clearColor]];
    
    
    [ScrollView addSubview:SizeTxt];
    
    SizeButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    SizeButton.frame=CGRectMake(self.view.frame.size.width-20.5,335, 21/2, 13/2);
    [SizeButton setBackgroundColor:[UIColor redColor]];
    UIImage *regImage = [UIImage imageNamed:@"arrow_down@2x.png"];
    [SizeButton setBackgroundImage:regImage forState:UIControlStateNormal];
    SizeButton.titleLabel.textAlignment=NSTextAlignmentLeft;
    [SizeButton addTarget:self action:@selector(SizeButton) forControlEvents:UIControlEventTouchUpInside];
    [ScrollView addSubview:SizeButton];
    
    UIImageView *LineImg5=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg5.frame=CGRectMake(10,362, self.view.frame.size.width, 2/2);
    [ScrollView addSubview:LineImg5];
    
    
    PriceTxt=[[UITextField alloc] init];
    PriceTxt.frame=CGRectMake(10,365, self.view.frame.size.width-20, 25);
    PriceTxt.tag=7;
    PriceTxt.delegate=self;
    PriceTxt.borderStyle=UITextBorderStyleNone;
    PriceTxt.textAlignment=NSTextAlignmentLeft;
    PriceTxt.returnKeyType = UIReturnKeyNext;
    PriceTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [PriceTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    PriceTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    PriceTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    PriceTxt.placeholder=@"Price (potional)";
    [PriceTxt setBackgroundColor:[UIColor clearColor]];
    
    [ScrollView addSubview:PriceTxt];
    
    PriceButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    PriceButton.frame=CGRectMake(self.view.frame.size.width-20.5,365, 21/2, 13/2);
    [PriceButton setBackgroundColor:[UIColor redColor]];
    UIImage *arrowImage = [UIImage imageNamed:@"arrow_down@2x.png"];
    [PriceButton setBackgroundImage:arrowImage forState:UIControlStateNormal];
    PriceButton.titleLabel.textAlignment=NSTextAlignmentLeft;
    [PriceButton addTarget:self action:@selector(PriceButton) forControlEvents:UIControlEventTouchUpInside];
    [ScrollView addSubview:PriceButton];
    
    
    UIImageView *LineImg6=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg6.frame=CGRectMake(10,392, self.view.frame.size.width, 2/2);
    [ScrollView addSubview:LineImg6];
    
    
    CodeTxt=[[UITextField alloc] init];
    CodeTxt.frame=CGRectMake(10,395, self.view.frame.size.width-20, 25);
    CodeTxt.tag=8;
    CodeTxt.delegate=self;
    CodeTxt.borderStyle=UITextBorderStyleNone;
    CodeTxt.textAlignment=NSTextAlignmentLeft;
    CodeTxt.returnKeyType = UIReturnKeyNext;
    CodeTxt.keyboardType=UIKeyboardTypeEmailAddress;
    [CodeTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    CodeTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:13];
    CodeTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
    CodeTxt.placeholder=@"Special instructions";
    [CodeTxt setBackgroundColor:[UIColor clearColor]];
    
    [ScrollView addSubview:CodeTxt];
    
    
    UIImageView *LineImg7=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
    LineImg7.frame=CGRectMake(10,422, self.view.frame.size.width, 2/2);
    [ScrollView addSubview:LineImg7];
    
    
    UIImageView *AddToCart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddCard@2x.png"]];
    AddToCart.frame=CGRectMake(10,460, self.view.frame.size.width-20, 86/2);
    AddToCart.userInteractionEnabled=YES;
    
    UIButton *SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    SubmitBtn.frame=CGRectMake(10,0, AddToCart.frame.size.width-20, 86/2);
    [SubmitBtn setBackgroundColor:[UIColor clearColor]];
    [SubmitBtn setTitle:@"Add To Cart" forState:UIControlStateNormal];
    [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [SubmitBtn addTarget:self action:@selector(AddToCartBtn) forControlEvents:UIControlEventTouchUpInside];
    [AddToCart addSubview:SubmitBtn];
    
    [ScrollView addSubview:AddToCart];
     
     [self.view addSubview:ScrollView];

    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    UIView *customView1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    customView1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_bar_bg@2x.png"]];
    
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.adjustsImageWhenHighlighted=NO;
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"BackBtn@2x.png"] forState:UIControlStateNormal];
    leftBtn.frame=CGRectMake(10, 30, 24/2, 40/2);
    [leftBtn addTarget:self action:@selector(leftSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:leftBtn];
    
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 20)];
    reallbl.text=@"ADD CUSTOM ORDER";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [self.view addSubview:customView1];
    
    
    
}
-(void)ColourButton{
    
    StrValue=@"0";
    
    
    [self PickerCancelPressed:nil];
    
    
    toolbarFrame = CGRectMake(0 , 0 , self.view.frame.size.width , 44 ) ;
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:toolbarFrame];
    toolbar.barTintColor=[UIColor whiteColor];
    
    UIBarButtonItem *toolbarItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(PickerDonePressed:)] ;
    [toolbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    UIBarButtonItem *toolbarItemCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(PickerCancelPressed:)] ;
    
    [toolbarItemCancel setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    
    
    UIBarButtonItem *flexibleWidth = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray * array1=[[NSArray alloc] initWithObjects:toolbarItemCancel, flexibleWidth , toolbarItem, nil] ;
    toolbar.items =array1;
    pickerFrame = CGRectMake(0 , 40 , self.view.frame.size.width , 200 ) ;
    picker = [[UIPickerView alloc] initWithFrame:pickerFrame] ;
    picker.delegate = self;
    picker.backgroundColor=[UIColor whiteColor];
    picker.showsSelectionIndicator = YES;
    
    
    frame = CGRectMake(0 , self.view.frame.size.height-300 , self.view.frame.size.width , 300 );
    
    
    
    subView = [[UIView alloc] initWithFrame:frame];
    subView.backgroundColor = [UIColor redColor];
    [subView addSubview:toolbar];
    [subView addSubview:picker];
    
    subView.hidden = NO;
    
    
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482);
    
    
    
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 10 )  ;
    [UIView commitAnimations];
    [self.view addSubview:subView];
}

-(void)SizeButton{
    StrValue=@"1";
    
    
    [self PickerCancelPressed:nil];
    
    
    toolbarFrame = CGRectMake(0 , 0 , self.view.frame.size.width , 44 ) ;
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:toolbarFrame];
    toolbar.barTintColor=[UIColor whiteColor];
    
    UIBarButtonItem *toolbarItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(PickerDonePressed:)] ;
    [toolbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    UIBarButtonItem *toolbarItemCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(PickerCancelPressed:)] ;
    
    [toolbarItemCancel setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    
    
    UIBarButtonItem *flexibleWidth = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray * array1=[[NSArray alloc] initWithObjects:toolbarItemCancel, flexibleWidth , toolbarItem, nil] ;
    toolbar.items =array1;
    pickerFrame = CGRectMake(0 , 40 , self.view.frame.size.width , 200 ) ;
    picker = [[UIPickerView alloc] initWithFrame:pickerFrame] ;
    picker.delegate = self;
    picker.backgroundColor=[UIColor whiteColor];
    picker.showsSelectionIndicator = YES;
    
    
    frame = CGRectMake(0 , self.view.frame.size.height-300 , self.view.frame.size.width , 300 );
    
    
    
    subView = [[UIView alloc] initWithFrame:frame];
    subView.backgroundColor = [UIColor redColor];
    [subView addSubview:toolbar];
    [subView addSubview:picker];
    
    subView.hidden = NO;
    
    
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482);
    
    
    
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 10 )  ;
    [UIView commitAnimations];
    [self.view addSubview:subView];
}

-(void)PriceButton{
    StrValue=@"2";
    
    
    [self PickerCancelPressed:nil];
    
    
    toolbarFrame = CGRectMake(0 , 0 , self.view.frame.size.width , 44 ) ;
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:toolbarFrame];
    toolbar.barTintColor=[UIColor whiteColor];
    
    UIBarButtonItem *toolbarItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(PickerDonePressed:)] ;
    [toolbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    UIBarButtonItem *toolbarItemCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(PickerCancelPressed:)] ;
    
    [toolbarItemCancel setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    
    
    UIBarButtonItem *flexibleWidth = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray * array1=[[NSArray alloc] initWithObjects:toolbarItemCancel, flexibleWidth , toolbarItem, nil] ;
    toolbar.items =array1;
    pickerFrame = CGRectMake(0 , 40 , self.view.frame.size.width , 200 ) ;
    picker = [[UIPickerView alloc] initWithFrame:pickerFrame] ;
    picker.delegate = self;
    picker.backgroundColor=[UIColor whiteColor];
    picker.showsSelectionIndicator = YES;
    
    
    frame = CGRectMake(0 , self.view.frame.size.height-300 , self.view.frame.size.width , 300 );
    
    
    
    subView = [[UIView alloc] initWithFrame:frame];
    subView.backgroundColor = [UIColor redColor];
    [subView addSubview:toolbar];
    [subView addSubview:picker];
    
    subView.hidden = NO;
    
    
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482);
    
    
    
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 10 )  ;
    [UIView commitAnimations];
    [self.view addSubview:subView];
}
-(void)PickerDonePressed:(UIBarButtonItem*)button
{
    Count=NO;
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 10 );
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482 );
    [UIView commitAnimations];
    
    
    
    
    NSInteger row = [picker selectedRowInComponent:0];
    if ([StrValue isEqualToString:@"0"]) {
        
        
        ColourTxt.text=[CountryArray objectAtIndex:row];
        
    }
    else if ([StrValue isEqualToString:@"1"]){
        
        SizeTxt.text=[StateArray objectAtIndex:row];
    }
    else{
        
        PriceTxt.text=[CityArray objectAtIndex:row];
        
    }
}

-(void)PickerCancelPressed:(UIBarButtonItem*)button
{
    Count=NO;
    
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 10 );
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView setAnimationDelegate:self];
    subView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0 , 482 );
    [UIView commitAnimations];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if ([StrValue isEqualToString:@"0"]) {
        
        return [CountryArray count];
    }
    else if ([StrValue isEqualToString:@"1"]){
        
        return [StateArray count];
    }
    else{
        
        return [CityArray count];
        
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([StrValue isEqualToString:@"0"]) {
        
        NSString *valCountry = ColourTxt.text=[CountryArray objectAtIndex:row];
        
        return valCountry;
    }
    else if ([StrValue isEqualToString:@"1"]){
        
        NSString *valState = SizeTxt.text=[StateArray objectAtIndex:row];
        
        return valState;
        
    }
    else{
        NSString *valCity = PriceTxt.text=[CityArray objectAtIndex:row];
        
        return valCity;
        
    }
    
}
#pragma mark TextFieldDidBeginEditing
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
}

#pragma mark TextFieldDidEndEditing
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
}
#pragma mark AnimatTextFieldView
-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    
    if (self.view.frame.size.height==568) {
        int movementDistance=0 ;
        float movementDuration=0.0;
        if (textField.tag==9){
            movementDistance = -30;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
            
        }
        int movement = (up ? movementDistance : -movementDistance);
        [UIView beginAnimations: @"animateTextField" context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
    }
    else if (self.view.frame.size.height==480) {
        int movementDistance=0;
        float movementDuration=0.0;
        if (textField.tag==4){
            movementDistance = -80;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        else if(textField.tag==5){
            movementDistance = -130;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        else if(textField.tag==6){
            movementDistance = -150;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        else if(textField.tag==7){
            movementDistance = -160;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        else if(textField.tag==8){
            movementDistance = -220;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        
        int movement = (up ? movementDistance : -movementDistance);
        [UIView beginAnimations: @"animateTextField" context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
    }
    else{
        int movementDistance=0;
        float movementDuration=0.0;
        if (textField.tag==8){
            movementDistance = -50;      // tweak as needed
            movementDuration = 0.3f;     // tweak as needed
        }
        
        
        int movement = (up ? movementDistance : -movementDistance);
        [UIView beginAnimations: @"animateTextField" context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
    }
    
    
}
#pragma mark TextFieldShouldReturn
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if (textField==StoreNameTxt) {
        
        [WebsiteTxt becomeFirstResponder];
    }
    else if (textField==WebsiteTxt) {
        
        [ProductNameTxt becomeFirstResponder];
    }
    else if (textField==ProductNameTxt) {
        
        [ProductTxt becomeFirstResponder];
    }
    else if (textField==ProductTxt) {
        
        [ColourTxt becomeFirstResponder];
        
    } else if (textField==ColourTxt) {
        
        [SizeTxt becomeFirstResponder];
    }
    else if (textField==SizeTxt) {
        
        [PriceTxt becomeFirstResponder];
        
    } else if (textField==PriceTxt) {
        
        [CodeTxt becomeFirstResponder];
    }
    else{
        [textField resignFirstResponder];
        
    }
    
    
    
    return YES;
}


-(BOOL)loginValidation{
    
    
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    
    
    if(StoreNameTxt.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Store Name"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    if(WebsiteTxt.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Website Name"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    
    if(ProductNameTxt.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Product Name"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
    if (ProductTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please enter your Product (optional)" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if (ColourTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please Select your Colour" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if (SizeTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please Select your Size" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if (PriceTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please Select your Price" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    if (CodeTxt.text.length<1)
    {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Message"message:@ "Please enter your Special Instructions" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alertview.backgroundColor=[UIColor lightGrayColor];
        [alertview show];
        return NO;
        
    }
    
    return YES;
}
-(void)AddToCartBtn{
    
    
    
    if ([self loginValidation]) {
        
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Checkout" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"Checkout" object:nil];
        NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        [delObj PostWebServer:dict type:@"Checkout"];
        
        PaymentViewController *Payment=[[PaymentViewController alloc]init];
        [self.navigationController pushViewController:Payment animated:YES];
    }
    else{
        
        
    }
}

-(void)WebCategoryResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    
    
}

-(void)leftSlider{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
