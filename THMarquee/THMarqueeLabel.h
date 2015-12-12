//
//  THMarqueeLabel.h
//  THMarquee
//
//  Created by BlackTea on 12/10/15.
//  Copyright © 2015 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THMarqueeLabelLayout.h"
@class THMarqueeLabelLayout;

@interface THMarqueeLabel : UIView
@property (nonatomic, strong) NSString *text;
/**
 *  initial label
 *
 *  @param layout layout model
 *
 *  @return
 */
- (instancetype)initWithLayout:(THMarqueeLabelLayout *)layout;


@end


