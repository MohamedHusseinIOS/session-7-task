//
//  UITeamMemberDetail.m
//  TahrirLounge
//
//  Created by Mohamed Ibrahim on 5/7/17.
//  Copyright © 2017 Mohamed Ibrahim. All rights reserved.
//

#import "UITeamMemberDetail.h"
#import "navigationBarViewController.h"

@interface UITeamMemberDetail ()

@end

@implementation UITeamMemberDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    navigationBarViewController *navigationBar = [navigationBarViewController new];
    
    
    UIColor *navigationBarColorBlue = [UIColor colorWithRed:1.0/255 green:125.0/255 blue:214.0/255 alpha:1.0];
    
    [navigationBar customSetup:_sideBarButton :self];
    [navigationBar childNavigationBarCustom:_sideBarButton :_TeamDetailnavigationBar :navigationBarColorBlue :@"Our Team"];
    
    
    _memberNameLbl.text=_teamMemberOBJ.memberName;
    _memberTitleLbl.text=_teamMemberOBJ.memberPosition;
    _memberDescLbl.text=_teamMemberOBJ.memberDecription;
    
    if(_teamMemberOBJ.imagePath )
    {
        NSString* imagePath=_teamMemberOBJ.imagePath ;
        NSURL* imageURL=[[NSURL alloc] initWithString:imagePath];
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        
        _memberImage.image=image;
    }
    
    
    NSLog(@"%@",_teamMemberOBJ.memberName);
    
}

-(void)viewDidAppear:(BOOL)animated
{

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
