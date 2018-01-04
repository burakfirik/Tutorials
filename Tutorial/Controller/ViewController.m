//
//  ViewController.m
//  Tutorial
//
//  Created by Burak Firik on 1/4/18.
//  Copyright © 2018 Burak Firik. All rights reserved.
//

#import "ViewController.h"
#import "Video.h"
#import "VideoCell.h"
#import "VideoVC.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray* videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  self.videoList = [[NSArray alloc] init];
  
  [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
    if (dataArray) {
      NSMutableArray *arr = [[NSMutableArray alloc] init];
      for (NSDictionary *d in dataArray) {
        Video * vid = [[Video alloc] init];
        vid.videoTitle = [d objectForKey:@"title"];
        vid.videoDesc =  [d objectForKey:@"description"];
        vid.videoFrame = [d objectForKey:@"iframe"];
        vid.thumnailURL = [d objectForKey:@"thumbnail"];
        [arr addObject:vid];
      }
      self.videoList = arr;
      [self updateTableData];
      
    } else if (errMessage) {
      NSLog(@"Error : %@", errMessage);
    }
  }];
}


-(void) updateTableData {
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.tableView reloadData];
  });
}


-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
  Video *video = [self.videoList objectAtIndex:indexPath.row];
  VideoCell *vidCell = (VideoCell *) cell;
  [vidCell updateUI:video];
 
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
  Video *video = [self.videoList objectAtIndex:indexPath.row];
  [self performSegueWithIdentifier:@"videoVC" sender:video];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  VideoCell* cell = [tableView dequeueReusableCellWithIdentifier:@"main"];
  
  if (!cell) {
    cell = [[VideoCell  alloc] init];
  }
  return cell;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.videoList.count;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  VideoVC *vc = (VideoVC *) segue.destinationViewController;
  Video * video = (Video *) sender;
  vc.video = video;
  
}

@end
