
//  SecondViewController.m
//  XESDataBaseDemo
//
//  Created by gfy on 2017/6/29.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import "SecondViewController.h"
#import "XESDataBase.h"
#import "XESMigration.h"
#import "FMDBMigrationManager.h"
#import "StudentNew.h"
#import "Person.h"
#import "School.h"

@interface Student:NSObject

@property (nonatomic, strong)NSString *name;

@property (nonatomic, strong)NSNumber *phoneNum;

@property (nonatomic, strong)NSData *photoData;

@property (nonatomic, assign)NSInteger luckyNum;

@property (nonatomic, assign)BOOL sex;

@property (nonatomic, assign)int age;

@property (nonatomic, assign)float height;

@property (nonatomic, assign)double weight;
@end

@implementation Student


@end

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"XESDataBase   Demo 使用示例";
    [self.mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(dropDataBase)];
    self.navigationItem.rightBarButtonItem = item;
    
    
    [self updateDataBaseNew];
    
}
- (void)updateDataBase {
//    
//    XESDataBase *database = [XESDataBase shareDataBase];
//    [database xes_createTable:@"newTable" dictOrModel:[Student class]];
    
    FMDBMigrationManager * manager = [FMDBMigrationManager managerWithDatabaseAtPath:[XESDataBaseTool getDefaultDataBasePath] migrationsBundle:[NSBundle mainBundle]];
    XESMigration * migration_1 = [[XESMigration alloc]initWithName:@"新增USer表" andVersion:1 andExecuteUpdateArray:@[@"create table User(name text,age integer)"]];//从版本生升级到版本1创建一个User表 带有 name,age 字段
    XESMigration * migration_2 = [[XESMigration alloc]initWithName:@"USer表新增字段email" andVersion:2 andExecuteUpdateArray:@[@"alter table User add email text"]];//给User表添加email字段
    
    XESMigration * migration_3 = [[XESMigration alloc]initWithName:@"tableOne表新增字段email" andVersion:3 andExecuteUpdateArray:@[@"alter table tableOne add email text"]];//给User表添加email字段
    
    [manager addMigration:migration_1];
    [manager addMigration:migration_2];
    [manager addMigration:migration_3];
    
    BOOL resultState=NO;
    NSError * error=nil;
    if (!manager.hasMigrationsTable) {
        resultState=[manager createMigrationsTable:&error];
    }
    resultState=[manager migrateDatabaseToVersion:UINT64_MAX progress:nil error:&error];
    
    
    
}

- (void)updateDataBaseNew {
    
    
    XESDataBase *database = [XESDataBase shareDataBase];
    
    FMDBMigrationManager * manager = [FMDBMigrationManager managerWithDatabaseAtPath:[XESDataBaseTool getDefaultDataBasePath] migrationsBundle:[NSBundle mainBundle]];
    
    NSString *versionOneStr1 = [database xes_getCreateTableSQLStringWithModel:[StudentNew class]];
    NSString *versionOneStr2 = [database xes_getCreateTableSQLStringWithModel:[School class]];

    XESMigration * migration_1 = [[XESMigration alloc]initWithName:@"new add StudentNew and School Table" andVersion:1 andExecuteUpdateArray:@[versionOneStr1,versionOneStr2]];//从版本生升级到版本1创建一个User表 带有 name,age 字段
    
    NSArray *addColumnArr = [database  xes_getAddColumnSQLStringWithModel:[StudentNew class]];
    NSLog(@"哈哈===%@",addColumnArr);
    NSString *versionTwoStr1 = [database xes_getCreateTableSQLStringWithModel:[Person class]];

    NSMutableArray *arr2 = [NSMutableArray arrayWithArray:addColumnArr];
    [arr2 addObject:versionTwoStr1];
    XESMigration * migration_2 = [[XESMigration alloc]initWithName:@"StudentNew表新增几个字段和 Person表创建" andVersion:2 andExecuteUpdateArray:arr2];//给User表添加email字段
//
//    XESMigration * migration_3 = [[XESMigration alloc]initWithName:@"tableOne表新增字段email" andVersion:3 andExecuteUpdateArray:@[@"alter table tableOne add email text"]];//给User表添加email字段
    
    [manager addMigration:migration_1];
    [manager addMigration:migration_2];
//    [manager addMigration:migration_3];
    
    BOOL resultState=NO;
    NSError * error=nil;
    if (!manager.hasMigrationsTable) {
        resultState=[manager createMigrationsTable:&error];
    }
    resultState=[manager migrateDatabaseToVersion:UINT64_MAX progress:nil error:&error];    
    
}

- (void)dropDataBase {
    
    NSString *DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:DocumentsPath];
    for (NSString *fileName in enumerator) {
        [[NSFileManager defaultManager] removeItemAtPath:[DocumentsPath stringByAppendingPathComponent:fileName] error:nil];
    }
    [self showAlert:@"清除文件成功！"];
    
}
#pragma mark UITableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section ==1){
        return 4;
    }
    else if(section == 2){
        return 4;
    }
    else if (section == 3){
        return 4;
    }
    else if (section == 4){
        return 4;
    }
    else if(section == 5){
        return 1;
    }
    else if(section == 6){
        return 2;
    }
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 40.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    label.backgroundColor = [UIColor grayColor];
    if (section == 0) {
        label.text = @"创建表";
    }
    else if (section == 1){
        label.text = @"表格插入数据";
    }
    else if(section == 2){
        label.text = @"表格删除数据";
    }
    else if(section == 3){
        label.text = @"表格更新";
    }
    else if (section == 4){
        label.text = @"表格查询";
    }
    else if (section == 5){
        label.text = @"事务处理操作";
    }
    else if (section == 6){
        label.text = @"其他操作";
    }
    else{
        label.text = [NSString stringWithFormat:@"%ld",(long)section];
    }
    return label;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *iden = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"创建表 tableOne";
        }
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"表 tableOne 插入一条数据";
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"表 tableOne 插入一组数据";
        }
        else if(indexPath.row == 2) {
            cell.textLabel.text = @"表 tableOne 保证线程安全 插入一条数据";
        }
        else if(indexPath.row == 3){
            cell.textLabel.text = @"表 tableOne 异步 线程安全 插入一条数据";
        }
        else{
            cell.textLabel.text = @"表 tableOne 插入其他操作";
        }
        
    }
    else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"删除一条数据";
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"删除全部数据";
        }
        else if (indexPath.row ==2 ){
            cell.textLabel.text = @"线程安全 删除最后一条数据";
        }
        else if (indexPath.row == 3){
            cell.textLabel.text = @"多线程  异步 线程安全  删除一条数据";
        }
        else{
            cell.textLabel.text = @"删除数据其他操作";
        }
    }
    else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"更新name = 小刘的数据";
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"把表中的name全部更新为小强";
        }
        else if (indexPath.row ==2 ){
            cell.textLabel.text = @"线程安全 更新name = 小刘的数据";
        }
        else if (indexPath.row == 3){
            cell.textLabel.text = @"多线程  异步 线程安全  更新name = 小刘的数据";
        }
        else{
            cell.textLabel.text = @"更新数据其他操作";
        }
        
    }
    else if (indexPath.section == 4){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"查找name = 小王的数据";
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"查找表中的全部数据";
        }
        else if (indexPath.row ==2 ){
            cell.textLabel.text = @"线程安全 查找name = 小王的数据";
        }
        else if (indexPath.row == 3){
            cell.textLabel.text = @"多线程  异步 线程安全  查找name = 小王的数据";
        }
        else{
            cell.textLabel.text = @"删除数据其他操作";
        }
        
    }
    else if (indexPath.section == 5){
    
        if (indexPath.row == 0) {
            cell.textLabel.text = @"事务处理插入10000条数据";
        }
        else{
            cell.textLabel.text = @"删除数据其他操作";
        }
    }
    else if (indexPath.section == 6){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"修改表名";
        }
        else if(indexPath.row == 1){
            cell.textLabel.text = @"新增表字段";
        }
        else{
            cell.textLabel.text = @"其他新增表字段";
        }
    }
    else{
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row ==0) {
            [self createTable];
        }
    }
    else if(indexPath.section == 1){
    
        if (indexPath.row == 0) {
            [self insertOneData];
        }
        else if (indexPath.row == 1){
            [self insertMoreData];
        }
        else if (indexPath.row == 2){
            [self threadSafetyInsertOneData];
        }
        else if(indexPath.row == 3){
            [self asyncInsertOneData];
        }
        else {
            
        }
    }
    else if (indexPath.section  == 2){
        switch (indexPath.row) {
            case 0:
                [self deleteOneData];
                break;
            case 1:
                [self deleteAllData];
                break;
            case 2:
                [self deleteInQueue];
                break;
            case 3:
                [self deleteAsync];
                break;
            default:
                break;
        }
    }
    else if (indexPath.section == 3){
        switch (indexPath.row) {
            case 0:
                [self updateData];
                break;
            case 1:
                [self updateOtherData];
                break;
            case 2:
                [self updateDataInQueue];
                break;
            case 3:
                [self updateDataAsyncInQueue];
                break;
            default:
                break;
        }
        
    }
    else if(indexPath.section == 4) {
    
        switch (indexPath.row) {
            case 0:
                [self lookupData];
                break;
            case 1:
                [self lookupAllData];
                break;
            case 2:
                [self lookupDataInQueue];
                break;
            case 3:
                [self lookupDataAsyncInQueue];
                break;
            default:
                break;
        }
    }
    else if(indexPath.section == 5){
        switch (indexPath.row) {
            case 0:
                [self transactionInsertMaxData];
                break;
                
            default:
                break;
        }
        
    }
    else if(indexPath.section == 6){
        switch (indexPath.row) {
            case 0:
                [self changeTableName];
                break;
            case 1:
                [self changeTableAddColumn];
                break;
            default:
                break;
        }
        
    }
}
#pragma mark ****************创建表操作********************

- (void)createTable {
    
    
    XESDataBase *dataBase = [XESDataBase shareDataBase];
    BOOL isExists = [dataBase xes_tableExists:@"tableOne"];
    if (!isExists) {
        BOOL isSuccess = [dataBase xes_createTable:@"tableOne" dictOrModel:@{@"name":SQL_Type_Text,@"sex":SQL_Type_Integer,@"city":SQL_Type_Text,@"desc":SQL_Type_Text,@"weight":SQL_Type_Real,@"height":SQL_Type_Integer}];
        NSString *message =  (isSuccess)?@"创建表成功":@"创建表失败";
        [self showAlert:message];

    }
    else{
        NSLog(@"表格已经存在！");
    }
}
#pragma mark ****************插入操作********************

- (void)insertOneData {
    XESDataBase *dataBase = [XESDataBase shareDataBase];
    BOOL isSuccess = [dataBase xes_insertTable:@"tableOne" dictOrModel:@{@"name":@"小刘",@"sex":@1,@"city":@"北京",@"desc":@"小刘的描述",@"weight":@75.34,@"height":@175}];
    NSString *message =  (isSuccess)?@"插入一条数据 成功":@"插入一条数据  失败";
    [self showAlert:message];
}
- (void)insertMoreData {
    XESDataBase *dataBase = [XESDataBase shareDataBase];
    
    NSArray *arr = [dataBase xes_insertTable:@"tableOne" dicOrModelArray:@[@{@"name":@"小刘1",@"sex":@1,@"city":@"北京1",@"desc":@"小刘1的描述",@"weight":@75.34,@"height":@175},@{@"name":@"小刘2",@"sex":@0,@"city":@"北京2",@"desc":@"小刘2的描述",@"weight":@70.34,@"height":@155}]];
    
//    BOOL isSuccess = [dataBase xes_insertTable:@"tableOne" dictOrModel:@{@"name":@"小刘",@"sex":@1,@"city":@"北京",@"desc":@"小刘的描述",@"weight":@75.34,@"height":@175}];
    
    NSString *message =  ([arr count] <= 0)?@"插入一组数据 成功":@"插入一组数据有  失败";
    [self showAlert:message];
    
}
- (void)threadSafetyInsertOneData {
    XESDataBase *dataBase = [XESDataBase shareDataBase];
    __block BOOL isSuccess;
    [dataBase xes_inDatabase:^{
        isSuccess = [dataBase xes_insertTable:@"tableOne" dictOrModel:@{@"name":@"小里",@"sex":@1,@"city":@"上海",@"desc":@"小里的描述",@"weight":@75.34,@"height":@175}];
    }];
    NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
    [self showAlert:message];
}
-(void)asyncInsertOneData {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        XESDataBase *base = [XESDataBase shareDataBase];
        __block BOOL flag;
        __block BOOL flag1;

        [base xes_inDatabase:^{
            flag = [base xes_insertTable:@"tableOne" dictOrModel:@{@"name":@"小里2",@"sex":@0,@"city":@"上海1",@"desc":@"小里2的描述",@"weight":@75.34,@"height":@175}];
        }];
        NSString *message =  (flag)?@"插入一条数据 成功":@"插入一条数据  失败";
        
        [base xes_inDatabase:^{
            flag1 = [base xes_deleteTable:@"tableOne" whereFormat:@"where %@ = '%@'",@"name",@"小里2"];
        }];
        
        NSLog(@"thread1 = %@",[NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"thread2 = %@",[NSThread currentThread]);
            NSLog(@"%@",message);
        });
    });
    /*
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        XESDataBase *base = [XESDataBase shareDataBase];
        __block BOOL flag;
        [base xes_inDatabase:^{
            flag = [base xes_insertTable:@"tableOne" dictOrModel:@{@"name":@"小里2",@"sex":@0,@"city":@"上海1",@"desc":@"小里2的描述",@"weight":@75.34,@"height":@175}];
        }];
        NSString *message =  (flag)?@"插入一条数据 成功":@"插入一条数据  失败";
        
        NSLog(@"thread1 = %@",[NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"thread2 = %@",[NSThread currentThread]);
            NSLog(@"%@",message);
        });
    });
//    sleep(1);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        XESDataBase *base = [XESDataBase shareDataBase];
        __block BOOL flag;
        [base xes_inDatabase:^{
            flag = [base xes_deleteTable:@"tableOne" whereFormat:@"where %@ = '%@'",@"name",@"小里2"];
        }];
        NSString *message =  (flag)?@"插入一条数据 成功":@"插入一条数据  失败";
        NSLog(@"thread3 = %@",[NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
//            [self showAlert:message];
            NSLog(@"thread4 = %@",[NSThread currentThread]);
            NSLog(@"%@",message);
        });
    });
    */
   
}
#pragma mark ****************删除操作********************

- (void)deleteOneData {

    XESDataBase *database = [XESDataBase shareDataBase];
    /*
     NSUInteger pid = [database lastInsertPrimaryKeyIdFromTableName:@"tableOne"];
     BOOL isSuccess = [database xes_deleteTable:@"tableOne" whereFormat:@"where pkid = %d",pid];

     */
    
    BOOL isSuccess = [database xes_deleteTable:@"tableOne" whereFormat:@"where pkid = (SELECT max(pkid) FROM tableOne)"];
    NSLog(@"delete  one data= = %d",isSuccess);
    
}
- (void)deleteAllData {

    XESDataBase *database = [XESDataBase shareDataBase];
//    BOOL isSuccess = [database xes_deleteAllDataFromTable:@"tableOne"];
    BOOL isSuccess = [database xes_deleteTable:@"tableOne" whereFormat:nil];

    NSLog(@"delete all data = = %d",isSuccess);
}
- (void)deleteInQueue {

    XESDataBase *database = [XESDataBase shareDataBase];
    __block BOOL isSuccess;
    [database xes_inDatabase:^{
        NSUInteger pid = [database lastInsertPrimaryKeyIdFromTableName:@"tableOne"];
        isSuccess = [database xes_deleteTable:@"tableOne" whereFormat:@"where pkid = '%d'",pid];
    }];
    NSLog(@"delete in queue = = %d",isSuccess);
}

- (void)deleteAsync {

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        __block BOOL isSuccess;
        XESDataBase *database = [XESDataBase shareDataBase];
        [database xes_inDatabase:^{
            NSUInteger pid = [database lastInsertPrimaryKeyIdFromTableName:@"tableOne"];
            isSuccess = [database xes_deleteTable:@"tableOne" whereFormat:@"where pkid = '%d'",pid];
        }];
        NSLog(@"delete in async queue = = %d",isSuccess);
    });
}

#pragma mark ****************更新操作********************
- (void)updateData {

    XESDataBase *database = [XESDataBase shareDataBase];
    BOOL isSuccess = [database xes_updateTable:@"tableOne" dictOrModel:@{@"name":@"小平",@"sex":@"1",@"city":@"BJ_New",@"desc":@"this is a new girl ",@"weight":@78.34,@"height":@170} whereFormat:@"where name like '%@'",@"小刘"];
    NSLog(@"update  data = %d",isSuccess);

}
- (void)updateOtherData {

    XESDataBase *database = [XESDataBase shareDataBase];
//    BOOL isSuccess = [database xes_updateTable:@"tableOne" dictOrModel:@{@"name":@"小强",@"sex":@"1",@"city":@"BJ_New",@"desc":@"this is a new girl ",@"weight":@78.34,@"height":@170} whereFormat:@"where name like '%@%%'",@"小里"];
    BOOL isSuccess = [database xes_updateTable:@"tableOne" dictOrModel:@{@"name":@"小强",@"sex":@"1",@"city":@"BJ_New",@"desc":@"this is a new girl ",@"weight":@78.34,@"height":@170} whereFormat:nil];

    NSLog(@"update other data = %d",isSuccess);
}
- (void)updateDataInQueue {
    XESDataBase *database = [XESDataBase shareDataBase];
    
    __block BOOL isSuccess;
    [database xes_inDatabase:^{
        isSuccess = [database xes_updateTable:@"tableOne" dictOrModel:@{@"name":@"小赵",@"sex":@"1",@"city":@"BJ_New",@"desc":@"this is a new girl ",@"weight":@78.34,@"height":@170} whereFormat:@"where name like '%@%%'",@"小刘"];
    }];

    NSLog(@"updateDataInQueue = %d",isSuccess);
}
- (void)updateDataAsyncInQueue {

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        XESDataBase *database = [XESDataBase shareDataBase];
        __block BOOL isSuccess;
        [database xes_inDatabase:^{
            isSuccess = [database xes_updateTable:@"tableOne" dictOrModel:@{@"name":@"小王"} whereFormat:@"where name like '%@'",@"测试"];
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"updateDataInQueue = %d",isSuccess);
        });
        
    });
    
    
}
#pragma mark ****************查找操作********************
- (void)lookupData {

    XESDataBase *database = [XESDataBase shareDataBase];
    NSArray *arr = [database xes_lookupTable:@"tableOne" dictOrModel:nil whereFormat:@"where name = '%@'",@"小王"];
    NSLog(@"lookup all data name = 小王 的数据 === %@",arr);
    
}
- (void)lookupAllData {

    XESDataBase *database = [XESDataBase shareDataBase];
//    NSArray *arr = [database xes_lookupTable:@"tableOne" dictOrModel:@{@"name":@"TEXT",@"height":@"INTEGER",} whereFormat:@""];
//    NSArray *arr = [database xes_lookupTable:@"tableOne" dictOrModel:nil whereFormat:@""];

    NSArray *arr = [database xes_lookupTable:@"tableOne" dictOrModel:[Student class] whereFormat:@""];
    NSLog(@"lookup all data 的数据 === %@",arr);
}
- (void)lookupDataInQueue {
    XESDataBase *database = [XESDataBase shareDataBase];
    [database xes_inDatabase:^{
        NSArray *arr = [database xes_lookupTable:@"tableOne" dictOrModel:nil whereFormat:@"where name = '%@'",@"小王"];
        NSLog(@"lookupDataInQueue all data name = 小王 的数据 === %@",arr);

    }];
}
- (void)lookupDataAsyncInQueue {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        XESDataBase *database = [XESDataBase shareDataBase];
        NSArray *personArr = [database xes_lookupTable:@"tableOne" dictOrModel:nil whereFormat:@"where name = '%@'",@"小王"];
        NSLog(@"(async)name=小王:%@", personArr);
    });
}
#pragma mark ****************事务处理操作********************
- (void)transactionInsertMaxData {

    XESDataBase *database = [XESDataBase shareDataBase];
    [database xes_inTransaction:^(BOOL *rollback) {
        for (int i = 0; i < 1000; i++) {
            NSDictionary *dict = @{@"name":[NSString stringWithFormat:@"小平_%d",i+1],@"sex":(i%2)?@"1":@"0",@"city":@"BJ_New",@"desc":@"this is a new girl ",@"weight":@78.34,@"height":@170};
            
            BOOL flag = [database xes_insertTable:@"tableOne" dictOrModel:dict];
            if (flag == NO) {
                *rollback = YES; //回滚操作
                return; //不加return会一直循环完1000
            }
        }
    }];
    
}
#pragma mark ****************其他操作 处理操作********************
- (void)changeTableName{

    XESDataBase *base = [XESDataBase shareDataBase];
    BOOL isSuccess = [base xes_alterTable:@"tableOne" newTableName:@"tableOneNew"];
    NSLog(@"change table name = %d",isSuccess);
}

- (void)changeTableAddColumn {

    XESDataBase *base = [XESDataBase shareDataBase];
    BOOL isSuccess = [base xes_alterTable:@"tableOne" addColumnWithDictOrModel:@{@"math":SQL_Type_Integer,@"chinese":SQL_Type_Integer}];
    NSLog(@"add table column  = %d",isSuccess);
    
    
}

- (void)showAlert:(NSString *)message {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
    
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
