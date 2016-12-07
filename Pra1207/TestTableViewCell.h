//
//  TestTableViewCell.h
//  Pra1207
//
//  Created by 51jk on 2016/12/7.
//  Copyright © 2016年 51jk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *testL;

@property (weak, nonatomic) IBOutlet UITextField *testTF;

@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@property (weak, nonatomic) IBOutlet UIButton *coverBtn;

@end
