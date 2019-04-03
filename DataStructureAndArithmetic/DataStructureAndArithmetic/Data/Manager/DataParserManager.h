//
//  DataParserManager.h
//  DataStructureAndArithmetic
//
//  Created by hnbwyh on 17/2/8.
//  Copyright © 2017年 hnbwyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataParserManager : NSObject

@property (nonatomic,strong) NSArray *unSortedArr;

- (NSArray *)loadDataSource;

@end
