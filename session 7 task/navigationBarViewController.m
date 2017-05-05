//
//  navigationBarViewController.m
//  session 7 task
//
//  Created by GreenRoot on 5/5/17.
//  Copyright © 2017 GreenRoot. All rights reserved.
//

#import "navigationBarViewController.h"
#import "SWRevealViewController.h"

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


-(void) customizeNavigation : (UIBarButtonItem*)MenuButton :(UIViewController*)Selfoff{
    
    Selfoff.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.0/255 green:125.0/255 blue:214.0/255 alpha:1.0];
    [Selfoff.navigationController.navigationBar setTranslucent:NO];
    
    UIImageView *logoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo2"]];
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 53)];
    
    logoImage.frame = titleView.bounds;
    [titleView addSubview:logoImage];
    
    Selfoff.navigationItem.titleView = titleView;
    
    MenuButton.tintColor = [UIColor whiteColor];
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
