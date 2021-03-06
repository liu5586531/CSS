//
//  CollectionCellLayoutViewController.m
//  CSS
//
//  Created by mac on 2018/11/29.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import "CollectionCellLayoutViewController.h"
#import <MineCommonUtils/MineCommonUtils.h>
#import <YogaKit/UIView+Yoga.h>

@interface CollectionCellLayoutViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray <NSString *> * datas;

@end

@implementation CollectionCellLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datas = @[@"UICollectionViewCell"];
    
    UIEdgeInsets edge = controllerSafeInset(SafeAreaScopeNavigationBar, nil);
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.paddingTop = YGPointValue(edge.top);
        layout.paddingLeft = YGPointValue(edge.left);
        layout.paddingBottom = YGPointValue(edge.bottom);
        layout.paddingRight = YGPointValue(edge.right);
    }];
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.isOpenDebug = YES;
    [tableView registerReuseCellClass:[UITableViewCell class]];
    [tableView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1;
    }];
    [self.view.yoga applyLayoutPreservingOrigin:YES];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = _datas[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class currentClass = NSClassFromString([NSString stringWithFormat:@"CollectionCellLayoutExample%ldController", (long)indexPath.row]);
    [self.navigationController pushViewController:[currentClass new] animated:YES];
}

@end
