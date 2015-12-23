//
//  showWaterViewController.m
//  XMView
//
//  Created by mifit on 15/12/16.
//  Copyright © 2015年 mifit. All rights reserved.
//

#import "showWaterViewController.h"
#import "XMWaterView.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
@interface showWaterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iv;

@end

@implementation showWaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[[XMWaterView alloc]initWithFrame:CGRectMake(0, 64, 100, 100)];
    self.iv.image = [self img];
}

- (UIImage * )img{
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent: @"20151218143151.mp4"];
    NSString *path2 = [[NSBundle mainBundle]pathForResource:@"videoviewdemo" ofType:@"mp4"];
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL fileURLWithPath:path2] options:nil];
    
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    gen.appliesPreferredTrackTransform = YES;
    
    CMTime time = CMTimeMakeWithSeconds(1, 10);
    
    NSError *error = nil;
    
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:NULL error:&error];
    if (error) {
        NSLog(@"%@",[error localizedDescription]);
    }
    UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
    
    CGImageRelease(image);
    
    return thumb;
}

- (UIImage *)img2{
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent: @"20151218143151.mp4"];
    MPMoviePlayerController *iosMPMovie = [[MPMoviePlayerController alloc]
                                             initWithContentURL:[NSURL fileURLWithPath:path]];
    UIImage *img = [iosMPMovie thumbnailImageAtTime:0.0
                                           timeOption:MPMovieTimeOptionNearestKeyFrame];
    return img;
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
