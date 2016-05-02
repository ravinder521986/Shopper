//
//  OrderDetailsViewController.m
//  Project
//
//  Created by Possibility Solutions on 29/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "OrderDetailsViewController.h"

@interface OrderDetailsViewController ()

@end

@implementation OrderDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    FinalDict=[[[NSMutableDictionary alloc]init]mutableCopy];
    
    
    
    
    
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
    reallbl.text=@"ORDER HISTORY";
    reallbl.textAlignment=NSTextAlignmentCenter;
    reallbl.font=[UIFont fontWithName:@"Roboto-Regular" size:15];
    reallbl.textColor=[UIColor whiteColor];
    [customView1 addSubview:reallbl];
    [self.view addSubview:customView1];
    
    
    OrderDetailsTbl=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStyleGrouped];
    [OrderDetailsTbl setBackgroundColor:[UIColor clearColor]];
    OrderDetailsTbl.showsVerticalScrollIndicator=YES;
    OrderDetailsTbl.showsHorizontalScrollIndicator=NO;
    OrderDetailsTbl.showsVerticalScrollIndicator=NO;
    OrderDetailsTbl.dataSource=self;
    OrderDetailsTbl.delegate=self;
    [self.view addSubview:OrderDetailsTbl];
    
    
}
-(void)buttonPressed{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ProductDetails" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WebCategoryResponse:) name:@"ProductDetails" object:nil];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [delObj PostWebServer:dict type:@"ProductDetails"];
    
    
}

-(void)WebCategoryResponse:(NSNotification *)dictionary{
    
    
    NSDictionary *dict=[dictionary userInfo];
    
    FinalDict=(NSMutableDictionary *)[NSDictionary dictionaryWithDictionary:[dict valueForKey:@"result"]];
    NSLog(@"...FinalDict...%@",FinalDict);
    
    
    
    
    
    OrderDetailsTbl.dataSource=self;
    OrderDetailsTbl.delegate=self;
    [OrderDetailsTbl reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    if (section==0) {
        return 1;
        
    }
    else if (section==1){
        
        return 1;
    }
    else if (section==2){
        
        return 1;
    }
    else if (section==3){
        
        return 1;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 152;
    }
    else if (indexPath.section==1){
        
        return 165;
    }
    else if (indexPath.section==2){
        
        return 20;
    }

    else if (indexPath.section==3){
        
        return 90;
    }
        return 200;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        headerView.backgroundColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
        headerView.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:1.0].CGColor;
        headerView.layer.borderWidth = 1.0;
        
        UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        FormaIcon.frame=CGRectMake(0,0, self.view.frame.size.width, 100/2);
        [FormaIcon setBackgroundColor:[UIColor clearColor]];
        UILabel* headerLabel = [[UILabel alloc] init];
        headerLabel.frame = CGRectMake(5, 10, tableView.frame.size.width - 5, 30);
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:12.0];
        headerLabel.text = @"ORDER DETAILS";
        headerLabel.textAlignment = NSTextAlignmentLeft;
        
        
        [headerView addSubview:FormaIcon];
        [headerView addSubview:headerLabel];
        
        return headerView;
        
    }
    else if (section==1) {
    
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        headerView.backgroundColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
        headerView.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:1.0].CGColor;
        headerView.layer.borderWidth = 1.0;
        
        UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        FormaIcon.frame=CGRectMake(0,0, self.view.frame.size.width, 100/2);
        [FormaIcon setBackgroundColor:[UIColor clearColor]];
        UILabel* headerLabel = [[UILabel alloc] init];
        headerLabel.frame = CGRectMake(5, 10, tableView.frame.size.width - 5, 30);
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:12.0];
        headerLabel.text = @"TRANSACTION DETAILS";
        headerLabel.textAlignment = NSTextAlignmentLeft;
        
        
        [headerView addSubview:FormaIcon];
        [headerView addSubview:headerLabel];
        
        return headerView;

        
    }
    else if (section==2) {
        
     
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        headerView.backgroundColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
        headerView.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:1.0].CGColor;
        headerView.layer.borderWidth = 1.0;
        
        UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        FormaIcon.frame=CGRectMake(0,0, self.view.frame.size.width, 100/2);
        [FormaIcon setBackgroundColor:[UIColor clearColor]];
        UILabel* headerLabel = [[UILabel alloc] init];
        headerLabel.frame = CGRectMake(5, 10, tableView.frame.size.width - 5, 30);
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:12.0];
        headerLabel.text = @"PAYMENT DETAILS";
        headerLabel.textAlignment = NSTextAlignmentLeft;
        
        
        [headerView addSubview:FormaIcon];
        [headerView addSubview:headerLabel];
        
        
        return headerView;
        
    }

     else if (section==3) {
        
         
         headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
         headerView.backgroundColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
         headerView.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:1.0].CGColor;
         headerView.layer.borderWidth = 1.0;
         
         UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
         FormaIcon.frame=CGRectMake(0,0, self.view.frame.size.width, 100/2);
         [FormaIcon setBackgroundColor:[UIColor clearColor]];
         UILabel* headerLabel = [[UILabel alloc] init];
         headerLabel.frame = CGRectMake(5, 10, tableView.frame.size.width - 5, 30);
         headerLabel.backgroundColor = [UIColor clearColor];
         headerLabel.textColor = [UIColor whiteColor];
         headerLabel.font = [UIFont boldSystemFontOfSize:12.0];
         headerLabel.text = @"SHIPPING DETAILS";
         headerLabel.textAlignment = NSTextAlignmentLeft;
         
         
         [headerView addSubview:FormaIcon];
         [headerView addSubview:headerLabel];
         
         
         return headerView;
    }
    return headerView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
    }
    
    if (indexPath.section==0) {
        
        UILabel *Datelbl=[[UILabel alloc] initWithFrame:CGRectMake(10,0, self.view.frame.size.width-20, 20)];
        Datelbl.backgroundColor=[UIColor clearColor];
        Datelbl.text=@"Order Date";
        Datelbl.numberOfLines=1;
        Datelbl.textAlignment=NSTextAlignmentLeft;
        Datelbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
        Datelbl.textColor=[UIColor blackColor];
     //   [Datelbl sizeToFit];
        [cell.contentView addSubview:Datelbl];
        
        
        UILabel *Statuslbl=[[UILabel alloc] initWithFrame:CGRectMake(10,22, self.view.frame.size.width-20, 20)];
        Statuslbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        [Statuslbl setBackgroundColor:[UIColor clearColor]];
        Statuslbl.text=@"Status";
        Statuslbl.textAlignment=NSTextAlignmentLeft;
        Statuslbl.textColor=[UIColor blackColor];
       // [Statuslbl sizeToFit];
        
        [cell.contentView addSubview:Statuslbl];
        
        
        UILabel *Order=[[UILabel alloc] initWithFrame:CGRectMake(10,44, self.view.frame.size.width-20, 20)];
        Order.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Order.text=@"Order";
        [Order setBackgroundColor:[UIColor clearColor]];
        Order.textAlignment=NSTextAlignmentLeft;
        Order.textColor=[UIColor blackColor];
     //   [Order sizeToFit];
        
        [cell.contentView addSubview:Order];
        
        
        UILabel *Orderlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,66, self.view.frame.size.width-20, 20)];
        Orderlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Orderlbl.text=@"Order total";
        [Orderlbl setBackgroundColor:[UIColor clearColor]];
        Orderlbl.textAlignment=NSTextAlignmentLeft;
        Orderlbl.textColor=[UIColor blackColor];
   //     [Orderlbl sizeToFit];
        [cell.contentView addSubview:Orderlbl];

        UILabel *itemslbl=[[UILabel alloc] initWithFrame:CGRectMake(10,88, self.view.frame.size.width-20, 20)];
        itemslbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        itemslbl.text=@"total items";
        [itemslbl setBackgroundColor:[UIColor clearColor]];
        itemslbl.textAlignment=NSTextAlignmentLeft;
        itemslbl.textColor=[UIColor blackColor];
    //    [itemslbl sizeToFit];
        [cell.contentView addSubview:itemslbl];
        
      
    }
    else if (indexPath.section==1){
        CGFloat x=self.view.frame.size.width/2;

        cell.backgroundColor=[UIColor clearColor];
        UIImageView *PhotoImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image_bg_2.png"]];
        PhotoImg.frame=CGRectMake(10,13.5, x-65,123);
        [PhotoImg setBackgroundColor:[UIColor redColor]];
        [cell.contentView addSubview:PhotoImg];
        
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50,10, 100, 20)];
        Txtlbl.backgroundColor=[UIColor greenColor];
        Txtlbl.text=@"Product name";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentCenter;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
        Txtlbl.textColor=[UIColor redColor];
        [Txtlbl sizeToFit];
        [cell.contentView addSubview:Txtlbl];
        
        
        UILabel *SubTotalLbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50, 31, 100, 20)];
        SubTotalLbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        [SubTotalLbl setBackgroundColor:[UIColor yellowColor]];
        SubTotalLbl.text=@"Store name";
        SubTotalLbl.textAlignment=NSTextAlignmentCenter;
        SubTotalLbl.textColor=[UIColor blackColor];
        [SubTotalLbl sizeToFit];
        
        [cell.contentView addSubview:SubTotalLbl];
        
        
        UILabel *Taxlbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50, 52, 100, 20)];
        Taxlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Taxlbl.text=@"price";
        [Taxlbl setBackgroundColor:[UIColor orangeColor]];
        Taxlbl.textAlignment=NSTextAlignmentCenter;
        Taxlbl.textColor=[UIColor blackColor];
        [Taxlbl sizeToFit];
        
        [cell.contentView addSubview:Taxlbl];
        
        
        UILabel *Shippinglbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50, 73, 100, 20)];
        Shippinglbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Shippinglbl.text=@"Order date";
        [Shippinglbl setBackgroundColor:[UIColor purpleColor]];
        Shippinglbl.textAlignment=NSTextAlignmentCenter;
        Shippinglbl.textColor=[UIColor blackColor];
        [Shippinglbl sizeToFit];
        [cell.contentView addSubview:Shippinglbl];
        
        
        UILabel *Colourlbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50, 94, 100, 20)];
        Colourlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Colourlbl.text=@"Order total";
        [Colourlbl setBackgroundColor:[UIColor clearColor]];
        Colourlbl.textAlignment=NSTextAlignmentLeft;
        Colourlbl.textColor=[UIColor blackColor];
       [Colourlbl sizeToFit];
        [cell.contentView addSubview:Colourlbl];
        
        UILabel *Quantitylbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50, 115, 100, 20)];
        Quantitylbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Quantitylbl.text=@"total items";
        [Quantitylbl setBackgroundColor:[UIColor clearColor]];
        Quantitylbl.textAlignment=NSTextAlignmentLeft;
        Quantitylbl.textColor=[UIColor blackColor];
        [Quantitylbl sizeToFit];
        [cell.contentView addSubview:Quantitylbl];
        
        
        UILabel *CDNSlbl=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-30, 10, 100, 20)];
        CDNSlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        CDNSlbl.text=@"CDNS";
        [CDNSlbl setBackgroundColor:[UIColor redColor]];
        CDNSlbl.textAlignment=NSTextAlignmentLeft;
        CDNSlbl.textColor=[UIColor blackColor];
        [CDNSlbl sizeToFit];
        [cell.contentView addSubview:CDNSlbl];
        
        UILabel *RSlbl=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-30, 31, 100, 20)];
        RSlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        RSlbl.text=@"30:00";
        [RSlbl setBackgroundColor:[UIColor greenColor]];
        RSlbl.textAlignment=NSTextAlignmentLeft;
        RSlbl.textColor=[UIColor blackColor];
        [RSlbl sizeToFit];
        [cell.contentView addSubview:RSlbl];
        

        UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
        RectangleImg.frame=CGRectMake(0,149, self.view.frame.size.width ,2/2);
        RectangleImg.backgroundColor=[UIColor redColor];
        [cell.contentView addSubview:RectangleImg];
        


    }
    else if (indexPath.section==2){
        
        
        UILabel *Datelbl=[[UILabel alloc] initWithFrame:CGRectMake(10,0, self.view.frame.size.width-20, 20)];
        Datelbl.backgroundColor=[UIColor clearColor];
        Datelbl.text=@"Credit Card Ending In..1234";
        Datelbl.numberOfLines=1;
        Datelbl.textAlignment=NSTextAlignmentLeft;
        Datelbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
        Datelbl.textColor=[UIColor blackColor];
        //   [Datelbl sizeToFit];
        [cell.contentView addSubview:Datelbl];
    }
    else if (indexPath.section==3){
        
        UILabel *Datelbl=[[UILabel alloc] initWithFrame:CGRectMake(10,0, self.view.frame.size.width-20, 20)];
        Datelbl.backgroundColor=[UIColor clearColor];
        Datelbl.text=@"Shipping Mothed: Same Day Delivery";
        Datelbl.numberOfLines=1;
        Datelbl.textAlignment=NSTextAlignmentLeft;
        Datelbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
        Datelbl.textColor=[UIColor blackColor];
        //   [Datelbl sizeToFit];
        [cell.contentView addSubview:Datelbl];
        
        
        UILabel *Statuslbl=[[UILabel alloc] initWithFrame:CGRectMake(10,22, self.view.frame.size.width-20, 20)];
        Statuslbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        [Statuslbl setBackgroundColor:[UIColor clearColor]];
        Statuslbl.text=@"Shipping Address";
        Statuslbl.textAlignment=NSTextAlignmentLeft;
        Statuslbl.textColor=[UIColor blackColor];
        // [Statuslbl sizeToFit];
        
        [cell.contentView addSubview:Statuslbl];
        
        
        UILabel *Order=[[UILabel alloc] initWithFrame:CGRectMake(10,44, self.view.frame.size.width-20, 20)];
        Order.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Order.text=@"Test Street 1234";
        [Order setBackgroundColor:[UIColor clearColor]];
        Order.textAlignment=NSTextAlignmentLeft;
        Order.textColor=[UIColor blackColor];
        //   [Order sizeToFit];
        
        [cell.contentView addSubview:Order];
        
        
        UILabel *Orderlbl=[[UILabel alloc] initWithFrame:CGRectMake(10,66, self.view.frame.size.width-20, 20)];
        Orderlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
        Orderlbl.text=@"Toronto Qntario";
        [Orderlbl setBackgroundColor:[UIColor clearColor]];
        Orderlbl.textAlignment=NSTextAlignmentLeft;
        Orderlbl.textColor=[UIColor blackColor];
        //     [Orderlbl sizeToFit];
        [cell.contentView addSubview:Orderlbl];
 
    }

    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
           // OrderDetailsViewController *OrderDetails=[[OrderDetailsViewController alloc]init];
           // [self.navigationController pushViewController:OrderDetails animated:YES];
            
        }
        else if (indexPath.row==1){
            
            
        }
    }
    else if (indexPath.section==1){
        
        
    }
    
    
    
}
-(void)leftSlider{
    
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark TextFieldShouldReturn
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    return YES;
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