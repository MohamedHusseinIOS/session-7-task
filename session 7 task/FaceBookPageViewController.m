//
//  FaceBookPageViewController.m
//  session 7 task
//
//  Created by GreenRoot on 5/3/17.
//  Copyright © 2017 GreenRoot. All rights reserved.
//

#import "FaceBookPageViewController.h"
#import "SWRevealViewController.h"
#import "MBProgressHUD.h"

@interface FaceBookPageViewController ()

@end

@implementation FaceBookPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _facebookWebView.delegate=self;
    // Do any additional setup after loading the view.
    [self customSetup];
    NSURL *url = [NSURL URLWithString:@"https://www.facebook.com/TahrirLounge/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_facebookWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------
-(void) customSetup{
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sideBarButton setTarget:revealViewController];
        [self.sideBarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}
//----------------
-(void)webViewDidStartLoad:(UIWebView *)webView{
   MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:_facebookWebView animated:YES];
    hud.label.text=@"Loading";
}
//-------
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUDForView:_facebookWebView animated:YES];
}
//---failLoad--------
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)erro{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:_facebookWebView animated:NO];
    hud.label.text=@"Error";
    
}
//----timeout----------



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
