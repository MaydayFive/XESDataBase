//
//  ThirdViewController.m
//  XESDataBaseDemo
//
//  Created by gfy on 2017/7/9.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import "ThirdViewController.h"
#import "XESDataBase.h"
#import "Person.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    

    
//    [self createTable];
//    [self updateString];
    [self testString];
    
}
- (void)createTable {

    XESDataBase *database = [XESDataBase shareDataBase];
    NSString *str = [database xes_getCreateTableSQLStringWithModel:[Person class]];
    NSLog(@"create ===== %@",str);
//    [database xes_createTableWithModel:[Person class]];
    
//    XESDataBase *database = [XESDataBase shareDataBase];
    BOOL isSuccess = [database xes_createTableWithModel:[Person class]];
    NSLog(@"create table === %d",isSuccess);
    
    
}

- (void)updateString  {
    XESDataBase *database = [XESDataBase shareDataBase];
    NSArray *arr = [database xes_getAddColumnSQLStringWithModel:[Person class]];
    NSLog(@"哈哈=== %@",arr);
}
- (void)testString {
    XESDataBase *database = [XESDataBase shareDataBase];
//    NSArray *arr = [database xes_lookupAllTablesInDatabase];
//    NSLog(@"所有表名%@",arr);
//    
//    
//    NSArray *allData = [database xes_lookupTableWithModel:[Person class] whereFormat:nil];
//    NSLog(@"%@",allData);
//    [database xes_deleteTableWithModel:[Person class] whereFormat:nil];
//    NSArray *allData1 = [database xes_lookupTableWithModel:[Person class] whereFormat:nil];
//    NSLog(@"%@",allData1);

    
    Person *person = [[Person alloc]init];
    person.name = @"name_1";
    person.phoneNum = @13412121212;
    person.photoData = [NSData data];
    person.luckyNum = 100;
    person.sex = 0;
    person.age = 24;
    
//    BOOL isSuccess = [database xes_insertTableWithModel:person];
    BOOL isSuccess = [database xes_insertTable:@"Person" dictOrModel:person columnArr:@[@"name",@"age"]];

    NSLog(@"insert data = %d",isSuccess);
    
    
    
    BOOL isAlter = [database xes_alterTable:@"Person" addColumnWithDictOrModel:person];
    
    
    
//    //version 0
//    @property (nonatomic, strong)NSString *name;
//    
//    @property (nonatomic, strong)NSNumber *phoneNum;
//    
//    @property (nonatomic, strong)NSData *photoData;
//    
//    @property (nonatomic, assign)NSInteger luckyNum;
//    
//    @property (nonatomic, assign)BOOL sex;
//    
//    @property (nonatomic, assign)int age;
//    
//    @property (nonatomic, assign)float height;  //float类型存入172.12会变成172.19995, 取值时%.2f等于原值172.12
//    @property (nonatomic, assign)double weight;
//    
//    
//    
//    //version 1
//    @property (nonatomic, strong)NSString *city;
//    
//    @property (nonatomic, assign)int score;
    
    
    
    
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
