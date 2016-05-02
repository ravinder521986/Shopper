//
//  CartViewController.m
//  Project
//
//  Created by Possibility Solutions on 03/02/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()

@end

@implementation CartViewController

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
    reallbl.text=@"PAYMENT";
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
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    if (section==0) {
        
        return 3;
    }
      else{
        
        return 2;
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
            
            return 50;
        }
        else if (indexPath.row==1){
            
            return 50;
        }
        else if (indexPath.row==2){
            
            return 50;
        }
        return 150;
    }
    else if (indexPath.row==1){
        
        return 50;
    }
    return 50;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        
    
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
        
        if (indexPath.row==0) {
            
        
        UIImageView *PaypalImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paypal@2x.png"]];
        PaypalImg.frame=CGRectMake((self.view.frame.size.width-320)/2,13, 184/2, 48/2);
        [PaypalImg setBackgroundColor:[UIColor greenColor]];
        [cell.contentView addSubview:PaypalImg];
            
            if ([[[TopicArray objectAtIndex:indexPath.row] valueForKey:@"favourite"]isEqualToString:@"0"]) {
                UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
                checkBtn.frame=CGRectMake(self.view.frame.size.width-30, 15, 26, 26);
                [checkBtn setImage:[UIImage imageNamed:@"check-orange@2x.png"] forState:UIControlStateNormal];
                [checkBtn addTarget:self action:@selector(checkBox:) forControlEvents:UIControlEventTouchUpInside];
                checkBtn.tag=indexPath.row;
                [cell addSubview:checkBtn];
                
                
            }
            else{
                
                UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
                checkBtn.frame=CGRectMake(self.view.frame.size.width-30, 15, 26, 26);
                [checkBtn setImage:[UIImage imageNamed:@"check-grey@2x.png"] forState:UIControlStateNormal];
                [checkBtn addTarget:self action:@selector(checkBox:) forControlEvents:UIControlEventTouchUpInside];
                checkBtn.tag=indexPath.row;
                [cell addSubview:checkBtn];
            }

        }
        else if (indexPath.row==1){
        UIImageView *MasterCardImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MasterCard@2x.png"]];
        MasterCardImg.frame=CGRectMake((self.view.frame.size.width-320)/2,4, 135/2, 85/2);
        [MasterCardImg setBackgroundColor:[UIColor greenColor]];
        [cell.contentView addSubview:MasterCardImg];
        
            if ([[[TopicArray objectAtIndex:indexPath.row] valueForKey:@"favourite"]isEqualToString:@"0"]) {
                UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
                checkBtn.frame=CGRectMake(self.view.frame.size.width-30, 15, 26, 26);
                [checkBtn setImage:[UIImage imageNamed:@"check-orange@2x.png"] forState:UIControlStateNormal];
                [checkBtn addTarget:self action:@selector(checkBox:) forControlEvents:UIControlEventTouchUpInside];
                checkBtn.tag=indexPath.row;
                [cell addSubview:checkBtn];
                
                
            }
            else{
                
                UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
                checkBtn.frame=CGRectMake(self.view.frame.size.width-30, 15, 26, 26);
                [checkBtn setImage:[UIImage imageNamed:@"check-grey@2x.png"] forState:UIControlStateNormal];
                [checkBtn addTarget:self action:@selector(checkBox:) forControlEvents:UIControlEventTouchUpInside];
                checkBtn.tag=indexPath.row;
                [cell addSubview:checkBtn];
            }

        }
        else if (indexPath.row==2){
        UIImageView *VisaImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"visa.png"]];
        VisaImg.frame=CGRectMake((self.view.frame.size.width-320)/2,4, 135/2, 85/2);
        [VisaImg setBackgroundColor:[UIColor greenColor]];
        [cell.contentView addSubview:VisaImg];
        
            if ([[[TopicArray objectAtIndex:indexPath.row] valueForKey:@"favourite"]isEqualToString:@"0"]) {
                UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
                checkBtn.frame=CGRectMake(self.view.frame.size.width-30, 15, 26, 26);
                [checkBtn setImage:[UIImage imageNamed:@"check-orange@2x.png"] forState:UIControlStateNormal];
                [checkBtn addTarget:self action:@selector(checkBox:) forControlEvents:UIControlEventTouchUpInside];
                checkBtn.tag=indexPath.row;
                [cell addSubview:checkBtn];
                
                
            }
            else{
                
                UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
                checkBtn.frame=CGRectMake(self.view.frame.size.width-30, 15, 26, 26);
                [checkBtn setImage:[UIImage imageNamed:@"check-grey@2x.png"] forState:UIControlStateNormal];
                [checkBtn addTarget:self action:@selector(checkBox:) forControlEvents:UIControlEventTouchUpInside];
                checkBtn.tag=indexPath.row;
                [cell addSubview:checkBtn];
            }


        }
        
    }

    else{
        
        if (indexPath.row==0) {
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
            PiKImg.frame=CGRectMake(self.view.frame.size.width-20, 19.5, 13/2,21/2);
            [cell.contentView addSubview:PiKImg];

        }
        else{
        UILabel *Txtlbl1=[[UILabel alloc] initWithFrame:CGRectMake(10,10, self.view.frame.size.width-20, 30)];
        Txtlbl1.backgroundColor=[UIColor clearColor];
        Txtlbl1.text=@"VISA Checkout";
        Txtlbl1.numberOfLines=1;
        Txtlbl1.textAlignment=NSTextAlignmentLeft;
        Txtlbl1.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
        Txtlbl1.textColor=[UIColor blackColor];
        [Txtlbl1 sizeToFit];
        [cell.contentView addSubview:Txtlbl1];
        
        
        UIImageView *ArrowImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowBtn@2x.png"]];
        ArrowImg.frame=CGRectMake(self.view.frame.size.width-20, 19.5, 13/2,21/2);
        [cell.contentView addSubview:ArrowImg];

        
        }
        
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
            
              MessageViewController *Order=[[MessageViewController alloc]init];
              [self.navigationController pushViewController:Order animated:YES];
        }
        else if (indexPath.row==1){
            
        //    AddCustomViewController *Order=[[AddCustomViewController alloc]init];
         //   [self.navigationController pushViewController:Order animated:YES];
        }

        
    }
    
}
-(void)checkBox:(id)sender{
    
    
    UIButton *btn=(UIButton *)sender;
    
    NSString *str=[[TopicArray objectAtIndex:btn.tag] valueForKey:@"topicID"];
    
    if ([selectedArray containsObject:str]) {
        [selectedArray removeObject:str];
    }
    else{
        
        [selectedArray addObject:str];
    }
    
    [ShippingTbl reloadData];
    
    
    
    
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(void)goNext{
    
    
    NSMutableArray *recordArray=[[[NSMutableArray alloc] init] mutableCopy];
    
    if ([selectedArray count]) {
        
        
        for (int i=0; i<[TopicArray count]; i++) {
            
            
            NSString *str=[[TopicArray objectAtIndex:i] valueForKey:@"topicID"];
            
            if ([selectedArray containsObject:str]) {
                
                
                [recordArray addObject:[TopicArray objectAtIndex:i]];
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
