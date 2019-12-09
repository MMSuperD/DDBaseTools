//
//  ViewController.m
//  DDBaseToolsDemo
//
//  Created by wangwei on 2019/9/17.
//  Copyright © 2019 SuperD. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",[UIDevice deviceName]);
    
   BOOL hh = [UIDevice instancesRespondToSelector:@selector(currentMode)];
    
    NSLog(@"%d",hh);
}


@end
