//
//  DataParserMainView.h
//  DataStructureAndArithmetic
//
//  Created by hnbwyh on 17/2/8.
//  Copyright © 2017年 hnbwyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataParserMainView;
@protocol DataParserMainViewDelegate <NSObject>
@optional
- (void)dataParserMainView:(DataParserMainView *)dataParserMainView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface DataParserMainView : UIView

@property (nonatomic,weak) id<DataParserMainViewDelegate> delegate;
@property (nonatomic,strong) NSMutableArray *data;
@property (nonatomic,strong) UITableView *tableView;

- (void)reloadView;

@end
