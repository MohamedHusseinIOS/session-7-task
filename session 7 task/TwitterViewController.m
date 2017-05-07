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
#import "navigationBarViewController.h"

@interface TwitterViewController ()

@end

@implementation TwitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.TwitterWebView.delegate = self;
    
    // Do any additional setup after loading the view.
    
    NSURL *url = [NSURL URLWithString:@"http://twitter.com/tahrirlounge"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_TwitterWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{

    navigationBarViewController *navigationBar = [navigationBarViewController new];
    
    UIColor *navigationBarColorBlue = [UIColor colorWithRed:1.0/255 green:125.0/255 blue:214.0/255 alpha:1.0];
    
    [navigationBar customSetup:_sidebarButton :self];
    [navigationBar customizeNavigation:_sidebarButton :self :navigationBarColorBlue];
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
