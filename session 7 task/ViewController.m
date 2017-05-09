//
//  ViewController.m
//  session 7 task
//
//  Created by MOMO on 5/2/17.
//  Copyright © 2017 GreenRoot. All rights reserved.
//

#import "ViewController.h"

#import "ViewController.h"
#import "UITeamMemberDetail.h"
#import "teamMemberTableViewCell.h"

#import "webService.h"
#import "teamMembers.h"

#import "MBProgressHUD.h"
#import "navigationBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    
    navigationBarViewController *navigationBar = [navigationBarViewController new];
    
    
    UIColor *navigationBarColorBlue = [UIColor colorWithRed:1.0/255 green:125.0/255 blue:214.0/255 alpha:1.0];
    
    [navigationBar customSetup:_sideBarButton :self];
    [navigationBar customizeNavigation:_sideBarButton :self :navigationBarColorBlue :@"Our Team"];
    

    
    
    teammembersList=[NSMutableArray new];
    
  
    
    
    [_listTeamView setDelegate:self];
    [_listTeamView setDataSource:self];
    
  
    
    
}

-(void)viewDidAppear:(BOOL)animated{

    NSString* apiURL=@"http://209.126.105.42:8001/iosapi/getAllTeamMembers";
    [self returnDataFromAPI:apiURL];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) returnDataFromAPI: (NSString*) apiURL
{
    // 1
    
    NSURL *url = [NSURL URLWithString:apiURL];
    
    NSMutableArray *returnData=[NSMutableArray new];
    // 2
   
  // [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              // 4: Handle response here
                                            
                                              //[MBProgressHUD hideHUDForView:self.view animated:YES];
                                              
                                              if (!error)
                                              {
                                                  NSError *JSONError = nil;
                                                  
                                                  NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                                             options:0
                                                                                                               error:&JSONError];
                                                  if (JSONError)
                                                  {
                                                      NSLog(@"Serialization error: %@", JSONError.localizedDescription);
                                                  }
                                                  else
                                                  {
                                                      NSLog(@"Response: %@", dictionary);
                                                      NSArray * values = [dictionary allValues];
                                                      
                                                      for (NSArray *recipeArray in values)
                                                      {
                                                          [returnData addObject:recipeArray];
                                                      }
                                                      NSLog(@"Array: %@", values);
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      teammembersList =[teamMembers getAllTeamMembers: returnData];
                                                      
                                                      [_listTeamView reloadData];
                                                      
                                                      
                                                  }
                                              }
                                              else
                                              {
                                                  NSLog(@"Error: %@", error.localizedDescription);
                                              }
                                              
                                            
                                              
                                          }];
    
    // 3
    [downloadTask resume];
    
   
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    NSInteger position=indexPath.row;
    teamMembers *teamMemberOBJ=[teamMembers new];
    teamMemberOBJ=[teammembersList objectAtIndex:position];
    
    
    /*
     static NSString *CellIdentifier = @"teamMemberCell";
     
     
     
     
     
     teamMemberTableViewCell *cella =[[teamMemberTableViewCell alloc]initWithStyle:UITableViewCellFocusStyleCustom reuseIdentifier:CellIdentifier];
     
     
     cella.NameLbl.text=teamMemberOBJ.memberName;
     cella.titleLbl.text=teamMemberOBJ.memberPosition;
     
     NSString* imagePath=@"";
     if(teamMemberOBJ.imagePath )
     {
     
     imagePath=teamMemberOBJ.imagePath ;
     NSURL* imageURL=[[NSURL alloc] initWithString:imagePath];
     
     NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
     UIImage *image = [[UIImage alloc] initWithData:imageData];
     
     cella.cellImage.image=image;
     }
     
     */
    
    
    UITableViewCell *cella =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cella.textLabel.text=teamMemberOBJ.memberName;
    
    NSString* imagePath=@"";
    if(teamMemberOBJ.imagePath )
    {
        
        imagePath=teamMemberOBJ.imagePath ;
        NSURL* imageURL=[[NSURL alloc] initWithString:imagePath];
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        
        cella.imageView.image=image;
    }
    
    return  cella;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [teammembersList count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    NSInteger position=indexPath.row;
    _selectedteamMemberOBJ=[teamMembers new];
    _selectedteamMemberOBJ=[teammembersList objectAtIndex:position];
    
    /*
     UITeamMemberDetail *viewTeamDetail=[[UITeamMemberDetail alloc] initWithNibName:@"UITeamMemberDetail" bundle:nil];
     viewTeamDetail.teamMemberOBJ=teamMemberOBJ;
     
     
     [self.navigationController pushViewController:viewTeamDetail animated:YES];
     */
    
    
    [self performSegueWithIdentifier:@"teamMemberDetail" sender:self];
    
    /*  Change Storyboard Active View
     [self performSegueWithIdentifier:@"teamMemberDetail" sender:self];
     */
    
    // [self performSegueWithIdentifier:@"teamMemberDetail" sender:self];
    
    //[self pushViewController:viewTeamDetail animated:YES];
    
    
    NSLog(@" clicked : ");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"teamMemberDetail"])
    {
        //UITeamMemberDetail *viewTeamDetail=[[UITeamMemberDetail alloc] initWithNibName:@"UITeamMemberDetail" bundle:nil];
        
        UITeamMemberDetail *viewTeamDetail=[segue destinationViewController];
        viewTeamDetail.teamMemberOBJ=_selectedteamMemberOBJ;
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }
}
@end
