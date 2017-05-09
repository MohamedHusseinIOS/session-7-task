//
//  webService.m
//  TahrirLounge
//
//  Created by Mohamed Ibrahim on 5/6/17.
//  Copyright © 2017 Mohamed Ibrahim. All rights reserved.
//

#import "webService.h"
#import "teamMembers.h"

@implementation webService



-(NSMutableArray*) returnDataFromAPI: (NSString*) apiURL
{
    // 1
    
    NSURL *url = [NSURL URLWithString:apiURL];
    
     NSMutableArray *returnData=[NSMutableArray new];
    // 2
   dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              // 4: Handle response here
                                              
                                              if (!error)
                                              {
                                                  NSError *JSONError = nil;
                                                  
                                                  NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                                             options:0
                                                                                                               error:&JSONError];
                                                  if (JSONError)
                                                  {
                                                      NSLog(@"Serialization error: %@", JSONError.localizedDescription);
                                                  }
                                                  else
                                                  {
                                                      NSLog(@"Response: %@", dictionary);
                                                      NSArray * values = [dictionary allValues];
                                                      
                                                      for (NSArray *recipeArray in values)
                                                      {
                                                              [returnData addObject:recipeArray];
                                                      }
                                                      NSLog(@"Array: %@", values);
                                                  }
                                              }
                                              else
                                              {
                                                  NSLog(@"Error: %@", error.localizedDescription);
                                              }
                                              
                                              dispatch_semaphore_signal(semaphore);
                                              
                                          }];
    
    // 3
    [downloadTask resume];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return returnData;
}



@end
