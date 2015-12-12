//
//  THMarqueeLabelLayout.h
//  THMarquee
//
//  Created by BlackTea on 12/11/15.
//  Copyright © 2015 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,ScrollDirection) {
    ScrollDirectionVertical,
    ScrollDirectionHorizon,
};

@interface THMarqueeLabelLayout : NSObject
@property (nonatomic, assign) CGRect frame;//label 's frame
@property (nonatomic, copy) NSString *text;//text
@property (nonatomic, strong) UIFont *font;//text font,defualt is system size 13 font
@property (nonatomic, strong) UIColor *textColor;//
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign) ScrollDirection direction;//default is ScrollDirectionHorizon;
@property (nonatomic, assign) CFTimeInterval duration; //default is 8.0f
@end
