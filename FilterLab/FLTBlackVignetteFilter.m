//
//  FLTBlackVignetteFilter.m
//  FilterLab
//
//  Created by Cody Caldwell on 7/4/14.
//  Copyright (c) 2014 Cody Caldwell. All rights reserved.
//

#import "FLTBlackVignetteFilter.h"
#import "GPUImage.h"

@implementation FLTBlackVignetteFilter

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        self.filterName = @"Black Vignette";
        self.imageName = @"contrast";
        self.type = FLTToolFilterType;
        self.maximumFilterValue = 0.9;
        self.minimumFilterValue = 0.5;
        self.startingFilterValue = 0.5;
        GPUImageVignetteFilter *filter = [[GPUImageVignetteFilter alloc] init];
        filter.vignetteColor = (GPUVector3){ 0.0f, 0.0f, 0.0f };
        self.gpuFilter = filter;
        self.intensity = 0.5;
    }
    return self;
}

- (void)setIntensity:(CGFloat)intensity {
    GPUImageVignetteFilter *filter = (GPUImageVignetteFilter *)self.gpuFilter;
    filter.vignetteEnd = self.minimumFilterValue + (self.maximumFilterValue - intensity);
}

@end
