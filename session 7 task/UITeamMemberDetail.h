//
//  UITeamMemberDetail.h
//  TahrirLounge
//
//  Created by Mohamed Ibrahim on 5/7/17.
//  Copyright © 2017 Mohamed Ibrahim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "teamMembers.h"

@interface UITeamMemberDetail : UIViewController
{
    
}
@property (nonatomic) teamMembers* teamMemberOBJ;

@property (weak, nonatomic) IBOutlet UIImageView *memberImage;

@property (weak, nonatomic) IBOutlet UILabel *memberNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *memberTitleLbl;
@property (weak, nonatomic) IBOutlet UITextView *memberDescLbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (strong, nonatomic) IBOutlet UINavigationBar *TeamDetailnavigationBar;

@end
