//
//  Video.h
//  Tutorial
//
//  Created by Burak Firik on 1/4/18.
//  Copyright © 2018 Burak Firik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property(nonatomic, strong) NSString *videoTitle;
@property(nonatomic, strong) NSString *videoDesc;
@property(nonatomic, strong) NSString *videoFrame;
@property(nonatomic, strong) NSString *thumnailURL;
@end
