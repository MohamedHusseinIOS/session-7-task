//
//  navigationBarViewController.h
//  session 7 task
//
//  Created by GreenRoot on 5/5/17.
//  Copyright © 2017 GreenRoot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface navigationBarViewController : UIViewController


-(void) customSetup :(UIBarButtonItem*)menuButton :(UIViewController*)Selfoff;

-(void) customizeNavigation : (UIBarButtonItem*)MenuButton :(UIViewController*)Selfoff :(UIColor*)navigationBarColor;

@end
