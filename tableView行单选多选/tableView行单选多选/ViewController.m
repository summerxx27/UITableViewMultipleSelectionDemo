//
//  ViewController.m
//  tableView行单选多选
//
//  Created by 景天 on 2019/4/10.
//  Copyright © 2019年 summerxx. All rights reserved.
//

#import "ViewController.h"
#import "JTTableViewCell.h"
#import "JTContactDealTool.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSDictionary *dataDictionary;
@property (nonatomic, strong) NSArray *keys;
@property (nonatomic, strong) NSMutableArray *selectArray;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSMutableDictionary *allValues;

@end

@implementation ViewController
/// 选中的数组
- (NSMutableArray *)selectArray {
    if (!_selectArray) {
        _selectArray = [NSMutableArray array];
    }
    return _selectArray;
}
/// 初始化视图
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.allowsMultipleSelection = YES;
        [_tableView registerClass:[JTTableViewCell class] forCellReuseIdentifier:@"JTTableViewCell"];
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _keys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString *key = [self.keys objectAtIndex:section];
    NSArray *arrayValueForKey = [self.allValues objectForKey:key];
    return arrayValueForKey.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return _keys;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView == self.tableView) {
        UIView *sectionHeader = [[UIView alloc] init];
        sectionHeader.backgroundColor = [UIColor yellowColor];
        UILabel *label = [[UILabel alloc] init];
        label.adjustsFontSizeToFitWidth = YES;
        label.frame = CGRectMake(16, 5, 10, 11);
        [sectionHeader addSubview:label];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        label.text = _keys[section];
        return sectionHeader;
    }else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JTTableViewCell"];
    NSString *key = [self.keys objectAtIndex:indexPath.section];
    NSArray *arrayValueForKey = [self.allValues objectForKey:key];
    cell.titleLabel.text = arrayValueForKey[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.selectArray addObject:[self getCurrentStr:indexPath]];
    NSLog(@"当前选中数组中元素 didSelectRowAtIndexPathSelectArray ==== %@", self.selectArray);
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.selectArray removeObject:[self getCurrentStr:indexPath]];
    NSLog(@"当前选中数组中元素 didDeselectRowAtIndexPathSelectArray ==== %@", self.selectArray);
}

- (NSString *)getCurrentStr:(NSIndexPath *)indexPath {
    NSString *key = [self.keys objectAtIndex:indexPath.section];
    NSArray *arrayValueForKey = [self.allValues objectForKey:key];
    return arrayValueForKey[indexPath.row];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
    
    _dataArray = @[@"A01", @"A02", @"A03", @"A04",
                   @"B01", @"B02", @"B03", @"B04",
                   @"C01", @"C02", @"C03", @"C04",
                   @"D01", @"D02", @"D03", @"D04"
                   ];
    self.keys = [JTContactDealTool sortArrayWithPinYin:_dataArray][@"allKeys"];
    self.allValues = [JTContactDealTool sortArrayWithPinYin:_dataArray][@"infoDic"];
    [self.tableView reloadData];
}


@end
