//
//  VideoVCViewController.m
//  Tutorial
//
//  Created by Burak Firik on 1/4/18.
//  Copyright © 2018 Burak Firik. All rights reserved.
//

#import "VideoVC.h"


@interface VideoVC ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation VideoVC
- (IBAction)donePressed:(id)sender {
  [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.webView.delegate = self;
  
  self.titleLabel.text = self.video.videoTitle;
  self.descLabel.text = self.video.videoDesc;
  [self.webView loadHTMLString:self.video.videoFrame baseURL:nil];
  // Do any additional setup after loading the view.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
  NSString *css = @".container {position: relative; width: 100%; height: 0; padding-bottom: 56.25%; } .video { position: absolute; top: 0; left: 0; width: 100%; height: 100%;}";
  
  NSString* js = [NSString stringWithFormat:
                  @"var styleNode = document.createElement('style');\n"
                  "styleNode.type = \"text/css\";\n"
                  "var styleText = document.createTextNode('%@');\n"
                  "styleNode.appendChild(styleText);\n"
                  "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
  NSLog(@"js:\n%@",js);
  [self.webView stringByEvaluatingJavaScriptFromString:js];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
