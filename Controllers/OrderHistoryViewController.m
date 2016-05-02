//
//  OrderHistoryViewController.m
//  Project
//
//  Created by Possibility Solutions on 29/04/16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "OrderHistoryViewController.h"

@interface OrderHistoryViewController ()

@end

@implementation OrderHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    delObj=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    FinalDict=[[[NSMutableDictionary alloc]init]mutableCopy];
    
    
    
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0f, 64.0f, self.view.frame.size.width, 55.0f)];
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    searchBar.placeholder=@"Search Order History";
    searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    searchBar.keyboardType = UIKeyboardTypeAlphabet;
    searchBar.delegate = self;
    [searchBar setBackgroundColor:[UIColor clearColor]];
//    tbl.tableHeaderView = searchBar;
    [self.view addSubview:searchBar];
    

    
    
    
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
    
    
    OrderHistoryTbl=[[UITableView alloc] initWithFrame:CGRectMake(0, 119, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStyleGrouped];
    [OrderHistoryTbl setBackgroundColor:[UIColor clearColor]];
    OrderHistoryTbl.showsVerticalScrollIndicator=YES;
    OrderHistoryTbl.showsHorizontalScrollIndicator=NO;
    OrderHistoryTbl.showsVerticalScrollIndicator=NO;
    OrderHistoryTbl.dataSource=self;
    OrderHistoryTbl.delegate=self;
    [self.view addSubview:OrderHistoryTbl];
    
    
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
    
    
    
    
    
    OrderHistoryTbl.dataSource=self;
    OrderHistoryTbl.delegate=self;
    [OrderHistoryTbl reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    if (section==0) {
        return 1;
        
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 150;
    }
    else{
        return 0;
    }
    
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
    
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 38.5)];
        headerView.backgroundColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
        headerView.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:1.0].CGColor;
        headerView.layer.borderWidth = 1.0;
        
        UIImageView *FormaIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Round_Black@2x.png"]];
        FormaIcon.frame=CGRectMake(0,0, self.view.frame.size.width, 77/2);
        [FormaIcon setBackgroundColor:[UIColor clearColor]];
        
        UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(15,9, 200, 20)];
        Txtlbl.backgroundColor=[UIColor clearColor];
        Txtlbl.text=@"LAST 6 MONTHS";
        Txtlbl.numberOfLines=1;
        Txtlbl.textAlignment=NSTextAlignmentLeft;
        Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:12];
        Txtlbl.textColor=[UIColor whiteColor];
        [Txtlbl sizeToFit];
        [headerView addSubview:Txtlbl];
        
        
        UILabel *Orderlbl=[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-80,9, 200, 20)];
        Orderlbl.backgroundColor=[UIColor clearColor];
        Orderlbl.text=@"Filter Orders";
        Orderlbl.numberOfLines=1;
        Orderlbl.textAlignment=NSTextAlignmentLeft;
        Orderlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:12];
        Orderlbl.textColor=[UIColor whiteColor];
        [Orderlbl sizeToFit];
        [headerView addSubview:Orderlbl];
        
       
        [headerView addSubview:FormaIcon];
        [headerView addSubview:Txtlbl];
        [headerView addSubview:Orderlbl];

        return headerView;
        
    }
    else{
     return headerView;
    
   }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 38.5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
    }
    CGFloat x=self.view.frame.size.width/2;

    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
            cell.backgroundColor=[UIColor clearColor];
            UIImageView *PhotoImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image_bg_2.png"]];
            PhotoImg.frame=CGRectMake(10,13.5, x-65,123);
            [PhotoImg setBackgroundColor:[UIColor clearColor]];
            [cell.contentView addSubview:PhotoImg];
            
            
            UILabel *Txtlbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50,40, 100, 20)];
            Txtlbl.backgroundColor=[UIColor clearColor];
            Txtlbl.text=@"Product name";
            Txtlbl.numberOfLines=1;
            Txtlbl.textAlignment=NSTextAlignmentCenter;
            Txtlbl.font=[UIFont fontWithName:@"Roboto-Regular" size:11];
            Txtlbl.textColor=[UIColor redColor];
            [Txtlbl sizeToFit];
            [cell.contentView addSubview:Txtlbl];
            
            
            UILabel *SubTotalLbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50, 61, 100, 20)];
            SubTotalLbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
            [SubTotalLbl setBackgroundColor:[UIColor clearColor]];
            SubTotalLbl.text=@"Store name";
            SubTotalLbl.textAlignment=NSTextAlignmentCenter;
            SubTotalLbl.textColor=[UIColor blackColor];
            [SubTotalLbl sizeToFit];
            
            [cell.contentView addSubview:SubTotalLbl];
            
            
            UILabel *Taxlbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50, 82, 100, 20)];
            Taxlbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
            Taxlbl.text=@"price";
            [Taxlbl setBackgroundColor:[UIColor clearColor]];
            Taxlbl.textAlignment=NSTextAlignmentCenter;
            Taxlbl.textColor=[UIColor blackColor];
            [Taxlbl sizeToFit];
            
            [cell.contentView addSubview:Taxlbl];
            
            
            UILabel *Shippinglbl=[[UILabel alloc] initWithFrame:CGRectMake(x-50, 103, 100, 20)];
            Shippinglbl.font = [UIFont fontWithName:@"Roboto-Regular" size:10];
            Shippinglbl.text=@"Order date";
            [Shippinglbl setBackgroundColor:[UIColor clearColor]];
            Shippinglbl.textAlignment=NSTextAlignmentCenter;
            Shippinglbl.textColor=[UIColor blackColor];
            [Shippinglbl sizeToFit];
            [cell.contentView addSubview:Shippinglbl];
            
            UIImageView *PiKImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowBtn@2x.png"]];
            PiKImg.frame=CGRectMake(self.view.frame.size.width-20, 70, 13/2,21/2);
            PiKImg.userInteractionEnabled=YES;
            [cell.contentView addSubview:PiKImg];
            
            UIImageView *RectangleImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-.png"]];
            RectangleImg.frame=CGRectMake(0,149, self.view.frame.size.width ,2/2);
            RectangleImg.backgroundColor=[UIColor redColor];
            [cell.contentView addSubview:RectangleImg];
            
        }
        else if (indexPath.row==1){
            
    
            cell.backgroundColor=[UIColor redColor];
        }
    }
    else if (indexPath.section==1){
        
        
    }
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
            OrderDetailsViewController *OrderDetails=[[OrderDetailsViewController alloc]init];
            [self.navigationController pushViewController:OrderDetails animated:YES];
        
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