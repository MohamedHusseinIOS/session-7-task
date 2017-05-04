//
//  TwitterViewController.m
//  session 7 task
//
//  Created by GreenRoot on 5/3/17.
//  Copyright © 2017 GreenRoot. All rights reserved.
//

#import "TwitterViewController.h"
#import "SWRevealViewController.h"
#import "MBProgressHUD.h"

@interface TwitterViewController ()

@end

@implementation TwitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.TwitterWebView.delegate = self;
    
    // Do any additional setup after loading the view.
    [self customSetup];
    NSURL *url = [NSURL URLWithString:@"http://twitter.com/tahrirlounge"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_TwitterWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{

    [self customizeNavigation];
}

//----------------
-(void) customSetup{
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

//----------------
-(void)webViewDidStartLoad:(UIWebView *)webView{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:_TwitterWebView animated:YES];
    hud.label.text=@"Loading";
}
//-------
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUDForView:_TwitterWebView animated:YES];
}
//---failLoad--------
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)erro{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:_TwitterWebView animated:NO];
    hud.label.text=@"Error";
    
}
//------timeout------

//--------
-(void) customizeNavigation{
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.0/255 green:125.0/255 blue:214.0/255 alpha:1.0];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIImageView *logoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo2"]];
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 53)];
    
    logoImage.frame = titleView.bounds;
    [titleView addSubview:logoImage];
    
    self.navigationItem.titleView = titleView;
    
    _sidebarButton.tintColor = [UIColor whiteColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)GoToBrowser:(id)sender {
    
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"https://www.twitter.com/tahrirlounge"]]){
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.twitter.com/tahrirlounge"]];
    }
    
}
@end
