//
//  navigationBarViewController.m
//  session 7 task
//
//  Created by GreenRoot on 5/5/17.
//  Copyright © 2017 GreenRoot. All rights reserved.
//

#import "navigationBarViewController.h"
#import "SWRevealViewController.h"
#import "UITeamMemberDetail.h"
#import "SecondeViewController.h"


@interface navigationBarViewController ()

@end

@implementation navigationBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//----custom setup to make slide action and apper the menu ----------------

-(void) customSetup :(UIBarButtonItem*)menuButton :(UIViewController*)Selfoff{
    SWRevealViewController *revealViewController = Selfoff.revealViewController;
    if (revealViewController) {
        [menuButton setTarget:revealViewController];
        [menuButton setAction:@selector(revealToggle:)];
        [Selfoff.view addGestureRecognizer:Selfoff.revealViewController.panGestureRecognizer];
    }
}

//-------------this method for customize NB color and but logo in navigation bar----------------------------------


-(void) customizeNavigation : (UIBarButtonItem*)MenuButton :(UIViewController*)Selfoff :(UIColor*)navigationBarColor :(NSString *)TextForTitle{
    
    
    Selfoff.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:41.0/255 green:77.0/255 blue:151.0/255 alpha:1];
    [Selfoff.navigationController.navigationBar setTranslucent:NO];
    
    //UIImageView *logoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo2"]];
    //UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 53)];
    
    //logoImage.frame = titleView.bounds;
    //[titleView addSubview:logoImage];
    
    UILabel *titleText = [UILabel new];
    
    titleText.text = TextForTitle;
    
    titleText.textColor = [UIColor whiteColor];
    titleText.textAlignment = NSTextAlignmentCenter;
    //titleText.adjustsFontSizeToFitWidth=YES;
    
    [titleText setFont:[UIFont boldSystemFontOfSize:26]];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160 , 53)];
    
    
    titleText.frame = titleView.bounds;
    [titleView addSubview:titleText];
    
    [Selfoff.navigationItem setTitleView: titleView];
    
    
    UIGraphicsBeginImageContext(MenuButton.image.size);
    [MenuButton.image drawInRect:CGRectMake(0, 10, 30, 30)];
    MenuButton.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    MenuButton.tintColor = [UIColor whiteColor];
    
    Selfoff.navigationController.navigationBar.layer.shadowOffset=CGSizeMake(0.0f, 0.0f);
    Selfoff.navigationController.navigationBar.layer.shadowOpacity=0.8;
}



-(void)childNavigationBarCustom: (UIBarButtonItem*)MenuButton :(UINavigationBar *)navigationBar :(UIColor*)navigationBarColor :(NSString *) TextForTitle{
    
    navigationBar.barTintColor= navigationBarColor;
    
    UILabel *titleLabel = [UILabel new];
    
    titleLabel.text = TextForTitle;
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 53)];
    
    [titleView addSubview:titleLabel];
    
    self.navigationItem.titleView = titleView;
    
    MenuButton.tintColor = [UIColor whiteColor];
    
    
    navigationBar.layer.shadowOffset=CGSizeMake(0.0f, 0.0f);
    navigationBar.layer.shadowOpacity=0.8;
   
    
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
