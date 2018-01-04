//
//  HTTPService.m
//  Tutorial
//
//  Created by Burak Firik on 1/4/18.
//  Copyright © 2018 Burak Firik. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:6069"
#define URL_TUTORIALS "/tutorials"

@implementation HTTPService

+(id) instance {
   static HTTPService *sharedIntance = nil;
  @synchronized (self) {
    if (sharedIntance == nil) {
      sharedIntance = [[self alloc] init];
    }
  }
  return sharedIntance;
}

-(void) getTutorials:(nullable onComplete) completionHandler {
  NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORIALS]];
  NSURLSession *session = [NSURLSession sharedSession];
  [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (data != nil) {
      NSError * err;
      NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
      
      if (err == nil) {
        completionHandler(json, nil);
        NSLog(@"JSON %@", json.debugDescription);
      } else {
        completionHandler(nil, @"Data is corrupt");
      }
    } else {
      NSLog(@"Err: %@", error.debugDescription);
      completionHandler(nil, @"Problem connecting to the server");
    }
  }] resume];
}

@end
