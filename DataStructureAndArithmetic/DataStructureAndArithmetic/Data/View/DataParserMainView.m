//
//  DataParserMainView.m
//  DataStructureAndArithmetic
//
//  Created by hnbwyh on 17/2/8.
//  Copyright © 2017年 hnbwyh. All rights reserved.
//

#import "DataParserMainView.h"

@interface DataParserMainView () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation DataParserMainView

#pragma mark --- init 

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        frame.origin.y = 0;
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _data = [[NSMutableArray alloc] init];
        [self addSubview:_tableView];
    }
    return self;
}



#pragma mark --- UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{\
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _data[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (_delegate && [_delegate respondsToSelector:@selector(dataParserMainView:didSelectRowAtIndexPath:)]) {
        [_delegate dataParserMainView:self didSelectRowAtIndexPath:indexPath];
    }
    
}


#pragma mark --- setter 

-(void)reloadView{
    [_tableView reloadData];
}

@end
