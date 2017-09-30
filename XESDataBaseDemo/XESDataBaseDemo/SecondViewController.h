//
//  SecondViewController.h
//  XESDataBaseDemo
//
//  Created by gfy on 2017/6/29.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@end
