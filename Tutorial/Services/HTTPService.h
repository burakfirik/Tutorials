//
//  HTTPService.h
//  Tutorial
//
//  Created by Burak Firik on 1/4/18.
//  Copyright © 2018 Burak Firik. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray* __nullable dataDict, NSString* __nullable errMessage);

@interface HTTPService : NSObject

+ (id) instance;
-(void) getTutorials:(nullable onComplete) completionHandler;
@end
