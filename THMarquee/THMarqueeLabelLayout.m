//
//  THMarqueeLabelLayout.m
//  THMarquee
//
//  Created by BlackTea on 12/11/15.
//  Copyright © 2015 TH. All rights reserved.
//

#import "THMarqueeLabelLayout.h"

@implementation THMarqueeLabelLayout

- (UIFont *)font{
    if (!_font) {
        _font = [UIFont systemFontOfSize:13];
    }
    return _font;
}

- (CFTimeInterval)duration
{
    if (!_duration) {
        _duration = 8.0;
    }
    return _duration;
}

- (UIColor *)textColor
{
    if (!_textColor) {
        _textColor = [UIColor blackColor];
    }
    return _textColor;
}

- (UIColor *)backgroundColor
{
    if (!_backgroundColor) {
        _backgroundColor = [UIColor clearColor];
    }
    return _backgroundColor;
}
@end
