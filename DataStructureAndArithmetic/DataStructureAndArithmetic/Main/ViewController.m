//
//  ViewController.m
//  DataStructureAndArithmetic
//
//  Created by hnbwyh on 17/2/8.
//  Copyright © 2017年 hnbwyh. All rights reserved.
//

#import "ViewController.h"
#import "DataParserVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.navigationController pushViewController:[[DataParserVC alloc] init] animated:YES];
    
}

@end
