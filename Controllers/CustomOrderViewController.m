//
//  CustomOrderViewController.m
//  Project
//
//  Created by Possibility Solutions on 28/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "CustomOrderViewController.h"

@interface CustomOrderViewController ()

@end

@implementation CustomOrderViewController
@synthesize StrValue;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
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
    
    UIButton *plusBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    plusBtn.adjustsImageWhenHighlighted=NO;
    [plusBtn setTitle:@"EDIT" forState:UIControlStateNormal];
    plusBtn.frame=CGRectMake(self.view.frame.size.width-60, 30, 60, 31);
    [plusBtn addTarget:self action:@selector(DoneSlider) forControlEvents:UIControlEventTouchUpInside];
    [customView1 addSubview:plusBtn];
    
    
    
    UILabel *reallbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 20)];
    reallbl.text=@"ADD CUSTOM ORDER";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [self.view addSubview:customView1];
    
    
    CustomTbl=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    CustomTbl.showsVerticalScrollIndicator=YES;
    CustomTbl.showsHorizontalScrollIndicator=NO;
    CustomTbl.showsVerticalScrollIndicator=NO;
    CustomTbl.dataSource=self;
    CustomTbl.delegate=self;
    [self.view addSubview:CustomTbl];
    
    
}

-(void)buttonPressed{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [delObj PostWebServer:dict type:@""];
    
    
}

-(void)WebCategoryResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    
    CustomTbl.dataSource=self;
    CustomTbl.delegate=self;
    [CustomTbl reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    if (section==0) {
        
        return 1;
    }
    else if (section==1){
         return 1;
    }
    else{
        
        return 12;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
        return 100;
    }
    else if (indexPath.section==1){
        
        return 100;
        
    }
    else{
        return 500;
    }
    return 0;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        
    
    }
    else if (section==1) {
        
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        headerView.backgroundColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
        headerView.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:1.0].CGColor;
        headerView.layer.borderWidth = 1.0;
        
        UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        FormaIcon.frame=CGRectMake(0,0, self.view.frame.size.width, 77/2);
        [FormaIcon setBackgroundColor:[UIColor clearColor]];
        UILabel* headerLabel = [[UILabel alloc] init];
        headerLabel.frame = CGRectMake(5, 10, tableView.frame.size.width - 5, 30);
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:16.0];
        headerLabel.text = @"SELECT PAYMENT MATHOD";
        headerLabel.textAlignment = NSTextAlignmentLeft;
        
        
        [headerView addSubview:FormaIcon];
        [headerView addSubview:headerLabel];
        
        return headerView;
        
    }

   else{
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        headerView.backgroundColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
        headerView.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:1.0].CGColor;
        headerView.layer.borderWidth = 1.0;
        
        UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        FormaIcon.frame=CGRectMake(0,0, self.view.frame.size.width, 77/2);
        [FormaIcon setBackgroundColor:[UIColor clearColor]];
        UILabel* headerLabel = [[UILabel alloc] init];
        headerLabel.frame = CGRectMake(5, 10, tableView.frame.size.width - 5, 30);
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:16.0];
        headerLabel.text = @"ADD PAYMENT MATHOD";
        headerLabel.textAlignment = NSTextAlignmentLeft;
        
        
        [headerView addSubview:FormaIcon];
        [headerView addSubview:headerLabel];
        
        return headerView;
    }
    return headerView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
    }
  

    if (indexPath.section==0) {
        
        UIImageView *BgImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg@2x.png"]];
        BgImg.frame=CGRectMake(0, 0, self.view.frame.size.width, 30);
        [BgImg setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:BgImg];
        
    }
    
    else if (indexPath.section==1) {
        
    }
    else{
        mainView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.view addSubview:mainView];
        mainView.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:243.0/255.0 alpha:1.0];
        [self.view bringSubviewToFront:mainView];
        
        UIImageView *BgImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg@2x.png"]];
        BgImg.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [BgImg setBackgroundColor:[UIColor clearColor]];
        [mainView addSubview:BgImg];
        
        
        
        
        UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        FormaIcon.frame=CGRectMake((self.view.frame.size.width-320)/2,64, 640/2, 77/2);
        [FormaIcon setBackgroundColor:[UIColor greenColor]];
        [mainView addSubview:FormaIcon];
        
        UILabel *Websitelbl=[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,10, 100, 35)];
        Websitelbl.font = [UIFont fontWithName:@"Arial" size:13];
        Websitelbl.text=@"SHIPPING ADDRESS";
        Websitelbl.textAlignment=NSTextAlignmentCenter;
        Websitelbl.textColor=[UIColor whiteColor];
        Websitelbl.numberOfLines = 1;
        [Websitelbl sizeToFit];
        [FormaIcon addSubview:Websitelbl];
        
        FirstNameTxt=[[UITextField alloc] init];
        FirstNameTxt.frame=CGRectMake(15,110, 280, 25);
        FirstNameTxt.tag=1;
        FirstNameTxt.delegate=self;
        FirstNameTxt.borderStyle=UITextBorderStyleNone;
        FirstNameTxt.textAlignment=NSTextAlignmentLeft;
        FirstNameTxt.returnKeyType = UIReturnKeyNext;
        FirstNameTxt.keyboardType=UIKeyboardTypeEmailAddress;
        [FirstNameTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
        FirstNameTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        FirstNameTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
        FirstNameTxt.placeholder=@"First Name";
        [FirstNameTxt setBackgroundColor:[UIColor clearColor]];
        [mainView addSubview:FirstNameTxt];
        
        UIImageView *LineImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
        LineImg.frame=CGRectMake((self.view.frame.size.width-299.5)/2,138, 599/2, 2/2);
        [mainView addSubview:LineImg];
        
        
        
        LastNameTxt=[[UITextField alloc] init];
        LastNameTxt.frame=CGRectMake(15,140, 280, 25);
        LastNameTxt.tag=2;
        LastNameTxt.delegate=self;
        LastNameTxt.borderStyle=UITextBorderStyleNone;
        LastNameTxt.textAlignment=NSTextAlignmentLeft;
        LastNameTxt.returnKeyType = UIReturnKeyNext;
        LastNameTxt.keyboardType=UIKeyboardTypeEmailAddress;
        [LastNameTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
        LastNameTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        LastNameTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
        LastNameTxt.placeholder=@"Last Name";
        [LastNameTxt setBackgroundColor:[UIColor clearColor]];
        
        [mainView addSubview:LastNameTxt];
        
        
        UIImageView *LineImg3=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
        LineImg3.frame=CGRectMake((self.view.frame.size.width-299.5)/2,168, 599/2, 2/2);
        [mainView addSubview:LineImg3];
        
        
        AddLineTxt=[[UITextField alloc] init];
        AddLineTxt.frame=CGRectMake(15,170, 280, 25);
        AddLineTxt.tag=3;
        AddLineTxt.delegate=self;
        AddLineTxt.borderStyle=UITextBorderStyleNone;
        AddLineTxt.textAlignment=NSTextAlignmentLeft;
        AddLineTxt.returnKeyType = UIReturnKeyNext;
        AddLineTxt.keyboardType=UIKeyboardTypeEmailAddress;
        [AddLineTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
        AddLineTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        AddLineTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
        AddLineTxt.placeholder=@"Address Line 1";
        [AddLineTxt setBackgroundColor:[UIColor clearColor]];
        
        [mainView addSubview:AddLineTxt];
        
        UIImageView *LineImg8=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
        LineImg8.frame=CGRectMake((self.view.frame.size.width-299.5)/2,198, 599/2, 2/2);
        [mainView addSubview:LineImg8];
        
        AddLine2Txt=[[UITextField alloc] init];
        AddLine2Txt.frame=CGRectMake(15,200, 280, 25);
        AddLine2Txt.tag=4;
        AddLine2Txt.delegate=self;
        AddLine2Txt.borderStyle=UITextBorderStyleNone;
        AddLine2Txt.textAlignment=NSTextAlignmentLeft;
        AddLine2Txt.returnKeyType = UIReturnKeyNext;
        AddLine2Txt.keyboardType=UIKeyboardTypeEmailAddress;
        [AddLine2Txt setAutocorrectionType:UITextAutocorrectionTypeNo];
        AddLine2Txt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        AddLine2Txt.autocapitalizationType=UITextAutocapitalizationTypeWords;
        AddLine2Txt.placeholder=@"Address Line 2";
        [AddLine2Txt setBackgroundColor:[UIColor clearColor]];
        
        [mainView addSubview:AddLine2Txt];
        
        UIImageView *LineImg9=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
        LineImg9.frame=CGRectMake((self.view.frame.size.width-299.5)/2,228, 599/2, 2/2);
        [mainView addSubview:LineImg9];
        
        
        CountryTxt=[[UITextField alloc] init];
        CountryTxt.frame=CGRectMake(15,230, 280, 25);
        CountryTxt.tag=5;
        CountryTxt.delegate=self;
        CountryTxt.borderStyle=UITextBorderStyleNone;
        CountryTxt.textAlignment=NSTextAlignmentLeft;
        CountryTxt.returnKeyType = UIReturnKeyNext;
        CountryTxt.keyboardType=UIKeyboardTypeEmailAddress;
        [CountryTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
        CountryTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        CountryTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
        CountryTxt.placeholder=@"Country";
        [CountryTxt setBackgroundColor:[UIColor clearColor]];
        
        [mainView addSubview:CountryTxt];
        
        CountryBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        CountryBtn.frame=CGRectMake((self.view.frame.size.width+280)/2,230, 21/2, 13/2);
        [CountryBtn setBackgroundColor:[UIColor redColor]];
        UIImage *Image = [UIImage imageNamed:@"arrow_down@2x.png"];
        [CountryBtn setBackgroundImage:Image forState:UIControlStateNormal];
        CountryBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [CountryBtn addTarget:self action:@selector(CountryBtn) forControlEvents:UIControlEventTouchUpInside];
        [mainView addSubview:CountryBtn];
        
        
        
        
        
        UIImageView *LineImg4=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
        LineImg4.frame=CGRectMake((self.view.frame.size.width-299.5)/2,258, 599/2, 2/2);
        [mainView addSubview:LineImg4];
        
        
        StateTxt=[[UITextField alloc] init];
        StateTxt.frame=CGRectMake(15,260, 280, 25);
        StateTxt.tag=6;
        StateTxt.delegate=self;
        StateTxt.borderStyle=UITextBorderStyleNone;
        StateTxt.textAlignment=NSTextAlignmentLeft;
        StateTxt.returnKeyType = UIReturnKeyNext;
        StateTxt.keyboardType=UIKeyboardTypeEmailAddress;
        [StateTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
        StateTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        StateTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
        StateTxt.placeholder=@"State/Province";
        [StateTxt setBackgroundColor:[UIColor clearColor]];
        
        
        [mainView addSubview:StateTxt];
        
        StateBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        StateBtn.frame=CGRectMake((self.view.frame.size.width+280)/2,260, 21/2, 13/2);
        [StateBtn setBackgroundColor:[UIColor redColor]];
        UIImage *regImage = [UIImage imageNamed:@"arrow_down@2x.png"];
        [StateBtn setBackgroundImage:regImage forState:UIControlStateNormal];
        StateBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [StateBtn addTarget:self action:@selector(StateBtn) forControlEvents:UIControlEventTouchUpInside];
        [mainView addSubview:StateBtn];
        
        UIImageView *LineImg5=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
        LineImg5.frame=CGRectMake((self.view.frame.size.width-299.5)/2,288, 599/2, 2/2);
        [mainView addSubview:LineImg5];
        
        
        CityTxt=[[UITextField alloc] init];
        CityTxt.frame=CGRectMake(15,290, 280, 25);
        CityTxt.tag=7;
        CityTxt.delegate=self;
        CityTxt.borderStyle=UITextBorderStyleNone;
        CityTxt.textAlignment=NSTextAlignmentLeft;
        CityTxt.returnKeyType = UIReturnKeyNext;
        CityTxt.keyboardType=UIKeyboardTypeEmailAddress;
        [CityTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
        CityTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        CityTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
        CityTxt.placeholder=@"City";
        [CityTxt setBackgroundColor:[UIColor clearColor]];
        
        [mainView addSubview:CityTxt];
        
        CityBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        CityBtn.frame=CGRectMake((self.view.frame.size.width+280)/2,290, 21/2, 13/2);
        [CityBtn setBackgroundColor:[UIColor redColor]];
        UIImage *arrowImage = [UIImage imageNamed:@"arrow_down@2x.png"];
        [CityBtn setBackgroundImage:arrowImage forState:UIControlStateNormal];
        CityBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [CityBtn addTarget:self action:@selector(CityBtn) forControlEvents:UIControlEventTouchUpInside];
        [mainView addSubview:CityBtn];
        
        
        UIImageView *LineImg6=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
        LineImg6.frame=CGRectMake((self.view.frame.size.width-299.5)/2,318, 599/2, 2/2);
        [mainView addSubview:LineImg6];
        
        
        CodeTxt=[[UITextField alloc] init];
        CodeTxt.frame=CGRectMake(15,320, 280, 25);
        CodeTxt.tag=8;
        CodeTxt.delegate=self;
        CodeTxt.borderStyle=UITextBorderStyleNone;
        CodeTxt.textAlignment=NSTextAlignmentLeft;
        CodeTxt.returnKeyType = UIReturnKeyNext;
        CodeTxt.keyboardType=UIKeyboardTypeEmailAddress;
        [CodeTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
        CodeTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        CodeTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
        CodeTxt.placeholder=@"zip Code / Postal Code";
        [CodeTxt setBackgroundColor:[UIColor clearColor]];
        
        [mainView addSubview:CodeTxt];
        
        
        UIImageView *LineImg7=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
        LineImg7.frame=CGRectMake((self.view.frame.size.width-299.5)/2,348, 599/2, 2/2);
        [mainView addSubview:LineImg7];
        
        
        TelephoneTxt=[[UITextField alloc] init];
        TelephoneTxt.frame=CGRectMake(15,350, 280, 25);
        TelephoneTxt.tag=9;
        TelephoneTxt.delegate=self;
        TelephoneTxt.borderStyle=UITextBorderStyleNone;
        TelephoneTxt.textAlignment=NSTextAlignmentLeft;
        TelephoneTxt.returnKeyType = UIReturnKeyNext;
        TelephoneTxt.keyboardType=UIKeyboardTypeEmailAddress;
        [TelephoneTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
        TelephoneTxt.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        TelephoneTxt.autocapitalizationType=UITextAutocapitalizationTypeWords;
        TelephoneTxt.placeholder=@"Telephone No";
        [TelephoneTxt setBackgroundColor:[UIColor clearColor]];
        
        [mainView addSubview:TelephoneTxt];
        
        UIImageView *LineImg10=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider@2x.png"]];
        LineImg10.frame=CGRectMake((self.view.frame.size.width-299.5)/2,378, 599/2, 2/2);
        [mainView addSubview:LineImg10];
        
        
        
        UIButton *SubmitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        SubmitBtn.frame=CGRectMake((self.view.frame.size.width-260)/2,self.view.frame.size.height-135, 521/2, 89/2);
        [SubmitBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        UIImage *SubmitImage = [UIImage imageNamed:@"submit.png"];
        [SubmitBtn setBackgroundImage:SubmitImage forState:UIControlStateNormal];
        SubmitBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        [SubmitBtn addTarget:self action:@selector(SubmitBtn) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:SubmitBtn];
        

    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
            //   PaypalViewController *Order=[[PaypalViewController alloc]init];
            //   [self.navigationController pushViewController:Order animated:YES];
        }
        else if (indexPath.row==1){
            
            //   MasterCardViewController *Order=[[MasterCardViewController alloc]init];
            //   [self.navigationController pushViewController:Order animated:YES];
            
        }
        else if (indexPath.row==2){
            
            //    VISAViewController *Order=[[VISAViewController alloc]init];
            //   [self.navigationController pushViewController:Order animated:YES];
            
        }
        
        
    }
    else if (indexPath.section==1){
        
        if (indexPath.row==0) {
            
          //  MessageViewController *Order=[[MessageViewController alloc]init];
          //  [self.navigationController pushViewController:Order animated:YES];
        }
        else if (indexPath.row==1){
            
          //  CustomOrderViewController *Order=[[CustomOrderViewController alloc]init];
          //  [self.navigationController pushViewController:Order animated:YES];
        }
        
        
    }
    
}
-(void)checkBox:(id)sender{
    
    
    UIButton *btn=(UIButton *)sender;
    
    NSString *str=[[CustomArray objectAtIndex:btn.tag] valueForKey:@"topicID"];
    
    if ([selectedArray containsObject:str]) {
        [selectedArray removeObject:str];
    }
    else{
        
        [selectedArray addObject:str];
    }
    
    [CustomTbl reloadData];
    
    
    
    
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(void)goNext{
    
    
    NSMutableArray *recordArray=[[[NSMutableArray alloc] init] mutableCopy];
    
    if ([selectedArray count]) {
        
        
        for (int i=0; i<[CustomArray count]; i++) {
            
            
            NSString *str=[[CustomArray objectAtIndex:i] valueForKey:@"topicID"];
            
            if ([selectedArray containsObject:str]) {
                
                
                [recordArray addObject:[CustomArray objectAtIndex:i]];
            }
            else{
                
                [selectedArray addObject:str];
            }
            
            
            
            
        }
        
    }
    else{
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Thank You" message:@"Please select your Topic" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
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
