//
//  ViewController.m
//  SAVideoRangeSliderExample
//
// Copyright (c) 2013 Andrei Solovjev - http://solovjev.com/
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) SAVideoRangeSlider *mySAVideoRangeSlider;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) AVAssetExportSession *exportSession;
@property (strong, nonatomic) NSString *originalVideoPath;
@property (strong, nonatomic) NSString *tmpVideoPath;
@property (nonatomic) CGFloat startTime;
@property (nonatomic) CGFloat stopTime;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myActivityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *trimBtn;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myActivityIndicator.hidden = YES;
    
    NSString *tempDir = NSTemporaryDirectory();
    self.tmpVideoPath = [tempDir stringByAppendingPathComponent:@"tmpMov.mov"];
    
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    self.originalVideoPath = [mainBundle pathForResource: @"thaiPhuketKaronBeach" ofType: @"MOV"];
    NSURL *videoFileUrl = [NSURL fileURLWithPath:self.originalVideoPath];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        self.mySAVideoRangeSlider = [[SAVideoRangeSlider alloc] initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 70) videoUrl:videoFileUrl ];
        [self.mySAVideoRangeSlider setPopoverBubbleSize:200 height:100];
        
    } else {
        
        self.mySAVideoRangeSlider = [[SAVideoRangeSlider alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 50) videoUrl:videoFileUrl ];
        self.mySAVideoRangeSlider.bubleText.font = [UIFont systemFontOfSize:12];
        [self.mySAVideoRangeSlider setPopoverBubbleSize:120 height:60];
        
    }
    
    // Yellow
    self.mySAVideoRangeSlider.topBorder.backgroundColor = [UIColor colorWithRed: 0.996 green: 0.951 blue: 0.502 alpha: 1];
    self.mySAVideoRangeSlider.bottomBorder.backgroundColor = [UIColor colorWithRed: 0.992 green: 0.902 blue: 0.004 alpha: 1];
    
    // Purple
    //self.mySAVideoRangeSlider.topBorder.backgroundColor = [UIColor colorWithRed: 0.768 green: 0.665 blue: 0.853 alpha: 1];
    //self.mySAVideoRangeSlider.bottomBorder.backgroundColor = [UIColor colorWithRed: 0.535 green: 0.329 blue: 0.707 alpha: 1];
    
    // Gray
    //self.mySAVideoRangeSlider.topBorder.backgroundColor = [UIColor colorWithRed: 0.945 green: 0.945 blue: 0.945 alpha: 1];
    //self.mySAVideoRangeSlider.bottomBorder.backgroundColor = [UIColor colorWithRed: 0.806 green: 0.806 blue: 0.806 alpha: 1];
    
    // Green
    //self.mySAVideoRangeSlider.topBorder.backgroundColor = [UIColor colorWithRed: 0.725 green: 0.879 blue: 0.745 alpha: 1];
    //self.mySAVideoRangeSlider.bottomBorder.backgroundColor = [UIColor colorWithRed: 0.449 green: 0.758 blue: 0.489 alpha: 1];
    
    // Star
    //self.mySAVideoRangeSlider.topBorder.backgroundColor = [UIColor colorWithRed: 1 green: 0.114 blue: 0.114 alpha: 1];
    
    self.mySAVideoRangeSlider.delegate = self;
    
    
    [self.view addSubview:self.mySAVideoRangeSlider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - IBAction
- (IBAction)showOriginalVideo:(id)sender {
    
    [self playMovie:self.originalVideoPath];
    
}


- (IBAction)showTrimmedVideo:(UIButton *)sender {
    
    [self deleteTmpFile];
    
    NSURL *videoFileUrl = [NSURL fileURLWithPath:self.originalVideoPath];
    
    AVAsset *anAsset = [[AVURLAsset alloc] initWithURL:videoFileUrl options:nil];
    NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:anAsset];
    if ([compatiblePresets containsObject:AVAssetExportPresetMediumQuality]) {
        
        self.exportSession = [[AVAssetExportSession alloc]
                              initWithAsset:anAsset presetName:AVAssetExportPresetPassthrough];
        // Implementation continues.
        
        NSURL *furl = [NSURL fileURLWithPath:self.tmpVideoPath];
        
        self.exportSession.outputURL = furl;
        self.exportSession.outputFileType = AVFileTypeQuickTimeMovie;
        
        CMTime start = CMTimeMakeWithSeconds(self.startTime, anAsset.duration.timescale);
        CMTime duration = CMTimeMakeWithSeconds(self.stopTime-self.startTime, anAsset.duration.timescale);
        CMTimeRange range = CMTimeRangeMake(start, duration);
        self.exportSession.timeRange = range;
        
        self.trimBtn.hidden = YES;
        self.myActivityIndicator.hidden = NO;
        [self.myActivityIndicator startAnimating];
        [self.exportSession exportAsynchronouslyWithCompletionHandler:^{
            
            switch ([self.exportSession status]) {
                case AVAssetExportSessionStatusFailed:
                    NSLog(@"Export failed: %@", [[self.exportSession error] localizedDescription]);
                    break;
                case AVAssetExportSessionStatusCancelled:
                    NSLog(@"Export canceled");
                    break;
                default:
                    NSLog(@"NONE");
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.myActivityIndicator stopAnimating];
                        self.myActivityIndicator.hidden = YES;
                        self.trimBtn.hidden = NO;
                        [self playMovie:self.tmpVideoPath];
                    });
                    
                    break;
            }
        }];
        
    }
    
}


#pragma mark - Other
-(void)deleteTmpFile{
    
    NSURL *url = [NSURL fileURLWithPath:self.tmpVideoPath];
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL exist = [fm fileExistsAtPath:url.path];
    NSError *err;
    if (exist) {
        [fm removeItemAtURL:url error:&err];
        NSLog(@"file deleted");
        if (err) {
            NSLog(@"file remove error, %@", err.localizedDescription );
        }
    } else {
        NSLog(@"no file by that name");
    }
}


-(void)playMovie: (NSString *) path{
    NSURL *url = [NSURL fileURLWithPath:path];
    MPMoviePlayerViewController *theMovie = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [self presentMoviePlayerViewControllerAnimated:theMovie];
    theMovie.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    [theMovie.moviePlayer play];
}


#pragma mark - SAVideoRangeSliderDelegate

- (void)videoRange:(SAVideoRangeSlider *)videoRange didChangeLeftPosition:(CGFloat)leftPosition rightPosition:(CGFloat)rightPosition
{
    self.startTime = leftPosition;
    self.stopTime = rightPosition;
    self.timeLabel.text = [NSString stringWithFormat:@"%f - %f", leftPosition, rightPosition];

}






- (void)viewDidUnload {
    [self setMyActivityIndicator:nil];
    [self setTrimBtn:nil];
    [super viewDidUnload];
}
@end
