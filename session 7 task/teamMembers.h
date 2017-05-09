//
//  teamMembers.h
//  TahrirLounge
//
//  Created by Mohamed Ibrahim on 5/6/17.
//  Copyright © 2017 Mohamed Ibrahim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface teamMembers : NSObject
{
    /*
    NSInteger *id;
    NSString* memberName;
    
    NSString* memberPosition;
    NSString* memberDecription;
    NSString* imagePath;
*/
}
@property NSInteger* id;
@property NSString* memberName;

@property NSString* memberPosition;
@property NSString* memberDecription;
@property NSString* imagePath;

+(NSMutableArray*) getAllTeamMembers :(NSArray *) res;

@end
