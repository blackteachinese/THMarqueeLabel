//
//  ViewController.m
//  THMarquee
//
//  Created by BlackTea on 12/10/15.
//  Copyright © 2015 TH. All rights reserved.
//

#import "ViewController.h"
#import "THMarqueeLabel.h"
#import "THMarqueeLabelLayout.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *nameText = @"6月6日，巴塞罗那队球员庆祝夺冠。当日，在2014-2015赛季欧洲足球冠军联赛决赛中，巴塞罗那队以3比1战胜尤文图斯队，获得冠军，成为历史上第一支两次夺得“三冠王”的球队。新华社记者张帆摄";    

    THMarqueeLabelLayout *layoutVertical = [THMarqueeLabelLayout new];
    layoutVertical.frame = CGRectMake(100, 150, 70, 30);
    layoutVertical.font = [UIFont systemFontOfSize:13];
    layoutVertical.text = nameText;
    layoutVertical.direction = ScrollDirectionVertical;
    
    THMarqueeLabelLayout *layoutHorizon = [THMarqueeLabelLayout new];
    layoutHorizon.frame = CGRectMake(100, 300, 70, 30);
    layoutHorizon.font = [UIFont systemFontOfSize:13];
    layoutHorizon.text = nameText;
    layoutHorizon.direction = ScrollDirectionHorizon;
    
    THMarqueeLabel *marquee = [[THMarqueeLabel alloc] initWithLayout:layoutVertical];
    [self.view addSubview:marquee];
    
    THMarqueeLabel *marqueeHorizon = [[THMarqueeLabel alloc] initWithLayout:layoutHorizon];
    [self.view addSubview:marqueeHorizon];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
