//
//  VideoVCViewController.h
//  Tutorial
//
//  Created by Burak Firik on 1/4/18.
//  Copyright © 2018 Burak Firik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

@interface VideoVC : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) Video *video;

@end
