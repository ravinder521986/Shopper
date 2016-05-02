//
//  PaymentViewController.m
//  Project
//
//  Created by Possibility Solutions on 01/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "PaymentViewController.h"

@interface PaymentViewController ()

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    self.view.backgroundColor = [UIColor whiteColor];
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    
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
    reallbl.text=@"Shipping Method";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [self.view addSubview:customView1];
    
    
    ShippingTbl=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
    ShippingTbl.showsVerticalScrollIndicator=YES;
    ShippingTbl.showsHorizontalScrollIndicator=NO;
    ShippingTbl.showsVerticalScrollIndicator=NO;
    ShippingTbl.dataSource=self;
    ShippingTbl.delegate=self;
    [self.view addSubview:ShippingTbl];
    
    
}

-(void)buttonPressed{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [delObj PostWebServer:dict type:@""];
    
    
}

-(void)WebCategoryResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    
    ShippingTbl.dataSource=self;
    ShippingTbl.delegate=self;
    [ShippingTbl reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return 7;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        
        return 38.5;
        
    }
    else if (indexPath.row==1){
        
        return 70;
        
    }
    else if (indexPath.row==2){
        
        return 70;
        
    }
    else if (indexPath.row==3){
        
        
        return 70;
    }
    else if (indexPath.row==4){
        
        return 38.5;
    }
    else if (indexPath.row==5){
        
        return 50;
    }
    else if (indexPath.row==6){
        
        return 50;
    }
    else{
        
        return 0;
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
    }
    
    if (indexPath.row==0) {
        
        
        UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        FormaIcon.frame=CGRectMake(0,0, self.view.frame.size.width, 77/2);
        [FormaIcon setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:FormaIcon];
        
        UILabel *Websitelbl=[[UILabel alloc] initWithFrame:CGRectMake(10,15, self.view.frame.size.width, 38.5)];
        Websitelbl.font = [UIFont fontWithName:@"Arial" size:12];
        Websitelbl.text=@"SELECT PAYMENT MATHOD";
        Websitelbl.textAlignment=NSTextAlignmentCenter;
        Websitelbl.textColor=[UIColor whiteColor];
        Websitelbl.numberOfLines = 1;
        [Websitelbl sizeToFit];
        [cell.contentView addSubview:Websitelbl];
        

    }
    else if (indexPath.row==1){
        
        UIImageView *PaypalImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paypal@2x.png"]];
        PaypalImg.frame=CGRectMake((self.view.frame.size.width-320)/2,23, 184/2, 48/2);
        [PaypalImg setBackgroundColor:[UIColor greenColor]];
        [cell.contentView addSubview:PaypalImg];
        
        
    }
    else if (indexPath.row==2){
        
        UIImageView *MasterCardImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MasterCard@2x.png"]];
        MasterCardImg.frame=CGRectMake((self.view.frame.size.width-320)/2,14, 135/2, 85/2);
        [MasterCardImg setBackgroundColor:[UIColor greenColor]];
        [cell.contentView addSubview:MasterCardImg];
        
       

        
    }
    else if (indexPath.row==3){
        
        UIImageView *VisaImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"visa.png"]];
        VisaImg.frame=CGRectMake((self.view.frame.size.width-320)/2,14, 135/2, 85/2);
        [VisaImg setBackgroundColor:[UIColor greenColor]];
        [cell.contentView addSubview:VisaImg];
        
        
    }
    else if (indexPath.row==4){
        
        
        
        UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        FormaIcon.frame=CGRectMake(0,0, self.view.frame.size.width, 77/2);
        [FormaIcon setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:FormaIcon];
        
        UILabel *Websitelbl=[[UILabel alloc] initWithFrame:CGRectMake(10,15, self.view.frame.size.width, 38.5)];
        Websitelbl.font = [UIFont fontWithName:@"Arial" size:12];
        Websitelbl.text=@"ADD PAYMENT MATHOD";
        Websitelbl.textAlignment=NSTextAlignmentCenter;
        Websitelbl.textColor=[UIColor whiteColor];
        Websitelbl.numberOfLines = 1;
        [Websitelbl sizeToFit];
        [cell.contentView addSubview:Websitelbl];


    }
    else if (indexPath.row==5){
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,10, self.view.frame.size.width-20, 30)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"add credit card";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        
        UIImageView *PiKImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowBtn@2x.png"]];
        PiKImg.frame=CGRectMake(self.view.frame.size.width-10, 19.5, 13/2,21/2);
        [cell.contentView addSubview:PiKImg];
        
    }
    else if (indexPath.row==6){
        
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,10, self.view.frame.size.width-20, 30)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"VISA Checkout";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        Txtlbl.textColor=[UIColor blackColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        
        UIImageView *PiKImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowBtn@2x.png"]];
        PiKImg.frame=CGRectMake(self.view.frame.size.width-10, 19.5, 13/2,21/2);
        [cell.contentView addSubview:PiKImg];
        
        
        
        
    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0) {
        
    }
    else if (indexPath.row==1){
        
        
    }
    else if (indexPath.row==2){
        
    }
    else if (indexPath.row==3){
        
        
    }
    else if (indexPath.row==4){

        
    }
    else if (indexPath.row==5){
    
    }

    else if (indexPath.row==6){
        
    }

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

