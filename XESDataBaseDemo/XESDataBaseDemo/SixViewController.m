//
//  SixViewController.m
//  XESDataBaseDemo
//
//  Created by gfy on 2017/7/18.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import "SixViewController.h"
#import "XESDataBase.h"
#import "SixModel.h"

#import "SixNewModel.h"

@interface SixViewController ()

@end

@implementation SixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn12 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn12 setFrame:CGRectMake(0, 100, 160, 30)];
    [btn12 setTitle:@"字典创建" forState:UIControlStateNormal];
    [btn12 addTarget:self action:@selector(createDictTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn12];
    
    
    UIButton *btn13 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn13 setFrame:CGRectMake(0, 130, 160, 30)];
    [btn13 setTitle:@"字典数据插入" forState:UIControlStateNormal];
    [btn13 addTarget:self action:@selector(insertDictTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn13];

    UIButton *btn14 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn14 setFrame:CGRectMake(0, 160, 160, 30)];
    [btn14 setTitle:@"Model创建" forState:UIControlStateNormal];
    [btn14 addTarget:self action:@selector(createModelTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn14];

    UIButton *btn15 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn15 setFrame:CGRectMake(0, 190, 160, 30)];
    [btn15 setTitle:@"插入Model" forState:UIControlStateNormal];
    [btn15 addTarget:self action:@selector(insertModelTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn15];
    
    UIButton *btn16 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn16 setFrame:CGRectMake(0, 220, 160, 30)];
    [btn16 setTitle:@"Model创建2" forState:UIControlStateNormal];
    [btn16 addTarget:self action:@selector(createModelOtherTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn16];

    
    UIButton *btn17 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn17 setFrame:CGRectMake(0, 250, 160, 30)];
    [btn17 setTitle:@"插入Model2" forState:UIControlStateNormal];
    [btn17 addTarget:self action:@selector(insertModelOtherTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn17];
    
    
    UIButton *btn18 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn18 setFrame:CGRectMake(0, 280, 160, 30)];
    [btn18 setTitle:@"Model New 创建" forState:UIControlStateNormal];
    [btn18 addTarget:self action:@selector(createNewModelTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn18];
    
    
    UIButton *btn19 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn19 setFrame:CGRectMake(0, 310, 160, 30)];
    [btn19 setTitle:@"插入Model New" forState:UIControlStateNormal];
    [btn19 addTarget:self action:@selector(insertNewModelTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn19];
    
    
    UIButton *btn20 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn20 setFrame:CGRectMake(0, 340, 160, 30)];
    [btn20 setTitle:@"从Model New取值是否正常" forState:UIControlStateNormal];
    [btn20 addTarget:self action:@selector(lookUpFromNewModelTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn20];
    
    
    UIButton *btn21 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn21 setFrame:CGRectMake(0, 370, 160, 30)];
    [btn21 setTitle:@"从字典数据插入方式 看取值是否正常" forState:UIControlStateNormal];
    [btn21 addTarget:self action:@selector(lookUpFromDictTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn21];
    
    
    UIButton *btn22 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn22 setFrame:CGRectMake(0, 400, 160, 30)];
    [btn22 setTitle:@"更新数据" forState:UIControlStateNormal];
    [btn22 addTarget:self action:@selector(updateNewModelTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn22];
    
    UIButton *btn23 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn23 setFrame:CGRectMake(0, 430, 160, 30)];
    [btn23 setTitle:@"删除数据" forState:UIControlStateNormal];
    [btn23 addTarget:self action:@selector(deleteDataFromTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn23];
    
    
    
    
//    [self testEncoding];
}
//测试一

- (void)createDictTable {

    NSDictionary *dict = @{@"name":SQL_Type_Text,@"age":SQL_Type_Integer,@"info":SQL_Type_Text};

    XESDataBase *database = [XESDataBase shareDataBase];
    BOOL isSuccess = [database xes_createTable:@"tableNew1" dictOrModel:dict];
    NSLog(@"create Table = %d",isSuccess);
    
}
- (void)insertDictTable{
    
    NSDictionary *dict = @{
                           @"name":@"xiaoming1",
                           @"age":@18,
                           @"info":@[
  
                                   @{
                                       @"city":@"bj",
                                       @"location":@"ceshiyixia"
                                   },
                                   @{
                                       @"city":@"sh",
                                       @"location":@"jjjjjj"
                                    },
                            ]};
    
    XESDataBase *database = [XESDataBase shareDataBase];
    BOOL isSuccess = [database xes_insertTable:@"tableNew1" dictOrModel:dict];
    NSLog(@"insert Table = %d",isSuccess);

}

- (void)lookUpFromDictTable {
    XESDataBase *database = [XESDataBase shareDataBase];
    
    NSArray *arr = [database xes_lookupTable:@"tableNew1" dictOrModel:nil whereFormat:nil];
//    NSDictionary *dict = [arr firstObject];
//    NSString *info = [dict objectForKey:@"info"];
//    NSData *data = [info dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *error ;
//    if (!data) {
//        return;
//    }
//    NSDictionary *ddic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
//    if (error) {
//        NSLog(@"%@",[error localizedDescription]);
//        return;
//    }
//    
//    NSLog(@"ddic = %@",ddic);
    

}

- (void)createModelTable {
    XESDataBase *database = [XESDataBase shareDataBase];
    BOOL isSuccess = [database xes_createTableWithModel:[SixModel class]];
    NSLog(@"create model Table = %d",isSuccess);

}
- (void)insertModelTable {

    XESDataBase *database = [XESDataBase shareDataBase];
    SixModel *person = [[SixModel alloc]init];
    person.name = [NSString stringWithFormat:@"小钱"];
    person.phoneNum = @13412341234;
    person.photoData = [NSData data];
    person.luckyNum = 26;
    person.sex = 1;
    person.age = 23;
    person.height = 176.20;
    person.weight = 79.23;
    
    BOOL isSuccess = [database xes_insertTableWithModel:person];
    NSLog(@"insert model2 Table = %d",isSuccess);
    
}
- (void)createModelOtherTable {
    XESDataBase *database = [XESDataBase shareDataBase];
    BOOL isSuccess = [database xes_createTableWithSupportArrDictDataTypeModel:[SixModel class]];
    NSLog(@"create model Table = %d",isSuccess);
    
    
}

- (void)insertModelOtherTable {
    XESDataBase *database = [XESDataBase shareDataBase];
    SixModel *person = [[SixModel alloc]init];
    person.name = [NSString stringWithFormat:@"小钱"];
    person.phoneNum = @13412341234;
    person.photoData = [NSData data];
    person.luckyNum = 26;
    person.sex = 1;
    person.age = 23;
    person.height = 176.20;
    person.weight = 79.23;
    person.testDic = @{@"location":@"dong da jie",@"city":@"bj",@"province":@"BJ"};
    person.testArr = @[@"1",@"2",@"3",@"4"];
    
    BOOL isSuccess = [database xes_insertTableWithModel:person];
    NSLog(@"insert model2 Table = %d",isSuccess);

    
}


- (void)createNewModelTable {
    
    XESDataBase *database = [XESDataBase shareDataBase];
    BOOL isSuccess = [database xes_createTableWithSupportArrDictDataTypeModel:[SixNewModel class]];
    NSLog(@"create new model Table = %d",isSuccess);
    
}
- (void)insertNewModelTable {
    
    XESDataBase *database = [XESDataBase shareDataBase];
    SixNewOtherModel *model = [[SixNewOtherModel alloc]init];
    model.name = @"小钱Other";
    model.phoneNum = @134444444;
    model.luckyNum = 10;

    SixNewModel *person = [[SixNewModel alloc]init];
    person.name = [NSString stringWithFormat:@"小钱"];
    person.phoneNum = @13412341234;
    person.photoData = [NSData data];
    person.luckyNum = 26;
    person.sex = 1;
    person.age = 23;
    person.height = 176.20;
    person.weight = 79.23;
    person.testDic = @{@"location":@"dong da jie",@"city":@"bj",@"province":@"BJ"};
    person.testArr = @[@{@"test":@"testValue"},@"1",@"2",@"3",@"4"];
    
//    person.sixNewOtherModel = model;
    BOOL isSuccess = [database xes_insertTableWithSupportArrDictDataTypeModel:person];
    NSLog(@"insert new model Table = %d",isSuccess);
    
}

- (void)lookUpFromNewModelTable {
    
    XESDataBase *database = [XESDataBase shareDataBase];
    //    NSArray *arr = [database xes_lookupTableWithModel:[SixNewModel class] whereFormat:nil];
    NSArray *arr = [database xes_lookupSupportArrDictDataTypeTableWithModel:[SixNewModel class] whereFormat:nil];
    
    NSLog(@"arr = %@\n",arr);
    SixNewModel *newModel = [arr firstObject];
    NSLog(@"testDic = %@ \n  testarr = %@",newModel.testDic,newModel.testArr);
}

- (void)updateNewModelTable {

    XESDataBase *database = [XESDataBase shareDataBase];
    SixNewOtherModel *model = [[SixNewOtherModel alloc]init];
    model.name = @"小钱Other";
    model.phoneNum = @134444444;
    model.luckyNum = 10;
    
    SixNewModel *person = [[SixNewModel alloc]init];
    person.name = [NSString stringWithFormat:@"小钱_xx"];
    person.phoneNum = @13412341234;
    person.photoData = [NSData data];
    person.luckyNum = 26;
    person.sex = 1;
    person.age = 24;
    person.height = 176.20;
    person.weight = 79.23;
    person.testDic = @{@"location":@"dong da jie",@"city":@"bj",@"province":@"BJ"};
    person.testArr = @[@{@"test":@"testValue"},@"1",@"2",@"3",@"4"];

    BOOL isUpdateSuccess = [database xes_updateTableWithSupportArrDictDataTypeModel:person whereFormat:@"where name = '%@'",@"小钱"];
    NSLog(@"update new model Table = %d",isUpdateSuccess);
    
}


- (void)deleteDataFromTable {

    XESDataBase *database = [XESDataBase shareDataBase];
    BOOL isSuccess = [database xes_deleteTableWithModel:[SixNewModel class] whereFormat:@"where name = '%@'",@"小钱_xx"];
    NSLog(@"delete  new model Table = %d",isSuccess);

}

- (void)testEncoding {

    SixNewOtherModel *accountModel = [[SixNewOtherModel alloc]init];
    
    accountModel.phoneNum =@123455;
    
    accountModel.name =@"zhangsan";
    
    accountModel.luckyNum = 12;
    
    
    
    
    //创建路径
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)lastObject];
    
    NSLog(@"documents路径：%@",documentPath);
    
    NSString *accountPath = [documentPath stringByAppendingPathComponent:@"Account.data"];
    
    
    
    //存储用户信息
    
    [NSKeyedArchiver archiveRootObject:accountModel toFile:accountPath];
    
    
    
    //读取用户信息
    
    SixNewOtherModel *account = [NSKeyedUnarchiver unarchiveObjectWithFile:accountPath];
    
    NSLog(@"Id:%@",account.phoneNum);
    
    NSLog(@"Id:%@",account.name);
    
    NSLog(@"Id:%ld",account.luckyNum);
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
