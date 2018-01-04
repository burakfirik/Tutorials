//
//  VideoCell.h
//  Tutorial
//
//  Created by Burak Firik on 1/4/18.
//  Copyright © 2018 Burak Firik. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Video;

@interface VideoCell : UITableViewCell
-(void) updateUI: (nonnull Video*) video;

@end
