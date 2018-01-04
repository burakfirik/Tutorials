//
//  VideoCell.m
//  Tutorial
//
//  Created by Burak Firik on 1/4/18.
//  Copyright © 2018 Burak Firik. All rights reserved.
//

#import "VideoCell.h"
#import "Video.h"

@interface VideoCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *cellView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImage;



@end

@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
  self.layer.cornerRadius = 2.0;
  self.layer.shadowColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.8].CGColor;
  
  self.layer.shadowOpacity = 0.9;
  self.layer.shadowRadius = 5.0;
  self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) updateUI: (nonnull Video*) video {
  self.titleLabel.text = video.videoTitle;
  self.descLabel.text = video.videoDesc;
  UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumnailURL]]];
  self.thumbImage.image = image;
}

@end
