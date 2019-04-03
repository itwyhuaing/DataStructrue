//
//  DataParserVC.m
//  DataStructureAndArithmetic
//
//  Created by hnbwyh on 17/2/8.
//  Copyright © 2017年 hnbwyh. All rights reserved.
//

#import "DataParserVC.h"
#import "DataParserMainView.h"
#import "DataParserManager.h"

@interface DataParserVC () <DataParserMainViewDelegate>

@property (nonatomic,strong) DataParserManager  *manager;
@property (nonatomic,strong) DataParserMainView *mainView;

@end

@implementation DataParserVC

#pragma mark --- life
- (void)viewDidLoad {
    [super viewDidLoad];
    _manager = [[DataParserManager alloc] init];
    CGRect rect = self.view.bounds;
    _mainView = [[DataParserMainView alloc] initWithFrame:rect];
    _mainView.delegate = self;
    [self.view addSubview:_mainView];
    [_mainView.data addObjectsFromArray:[_manager loadDataSource]];
    [_mainView reloadView];
}

#pragma mark --- DataParserMainViewDelegate

-(void)dataParserMainView:(DataParserMainView *)dataParserMainView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *methodString = _mainView.data[indexPath.row];
    methodString = [methodString stringByAppendingString:@":"];
    SEL selector = NSSelectorFromString(methodString);
    if (_manager && [_manager respondsToSelector:selector]) {
        [_manager performSelector:selector withObject:_manager.unSortedArr];
    }
    
}

@end
