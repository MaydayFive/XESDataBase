//
//  ViewController.m
//  XESDataBaseDemo
//
//  Created by gfy on 2017/6/13.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import "ViewController.h"
#import "XESDataBase.h"
//#import "XESDataBaseTool.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

#import "SixViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn setFrame:CGRectMake(0, 100, 100, 30)];
//    [btn setTitle:@"创建表" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(createTable) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//    
//    
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn1 setFrame:CGRectMake(0, 130, 100, 30)];
//    [btn1 setTitle:@"删除数据库" forState:UIControlStateNormal];
//    [btn1 addTarget:self action:@selector(dropDataBase) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn1];
//    
//    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn2 setFrame:CGRectMake(0, 160, 100, 30)];
//    [btn2 setTitle:@"获取表字段" forState:UIControlStateNormal];
//    [btn2 addTarget:self action:@selector(getTableSchema) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn2];
//    
//    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn3 setFrame:CGRectMake(0, 190, 100, 30)];
//    [btn3 setTitle:@"插入一条数据" forState:UIControlStateNormal];
//    [btn3 addTarget:self action:@selector(insertOneData) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn3];
//    
//    
//    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn4 setFrame:CGRectMake(0, 220, 100, 30)];
//    [btn4 setTitle:@"delete表数据" forState:UIControlStateNormal];
//    [btn4 addTarget:self action:@selector(deleteData) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn4];
//    
//    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn5 setFrame:CGRectMake(0, 250, 100, 30)];
//    [btn5 setTitle:@"delete所有表数据 清空表" forState:UIControlStateNormal];
//    [btn5 addTarget:self action:@selector(deleteAllData) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn5];
//    
//    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn6 setFrame:CGRectMake(0, 280, 100, 30)];
//    [btn6 setTitle:@"drop表" forState:UIControlStateNormal];
//    [btn6 addTarget:self action:@selector(dropTable) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn6];
//    
//    
//    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn7 setFrame:CGRectMake(0, 310, 100, 30)];
//    [btn7 setTitle:@"update表" forState:UIControlStateNormal];
//    [btn7 addTarget:self action:@selector(updateTable) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn7];
//    
//    UIButton *btn8 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn8 setFrame:CGRectMake(0, 340, 100, 30)];
//    [btn8 setTitle:@"查询表" forState:UIControlStateNormal];
//    [btn8 addTarget:self action:@selector(lookupTable) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn8];
//    
//    
//    UIButton *btn9 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn9 setFrame:CGRectMake(0, 370, 100, 30)];
//    [btn9 setTitle:@"增加表字段" forState:UIControlStateNormal];
//    [btn9 addTarget:self action:@selector(addTableColumn) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn9];
//    
//    UIButton *btn10 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn10 setFrame:CGRectMake(0, 400, 100, 30)];
//    [btn10 setTitle:@"更改表名称" forState:UIControlStateNormal];
//    [btn10 addTarget:self action:@selector(modifyTableName) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn10];
//    
//    
//    UIButton *btn11 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn11 setFrame:CGRectMake(0, 450, 100, 30)];
//    [btn11 setTitle:@"FirstController" forState:UIControlStateNormal];
//    [btn11 addTarget:self action:@selector(jumpToFirstController) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn11];
    
    
    
    
    
    
    UIButton *btn12 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn12 setFrame:CGRectMake(0, 480, 160, 30)];
    [btn12 setTitle:@"SecondController" forState:UIControlStateNormal];
    [btn12 addTarget:self action:@selector(jumpToSecondController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn12];
    
    
    UIButton *btn13 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn13 setFrame:CGRectMake(0, 510, 160, 30)];
    [btn13 setTitle:@"ThirdController" forState:UIControlStateNormal];
    [btn13 addTarget:self action:@selector(jumpToThirdController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn13];
    
    UIButton *btn14 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn14 setFrame:CGRectMake(0, 540, 160, 30)];
    [btn14 setTitle:@"FourController" forState:UIControlStateNormal];
    [btn14 addTarget:self action:@selector(jumpToFourController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn14];
    
    
    UIButton *btn15 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn15 setFrame:CGRectMake(0, 590, 160, 30)];
    [btn15 setTitle:@"FiveController" forState:UIControlStateNormal];
    [btn15 addTarget:self action:@selector(jumpToFiveController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn15];
    
    
    UIButton *btn16 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn16 setFrame:CGRectMake(0, 620, 160, 30)];
    [btn16 setTitle:@"FiveController" forState:UIControlStateNormal];
    [btn16 addTarget:self action:@selector(jumpToSixController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn16];
    
}

- (void)jumpToSixController {

    SixViewController *sixVC = [[SixViewController alloc]init];
    [self.navigationController pushViewController:sixVC animated:YES];
    
    
}
- (void)jumpToFiveController {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    FiveViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"FiveViewController"];
    [self.navigationController pushViewController:webViewController animated:YES];
    
}

- (void)jumpToFourController {
    
//    ThirdViewController *firstVC = [[ThirdViewController alloc]init];
//    [self.navigationController pushViewController:firstVC animated:YES];
    
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    FourViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"FourViewController"];
    [self.navigationController pushViewController:webViewController animated:YES];
    
    
}
- (void)jumpToThirdController {

    ThirdViewController *firstVC = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:firstVC animated:YES];
    
}
- (void)createTable {

    XESDataBase *dataBase = [XESDataBase shareDataBase];
    [dataBase xes_createTable:@"tableOne" dictOrModel:@{@"name":SQL_Type_Text,@"sex":SQL_Type_Integer,@"city":SQL_Type_Text,@"desc":SQL_Type_Text,@"weight":SQL_Type_Real,@"height":SQL_Type_Integer}];
}

- (void)dropDataBase {
    
    NSString *DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:DocumentsPath];
    for (NSString *fileName in enumerator) {
        [[NSFileManager defaultManager] removeItemAtPath:[DocumentsPath stringByAppendingPathComponent:fileName] error:nil];
    }
}
-(void)getTableSchema{
    XESDataBase *dataBase = [XESDataBase shareDataBase];
    NSArray *arr = [dataBase getTableColumnsFromTable:@"tableOne"];
    NSLog(@"arr=== %@",arr);
    

    
}

- (void)insertOneData {

    XESDataBase *dataBase = [XESDataBase shareDataBase];
    BOOL isSuccess = [dataBase xes_insertTable:@"tableOne" dictOrModel:@{@"name":@"小明",@"sex":@"0",@"city":@"BJ",@"desc":@"this is a girl ",@"weight":@75.34,@"height":@175}];
    
    NSLog(@"insert a data === %d",isSuccess);
    
}
- (void)deleteData {

    XESDataBase *dataBase = [XESDataBase shareDataBase];
//    BOOL isSuccess = [dataBase xes_deleteTable:@"tableOne" whereFormat:@"where %@ = '%@' and %@ = '%d'",@"name",@"小明",@"sex",0];
    BOOL isSuccess = [dataBase xes_deleteTable:@"tableOne" whereFormat:@""];
    
    NSLog(@"delete  table  %d",isSuccess);
}
- (void)deleteAllData {
    XESDataBase *dataBase = [XESDataBase shareDataBase];
    BOOL isSuccess = [dataBase xes_deleteAllDataFromTable:@"tableOne"];
    NSLog(@"delete all table  %d",isSuccess);
}
- (void)dropTable {

    XESDataBase *dataBase  = [XESDataBase shareDataBase];
    BOOL isSuccess = [dataBase xes_dropTable:@"tableOne"];
    NSLog(@"drop tableOne  %d",isSuccess);

}
- (void)updateTable {

    XESDataBase *dataBase  = [XESDataBase shareDataBase];
    [dataBase xes_updateTable:@"tableOne" dictOrModel:@{@"name":@"小明NEW",@"sex":@"1",@"city":@"BJ_New",@"desc":@"this is a new girl ",@"weight":@78.34,@"height":@170} whereFormat:@" where %@ = '%@'",@"name",@"小明"];
    
//    XESDataBase *da = [XESDataBase new];//[[XESDataBase alloc]init];

}
- (void)lookupTable {

    XESDataBase *dataBase  = [XESDataBase shareDataBase];

    NSArray *searchArr = [dataBase xes_lookupTable:@"tableOne" dictOrModel:nil whereFormat:@"where city = '%@'",@"BJ_New"];
    NSLog(@"查询：%@",searchArr);
    
}
- (void)addTableColumn {
    XESDataBase *dataBase  = [XESDataBase shareDataBase];
    BOOL isSuccess = [dataBase xes_alterTable:@"tableOneTwo" addColumnWithDictOrModel:@{@"school":SQL_Type_Text,@"county":SQL_Type_Text}];
    NSLog(@"alter table add column ==== %d",isSuccess);
}
- (void)modifyTableName {
    XESDataBase *dataBase  = [XESDataBase shareDataBase];
    [dataBase xes_alterTable:@"tableOne" newTableName:@"tableOneNew"];
    
    
}

- (void)jumpToFirstController {

    FirstViewController *firstVC = [[FirstViewController alloc]init];
    [self.navigationController pushViewController:firstVC animated:YES];
    
}
- (void)jumpToSecondController {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SecondViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self.navigationController pushViewController:webViewController animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
