# SAVideoRangeSlider
======

iOS UI Control Providing An iMovie Style Video Trim Control.

## Screens
![SAVideoRangeSlider screen](http://solovjev.com/libs/SAVideoRangeSlider/yellow_ipad.png "SAVideoRangeSlider screen")
![SAVideoRangeSlider screen](http://solovjev.com/libs/SAVideoRangeSlider/gray_ipad.png "SAVideoRangeSlider screen")
![SAVideoRangeSlider screen](http://solovjev.com/libs/SAVideoRangeSlider/purple_ipad.png "SAVideoRangeSlider screen")
![SAVideoRangeSlider screen](http://solovjev.com/libs/SAVideoRangeSlider/green_ipad.png "SAVideoRangeSlider screen")
![SAVideoRangeSlider screen](http://solovjev.com/libs/SAVideoRangeSlider/star_ipad.png "SAVideoRangeSlider screen")

![SAVideoRangeSlider screen](http://solovjev.com/libs/SAVideoRangeSlider/yellow_iphone.png "SAVideoRangeSlider screen")      
![SAVideoRangeSlider screen](http://solovjev.com/libs/SAVideoRangeSlider/gray_iphone.png "SAVideoRangeSlider screen")

![SAVideoRangeSlider screen](http://solovjev.com/libs/SAVideoRangeSlider/purple_iphone.png "SAVideoRangeSlider screen")

![SAVideoRangeSlider screen](http://solovjev.com/libs/SAVideoRangeSlider/green_iphone.png "SAVideoRangeSlider screen")

## Youtube video
[![SAVideoRangeSlider youtube](http://solovjev.com/libs/SAVideoRangeSlider/youtube-savideorangeslider.png "Youtube demo")](http://youtu.be/icyx4DMLu6k)  



## Requirements

- iOS 5+,
- ARC.

## Installation

1. Drop `SAVideoRangeSlider` files into your project.
2. Add `QuartzCore.framework`, `AVFoundation.framework`, `CoreMedia.framework` to your project.
3. Add `#import "SAVideoRangeSlider.h"` to use it in a class.


## Example Usage

``` objective-c
SAVideoRangeSlider *mySAVideoRangeSlider = [[SAVideoRangeSlider alloc] initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 70) videoUrl:videoFileUrl ];
[mySAVideoRangeSlider setPopoverBubbleSize:200 height:100];
mySAVideoRangeSlider.delegate = self;
mySAVideoRangeSlider.minGap = 10; // optional, seconds
mySAVideoRangeSlider.maxGap = 30; // optional, seconds
[self.view addSubview:mySAVideoRangeSlider];
```

## Protocols

``` objective-c
- (void)videoRange:(SAVideoRangeSlider *)videoRange didChangeLeftPosition:(CGFloat)leftPosition rightPosition:(CGFloat)rightPosition;
```

``` objective-c
- (void)videoRange:(SAVideoRangeSlider *)videoRange didGestureStateEndedLeftPosition:(CGFloat)leftPosition rightPosition:(CGFloat)rightPosition;
```

## Customization

Use [PaintCode](http://www.paintcodeapp.com/) application to make left/right slider and resizible bubble (see examples in the `PaintCodeFiles`  directory). 

## Contact

Andrei Solovjev

- https://github.com/andrei200287
- andrei@solovjev.com
- http://solovjev.com

## License
SAVideoRangeSlider is available under the MIT license. See the LICENSE file for more info.
