//
//  FLTSharpnessFilter.m
//  FilterLab
//
//  Created by Cody Caldwell on 6/29/14.
//  Copyright (c) 2014 Cody Caldwell. All rights reserved.
//

#import "FLTSharpnessFilter.h"

@implementation FLTSharpnessFilter

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        self.filterName = @"Sharpness";
        self.imageName = @"contrast"; // placeholder
        self.type = FLTToolFilterType;
        self.maximumFilterValue = 4.0;
        self.minimumFilterValue = -1.0;
        self.startingFilterValue = 0.0;
    }
    return self;
}

- (UIImage *)filteredImageWithImage:(UIImage *)image destinationView:(GPUImageView *)imageView intensity:(CGFloat)intensity {
    
    GPUImagePicture *imagePicture = [[GPUImagePicture alloc] initWithImage:image smoothlyScaleOutput:YES];
    
    GPUImageSharpenFilter *sharpnessFilter = [[GPUImageSharpenFilter alloc] init];
    sharpnessFilter.sharpness = intensity;
    [imagePicture addTarget:sharpnessFilter];
    
    [sharpnessFilter addTarget:imageView];
    [sharpnessFilter useNextFrameForImageCapture];
    [sharpnessFilter forceProcessingAtSizeRespectingAspectRatio:imageView.bounds.size];
    [imagePicture processImage];
    return [sharpnessFilter imageFromCurrentFramebuffer];
}

@end
