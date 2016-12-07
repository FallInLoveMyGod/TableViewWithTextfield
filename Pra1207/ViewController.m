//
//  ViewController.m
//  Pra1207
//
//  Created by 51jk on 2016/12/7.
//  Copyright © 2016年 51jk. All rights reserved.
//

#import "ViewController.h"
#import "TestTableViewCell.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate >
{
    UITableView *_tableView;
}
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    for (int i = 100; i < 100 + 20; i ++) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:[NSString stringWithFormat:@"testCell%d",i]];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialTableView];
    
}
- (void)initialTableView {
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //[tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    //TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    TestTableViewCell *cell = nil;
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TestTableViewCell" owner:self options:nil] firstObject];
        //cell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.coverBtn.hidden = YES;
    if (indexPath.row % 3 == 0) {
        //[cell.testTF removeFromSuperview];
        cell.testTF.hidden = YES;
        cell.coverBtn.hidden = NO;
    }
    cell.testBtn.tag = indexPath.row + 1000;
    [cell.testBtn addTarget:self action:@selector(testBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.testTF.delegate = self;

    cell.testTF.tag = 100 + indexPath.row;
    cell.testTF.text = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"testCell%ld",cell.testTF.tag]];
    [[NSUserDefaults standardUserDefaults] synchronize];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (void)testBtnAction:(UIButton *)testBtn {
    switch (testBtn.tag) {
        case 1000:
            NSLog(@"1");
            break;
        case 1001:
            NSLog(@"2");
            break;
        case 1007:
            NSLog(@"7");
            break;
        default:
            break;
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:[NSString stringWithFormat:@"testCell%ld",textField.tag]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
