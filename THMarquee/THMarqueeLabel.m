//
//  THMarqueeLabel.m
//  THMarquee
//
//  Created by BlackTea on 12/10/15.
//  Copyright © 2015 TH. All rights reserved.
//

#import "THMarqueeLabel.h"
@interface THMarqueeLabel ()

@property (nonatomic, strong) THMarqueeLabelLayout *layout;
@property (nonatomic, strong) UILabel *scrollLabel;
@end

@implementation THMarqueeLabel

- (instancetype)initWithLayout:(THMarqueeLabelLayout *)layout{
    
    if (!layout) return nil;
    self = [super initWithFrame:layout.frame];
    if (self) {
        self.layer.masksToBounds = YES;
        self.backgroundColor = layout.backgroundColor;
        //create scroll label
        UILabel *scrollLabel = [UILabel new];
        //set config
        scrollLabel.lineBreakMode = NSLineBreakByWordWrapping;
        scrollLabel.textAlignment = NSTextAlignmentCenter;
        scrollLabel.contentMode = UIViewContentModeCenter;
        //set font
        scrollLabel.font = layout.font;
        scrollLabel.text = layout.text;
        scrollLabel.textColor = layout.textColor;
        [self addSubview:scrollLabel];
        _scrollLabel = scrollLabel;
        _layout = layout;
        
        if (!CGRectEqualToRect(layout.frame, CGRectZero)) [self setScrollConfig];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if (!_layout) return ;
    _layout.frame = frame;
    if (!CGRectEqualToRect(frame, CGRectZero)) {
        [self setScrollConfig];
    }
}

- (void)setText:(NSString *)text
{
    if (!_layout) return ;
    _layout.text = text;
    _scrollLabel.text = text;
    if (!CGRectEqualToRect(_layout.frame, CGRectZero)) {
        [self setScrollConfig];
    }
}

- (void)setScrollConfig
{
    if (_layout.text.length <= 0) return;
    
    
    if (_layout.direction == ScrollDirectionVertical)
    {
        _scrollLabel.numberOfLines = 0;
        CGSize textSize = [[self class] scrollPropertySize:_layout scrollLabel:_scrollLabel];
        _scrollLabel.frame = CGRectMake(0, 0, _layout.frame.size.width, textSize.height);
        
    }
    else
    {
        _scrollLabel.numberOfLines = 1;
        CGSize textSize = [[self class] scrollPropertySize:_layout scrollLabel:_scrollLabel];
        CGFloat textWidth = textSize.width > _layout.frame.size.width ? textSize.width : _layout.frame.size.width;
        _scrollLabel.frame = CGRectMake(0, 0, textWidth, _layout.frame.size.height);
    }
    
    
    [self startAnimation:_scrollLabel layout:_layout];
    
}


+ (CGSize)scrollPropertySize:(THMarqueeLabelLayout *)layout scrollLabel:(UILabel *)scrollLabel
{
    if (layout.direction == ScrollDirectionVertical)
    {
        CGSize textSize = [scrollLabel sizeThatFits:CGSizeMake(layout.frame.size.width, CGFLOAT_MAX)];
        return textSize;
    }
    else
    {
        CGSize textSize = [scrollLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, layout.frame.size.height)];
        return textSize;
    }
    
}

- (void)startAnimation:(UILabel *)scrollLabel layout:(THMarqueeLabelLayout *)layout
{
    CALayer *textLayer = scrollLabel.layer;
    //取消、停止所有的动画
    [textLayer removeAllAnimations];
    
    CGSize textSize = [[self class] scrollPropertySize:layout scrollLabel:scrollLabel];
    
    if (layout.direction == ScrollDirectionVertical) {
        const float limitHeight = self.frame.size.height;
        
        if (textSize.height > limitHeight) {
            float offset = textSize.height - limitHeight;
            
            CABasicAnimation *animation = [CABasicAnimation new];
            animation.duration = layout.duration;
            animation.keyPath = @"transform.translation.y";
            animation.toValue = @(-offset);
            animation.autoreverses = YES;
            animation.repeatDuration = INFINITY;
            [textLayer addAnimation:animation forKey:@"translation"];
        }
        
    }
    else
    {
        const float limitWidth = self.frame.size.width;
        
        if (textSize.width > limitWidth) {
            float offset = textSize.width - limitWidth;
            
            CABasicAnimation *animation = [CABasicAnimation new];
            animation.duration = layout.duration;
            animation.keyPath = @"transform.translation.x";
            animation.toValue = @(-offset);
            animation.autoreverses = YES;
            animation.repeatDuration = INFINITY;
            [textLayer addAnimation:animation forKey:@"translation"];
        }
        
    }
}
@end
