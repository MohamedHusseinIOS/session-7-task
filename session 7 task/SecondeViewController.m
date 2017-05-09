//
//  SecondeViewController.m
//  session 7 task
//
//  Created by MOMO on 5/2/17.
//  Copyright © 2017 GreenRoot. All rights reserved.
//

#import "SecondeViewController.h"
#import "SWRevealViewController.h"

@interface SecondeViewController ()

@end

@implementation SecondeViewController{

    NSArray *menuItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.myTable setDelegate:self];
    _myTable.dataSource=self;
    
    menuItems = @[@"Home",@"About_Us",@"Events",@"Gallery",@"Contact_Us",@"FaceBook_Page",@"Twitter",@"ourTeam",@"partners"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
//-----------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return menuItems.count;
}
//--------------

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    NSString *CellIndentifier = [menuItems objectAtIndex:indexPath.row];
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIndentifier forIndexPath:indexPath ];
    
    
    return cell;
    
}

//---------------
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 49;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
