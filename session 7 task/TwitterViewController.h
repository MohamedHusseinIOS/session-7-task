//
//  TwitterViewController.h
//  session 7 task
//
//  Created by GreenRoot on 5/3/17.
//  Copyright © 2017 GreenRoot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *TwitterWebView;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

- (IBAction)GoToBrowser:(id)sender;

@end
