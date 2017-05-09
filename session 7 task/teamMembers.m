//
//  teamMembers.m
//  TahrirLounge
//
//  Created by Mohamed Ibrahim on 5/6/17.
//  Copyright © 2017 Mohamed Ibrahim. All rights reserved.
//

#import "teamMembers.h"
#import "webService.h"


@implementation teamMembers

+(NSMutableArray*) getAllTeamMembers :(NSArray *) res
{
//    webService* service=[webService new];
//    NSString* apiURL=@"http://209.126.105.42:8001/iosapi/getAllTeamMembers";
//    
//    NSArray *res=[service returnDataFromAPI:apiURL];
//    
   NSMutableArray *returnData=[NSMutableArray new];
    
    for (NSArray *recipeArray in res)
    {
        for (NSDictionary *dict in recipeArray)
        {
            teamMembers * OBJ=[teamMembers new];
            
            OBJ.memberName=[dict objectForKey:@"name"] ;
            
            OBJ.memberPosition=[dict objectForKey:@"position"] ;
            OBJ.memberDecription=[dict objectForKey:@"description"] ;
            
            NSString* imagePath=[dict objectForKey:@"image"] ;
            
            if (imagePath)
            {
                if (!([[imagePath substringToIndex:7] isEqualToString:@"http://"]
                      || [[imagePath substringToIndex:8] isEqualToString:@"https://"]
                      ) ){
                    imagePath=[NSString stringWithFormat:@"http://%@",imagePath ] ;
                }

            }

            OBJ.imagePath=imagePath ;
            
            [returnData addObject:OBJ];
        }
    }
    
    
    return returnData;
}
@end
