//
//  DataParserManager.m
//  DataStructureAndArithmetic
//
//  Created by hnbwyh on 17/2/8.
//  Copyright © 2017年 hnbwyh. All rights reserved.
//

#import "DataParserManager.h"

@implementation DataParserManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _unSortedArr = @[@"8",@"6",@"20",@"15",@"3",@"9",@"66",@"33",@"23",@"6"];

    }
    return self;
}


-(NSArray *)loadDataSource{

    NSArray *tmpArr = @[@"选择排序choiceSortOrder",@"选择排序choiceSortOrder2",
                        @"冒泡排序bubblingSortOrder1",@"冒泡排序bubblingSortOrder2",
                        @"插入排序insertSortOrder1",@"插入排序insertSortOrder2",];
    return tmpArr;
}

#pragma mark --- choiceSortOrder
/**
 思路 ：每次在剩余数组元素中筛选出最小值
 漏洞问题: 倘若数组中有相同数值，则结果出错！ [resultArr addObject:r] 会一次性把相同的全部移除
 */
-(NSArray *)choiceSortOrder:(NSArray *)sourceArr{

    NSMutableArray *resultArr = [[NSMutableArray alloc] init];
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:sourceArr];
    for(NSInteger cou = 0;cou < sourceArr.count - 1;cou ++){
        NSString *r = [self choiceMinValueWithArr:tmpArr];
        NSLog(@" r --- > %@",r);
        [tmpArr removeObject:r];
        [resultArr addObject:r];
    }
    return resultArr;
    
}

- (NSString *)choiceMinValueWithArr:(NSArray *)arr{

    NSInteger min = [arr[0] integerValue];
    for (NSInteger cou = 0; cou < arr.count; cou ++) {
        NSInteger tmp = [arr[cou] integerValue];
        if(min >= tmp){
            min = tmp;
        }
    }
    return [NSString stringWithFormat:@"%ld",min];
}

/**
 思路： i j k 三个指针  其中 k 始终指向最小值元素的位置
 1> 每轮循环选择未排序元素中的最小值 ，然后交换到对应位置
 2> 第一轮循环结束，最小值必定在最前面
 3> 对于有 N 个元素的数组，进行 N-1 轮选择之后，完成数组排序
 */
-(NSArray *)choiceSortOrder2:(NSArray *)sourceArr{
    
    NSMutableArray *resultArr = [NSMutableArray arrayWithArray:sourceArr];
    NSInteger i,j,k;
    NSString *tmp = nil;
    for(i = 0;i < sourceArr.count - 1;i ++){
        k = i;
        for (j = i + 1; j < sourceArr.count; j ++) {
            if ([resultArr[k] integerValue] > [resultArr[j] integerValue]) {
                k = j;
            }
        }
        // 将找到的最小值交换到当前循环的最前面
        if (k != i) {
            tmp = resultArr[i];
            resultArr[i] = resultArr[k];
            resultArr[k] = tmp;
        }
        
    }
    return resultArr;
    
}

#pragma mark --- bubblingSortOrder

/**
 实现思路 :
 1> 整个数组，相邻两元素相比较，后者较大则交换
 2> 第一轮比较结束之后，最大值会被交换至数组最后面
 3> 对于有 N 个元素的数组，进行 N-1 轮比较之后，完成数组排序
 */
- (NSArray *)bubblingSortOrder1:(NSArray *)sourceArr{

    NSMutableArray *resultArr = [NSMutableArray arrayWithArray:sourceArr];
    NSInteger i,j;
    NSString *tmpString = nil;
    for (i = 0; i < sourceArr.count - 1; i ++) {
        
        for (j = 0; j < sourceArr.count - 1 - i; j ++) {
            
            if ([resultArr[j] integerValue] > [resultArr[j + 1] integerValue]) {
                tmpString = resultArr[j];
                resultArr[j] = resultArr[j + 1];
                resultArr[j +1] = tmpString;
            }
            
        }

    }
    return resultArr;
}

/**
 优化实现 : 
 若是没有交换，则说明该数组是已经排好的，则可结束代码执行。
 */
- (NSArray *)bubblingSortOrder2:(NSArray *)sourceArr{
    
    NSMutableArray *resultArr = [NSMutableArray arrayWithArray:sourceArr];
    NSInteger i,j;
    NSString *tmpString = nil;
    BOOL isSorted = YES;
    for (i = 0; i < sourceArr.count - 1; i ++) {
        
        for (j = 0; j < sourceArr.count - 1 - i; j ++) {
            
            if ([resultArr[j] integerValue] > [resultArr[j + 1] integerValue]) {
                isSorted = NO;
                tmpString = resultArr[j];
                resultArr[j] = resultArr[j + 1];
                resultArr[j +1] = tmpString;
            }
            
        }
        
        if (isSorted)
            break;
        
    }
    return resultArr;
}

#pragma mark --- insertSortOrder

/**
 实现思路:
 1> 原数组一分为 2 ，分别为 数组A 数组B,其中A数组只有原数组中一个元素，B数组中存有余下所有元素 ，此时可以将A视为有序数组，将B视为无序数组
 2> 一次取出B数组中的元素，排序到A数组中
 3> 遍历一次B数组后的A数组即为对原无序数组的排序
 */
- (NSArray *)insertSortOrder1:(NSArray *)sourceArr{
    
    NSMutableArray *resultArr = [NSMutableArray arrayWithObject:sourceArr[0]];
    NSInteger i,j;
    for (i = 1; i < sourceArr.count; i ++) {
        
        for (j = 0; j < resultArr.count; j ++) {

            if ([sourceArr[i] integerValue] < [resultArr[j] integerValue]) {
                
                [resultArr insertObject:sourceArr[i] atIndex:j];
                break;
                
            }else{
            
                if (j == resultArr.count - 1) {
                    
                    [resultArr insertObject:sourceArr[i] atIndex:j+1];
                    break;
                    
                }
                
            }
            
        }
        
    }
    return resultArr;
}

/**
 实现思路:
 对比于方案一，该方案主要采用指针操作。
 1> 首先找出需要插入的位置 j
 2> 然后对数组进行移动交换等操作
 */
- (NSArray *)insertSortOrder2:(NSArray *)sourceArr{
    
    NSMutableArray *resultArr = [NSMutableArray arrayWithArray:sourceArr];
    NSInteger i,j,k;
    NSString *tmpString = nil;
    for (i = 1; i < resultArr.count; i ++) {
        // 寻找 需要插入的位置
        j = 0;
        while ([resultArr[i] integerValue] > [resultArr[j] integerValue] && j < i) {
            j ++;
        }
        
        // 判断是否需要插入
        if (j != i) {
            tmpString = resultArr[i];
            for (k = i; k > j; k --) {
                resultArr[k] = resultArr[k - 1];
            }
            resultArr[j] = tmpString;
        }
        
    }
    return resultArr;
    
}



//#pragma mark --- bubblingSortOrder
//
//- (void)bubblingSortOrder1:(NSArray *)sourceArr{
//    
//}
//
//#pragma mark --- bubblingSortOrder
//
//- (void)bubblingSortOrder1:(NSArray *)sourceArr{
//    
//}

@end
