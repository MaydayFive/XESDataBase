//
//  FourViewController.m
//  XESDataBaseDemo
//
//  Created by gfy on 2017/7/10.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import "FourViewController.h"

#import "XESDataBase.h"
#import "StudentNew.h"
#import "Person.h"
#import "School.h"
#import "Company.h"

#import "FMDBMigrationManager.h"
#import "XESMigration.h"



@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"XESDataBase   Demo 使用示例";
    [self.mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(dropDataBase)];
    self.navigationItem.rightBarButtonItem = item;
    
    
}
#pragma mark UITableView Delegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    else if (section ==1){
        return 8;
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
            cell.textLabel.text = @"创建表 Person";
        }
        else if(indexPath.row == 1){
            cell.textLabel.text = @"使用单例";
        }
        else if (indexPath.row ==2){
            cell.textLabel.text = @"使用initWithPath";
        }
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"表 Person 插入一条数据";
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"表 Person 插入一组数据";
        }
        else if (indexPath.row == 2) {
            cell.textLabel.text = @"表 Person 事务处理 插入一组数据";

        }
        else if(indexPath.row == 3) {
            cell.textLabel.text = @"表 Person 多（7个）线程异步  串行  并行 插入一条数据";
        }
        else if (indexPath.row == 4){
            cell.textLabel.text = @"表 Person 多线程 插入多条数据（批量）";
        }
        else if(indexPath.row == 5){
            cell.textLabel.text = @"表 Person 异步 线程安全 插入一条数据";
        }
        else if(indexPath.row == 6){
            cell.textLabel.text = @"表 Person多线程 异步  串行 插入数据";
        }
        else if(indexPath.row == 7){
            cell.textLabel.text = @"表 Person多线程 异步  并行 插入数据";
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
        else if (indexPath.row == 1){
            [self createDataBaseOne];
        }
        else if (indexPath.row == 2){
            [self createDataBaseTwo];
        }
        else{
        
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
            
            [self insetMoreDataNew];
        }
        else if (indexPath.row == 3){
            [self threadSafetyInsertOneData];
        }
        else if (indexPath.row == 4){
            [self threadSafetyInsertMoreData];
        }
        else if(indexPath.row == 5){
            [self asyncInsertOneData];
        }
        else if(indexPath.row == 6){
        
            [self multiThreadSerialInsertMoreData];
        }
        else if (indexPath.row == 7){
            [self multiThreadParallelInsertMoreData];
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

#pragma mark 创建数据库
- (void)createDataBaseOne {

    XESDataBase *database = [XESDataBase shareDataBase];
    BOOL isSuccess = [database xes_createTableWithModel:[Company class]];
    NSLog(@"%s = %d",__func__ ,isSuccess);    
}

- (void)createDataBaseTwo {

    XESDataBase *database = [[XESDataBase alloc]initWithDBName:DATABASE_DEFAULT_NAME];
    
    BOOL isSuccess = [database xes_createTableWithModel:[School class]];
    NSLog(@"%s = %d",__func__ ,isSuccess);
    
    
}
#pragma mark ****************创建表操作********************


- (void)createTable {

    XESDataBase *dataBase = [XESDataBase shareDataBase];
    BOOL isExists = [dataBase xes_tableExists:@"Person"];
    if (!isExists) {
        BOOL isSuccess = [dataBase xes_createTableWithModel:[Person class]];
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
    
    //    person.desc = @"李克强牵挂贫困地区群众生活。他来到宝鸡秦岭深处的大湾河村，沿着崎岖的山路一连走进几户群众家中，查看家中存粮，询问收入来源、孩子上学、医保低保等情况，并与群众围坐交谈，乡亲们都盼着早日搬出山沟，这样生活、打工、上学、就医等都会更加方便，李克强和他们仔细算起搬迁账，并询问在搬迁中还有哪些困难。李克强叮嘱当地干部说，要按照习近平总书记在深度贫困地区脱贫攻坚座谈会上的讲话精神和党中央、国务院部署，统筹谋划、周密做好脱贫攻坚工作。这里因地制宜发展旅游业和特色农业大有可为，易地扶贫搬迁既要妥善解决村民安置和就业，也要创新思路做好乡村原址开发，这样不仅有利于保护好山区生态，又能使搬迁群众得到更多实惠。秦川机床集团是一家生产高端精密机床和复杂工具的企业。李克强走进车间，得知企业98%的产品按客户要求定制，内部建立了大批“双创”平台，有七、八百员工成为创客，依靠众智有效满足了市场需求，竞争力不断提升。李克强说，现在市场与过去大不一样，个性化需求越来越成为主流，国有企业特别是大企业要推进供给侧结构性改革，在竞争中把握主动，“双创”是大平台。要以更完善的激励机制激发内部创造活力，汇聚各方创新智慧，更好适应市场变化新趋势，深入实施“中国制造2025”，努力攻克关键核心技术，";

//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"123" ofType:@"jpg"];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"IMG_1269" ofType:@"JPG"];

    Person *person = [[Person alloc]init];
    person.name = @"小张";
    person.phoneNum = @13412341234;
    person.photoData = [NSData dataWithContentsOfFile:imagePath];
    person.luckyNum = 16;
    person.sex = 1;
    person.age = 24;
    person.height = 176.20;
    person.weight = 79.23;
    
    NSLog(@"insert a data start %@",[NSDate date]);
    BOOL isSuccess = [dataBase xes_insertTableWithModel:person];    
    NSString *message =  (isSuccess)?@"插入一条数据 成功":@"插入一条数据  失败";
    [self showAlert:message];
    NSLog(@"insert a data end %@",[NSDate date]);
}
- (void)insertMoreData {
    XESDataBase *dataBase = [XESDataBase shareDataBase];
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"123" ofType:@"jpg"];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"IMG_1269" ofType:@"JPG"];
//    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
//    NSData *data = [NSData dataWithContentsOfFile:imagePath];
    
    
    NSString *descp = @"李克强牵挂贫困地区群众生活。他来到宝鸡秦岭深处的大湾河村，沿着崎岖的山路一连走进几户群众家中，查看家中存粮，询问收入来源、孩子上学、医保低保等情况，并与群众围坐交谈，乡亲们都盼着早日搬出山沟，这样生活、打工、上学、就医等都会更加方便，李克强和他们仔细算起搬迁账，并询问在搬迁中还有哪些困难。李克强叮嘱当地干部说，要按照习近平总书记在深度贫困地区脱贫攻坚座谈会上的讲话精神和党中央、国务院部署，统筹谋划、周密做好脱贫攻坚工作。这里因地制宜发展旅游业和特色农业大有可为，易地扶贫搬迁既要妥善解决村民安置和就业，也要创新思路做好乡村原址开发，这样不仅有利于保护好山区生态，又能使搬迁群众得到更多实惠。秦川机床集团是一家生产高端精密机床和复杂工具的企业。李克强走进车间，得知企业98%的产品按客户要求定制，内部建立了大批“双创”平台，有七、八百员工成为创客，依靠众智有效满足了市场需求，竞争力不断提升。李克强说，现在市场与过去大不一样，个性化需求越来越成为主流，国有企业特别是大企业要推进供给侧结构性改革，在竞争中把握主动，“双创”是大平台。要以更完善的激励机制激发内部创造活力，汇聚各方创新智慧，更好适应市场变化新趋势，深入实施“中国制造2025”，努力攻克关键核心技术，推动中国经济在转型升级中迈向中高端。李克强牵挂贫困地区群众生活。他来到宝鸡秦岭深处的大湾河村，沿着崎岖的山路一连走进几户群众家中，查看家中存粮，询问收入来源、孩子上学、医保低保等情况，并与群众围坐交谈，乡亲们都盼着早日搬出山沟，这样生活、打工、上学、就医等都会更加方便，李克强和他们仔细算起搬迁账，并询问在搬迁中还有哪些困难。李克强叮嘱当地干部说，要按照习近平总书记在深度贫困地区脱贫攻坚座谈会上的讲话精神和党中央、国务院部署，统筹谋划、周密做好脱贫攻坚工作。这里因地制宜发展旅游业和特色农业大有可为，易地扶贫搬迁既要妥善解决村民安置和就业，也要创新思路做好乡村原址开发，这样不仅有利于保护好山区生态，又能使搬迁群众得到更多实惠。秦川机床集团是一家生产高端精密机床和复杂工具的企业。李克强走进车间，得知企业98%的产品按客户要求定制，内部建立了大批“双创”平台，有七、八百员工成为创客，依靠众智有效满足了市场需求，竞争力不断提升。李克强说，现在市场与过去大不一样，个性化需求越来越成为主流，国有企业特别是大企业要推进供给侧结构性改革，在竞争中把握主动，“双创”是大平台。要以更完善的激励机制激发内部创造活力，汇聚各方创新智慧，更好适应市场变化新趋势，深入实施“中国制造2025”，努力攻克关键核心技术，推动中国经济在转型升级中迈向中高端。";
    
    
    NSMutableArray *personArr = [NSMutableArray array];
    for (int i = 0; i < 20000;i++) {
//        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"IMG_1269" ofType:@"JPG"];
    
        Person *person = [[Person alloc]init];
        person.name = [NSString stringWithFormat:@"小张_%d",i+1];//@"小张";
        person.phoneNum = @13412341234;
        person.photoData = nil;
        person.luckyNum = 16;
        person.sex = 1;
        person.age = 24;
        person.height = 176.20;
        person.weight = 79.23;
//        person.desc = [NSString stringWithFormat:@"%@",descp];
        person.desc =[NSString stringWithFormat:@"%@%@%@%@%@\n%@%@%@%@%@\n%@%@%@%@%@",descp,descp,descp,descp,descp,descp,descp,descp,descp,descp,descp,descp,descp,descp,descp];
//        person.desc =[NSString stringWithFormat:@"%@%@%@%@%@\n%@%@%@%@%@",descp,descp,descp,descp,descp,descp,descp,descp,descp,descp];
//
//        person.desc =[NSString stringWithFormat:@"%@%@%@%@%@",descp,descp,descp,descp,descp];

        [personArr addObject:person];
    }
    
    NSLog(@"10000条数据插入 开始 ：%@",[NSDate date]);
    NSArray *arr = [dataBase xes_insertTable:@"Person" dicOrModelArray:personArr];
    NSLog(@"10000条数据插入 结束 ：%@",[NSDate date]);
    
    NSString *message =  ([arr count] <= 0)?@"插入一组数据 成功":@"插入一组数据有  失败";
    [self showAlert:message];
    
}
- (void)insetMoreDataNew {

//    XESDataBase *dataBase = [XESDataBase shareDataBase];
    NSLog(@"10000条数据插入 新  开始 ：%@",[NSDate date]);
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"123" ofType:@"jpg"];
    
//    NSString *mDesc = @"李克强牵挂贫困地区群众生活。他来到宝鸡秦岭深处的大湾河村，沿着崎岖的山路一连走进几户群众家中，查看家中存粮，询问收入来源、孩子上学、医保低保等情况，并与群众围坐交谈，乡亲们都盼着早日搬出山沟，这样生活、打工、上学、就医等都会更加方便，李克强和他们仔细算起搬迁账，并询问在搬迁中还有哪些困难。李克强叮嘱当地干部说，要按照习近平总书记在深度贫困地区脱贫攻坚座谈会上的讲话精神和党中央、国务院部署，统筹谋划、周密做好脱贫攻坚工作。这里因地制宜发展旅游业和特色农业大有可为，易地扶贫搬迁既要妥善解决村民安置和就业，也要创新思路做好乡村原址开发，这样不仅有利于保护好山区生态，又能使搬迁群众得到更多实惠。秦川机床集团是一家生产高端精密机床和复杂工具的企业。李克强走进车间，得知企业98%的产品按客户要求定制，内部建立了大批“双创”平台，有七、八百员工成为创客，依靠众智有效满足了市场需求，竞争力不断提升。李克强说，现在市场与过去大不一样，个性化需求越来越成为主流，国有企业特别是大企业要推进供给侧结构性改革，在竞争中把握主动，“双创”是大平台。要以更完善的激励机制激发内部创造活力，汇聚各方创新智慧，更好适应市场变化新趋势，深入实施“中国制造2025”，努力攻克关键核心技术，推动中国经济在转型升级中迈向中高端。李克强牵挂贫困地区群众生活。他来到宝鸡秦岭深处的大湾河村，沿着崎岖的山路一连走进几户群众家中，查看家中存粮，询问收入来源、孩子上学、医保低保等情况，并与群众围坐交谈，乡亲们都盼着早日搬出山沟，这样生活、打工、上学、就医等都会更加方便，李克强和他们仔细算起搬迁账，并询问在搬迁中还有哪些困难。李克强叮嘱当地干部说，要按照习近平总书记在深度贫困地区脱贫攻坚座谈会上的讲话精神和党中央、国务院部署，统筹谋划、周密做好脱贫攻坚工作。这里因地制宜发展旅游业和特色农业大有可为，易地扶贫搬迁既要妥善解决村民安置和就业，也要创新思路做好乡村原址开发，这样不仅有利于保护好山区生态，又能使搬迁群众得到更多实惠。秦川机床集团是一家生产高端精密机床和复杂工具的企业。李克强走进车间，得知企业98%的产品按客户要求定制，内部建立了大批“双创”平台，有七、八百员工成为创客，依靠众智有效满足了市场需求，竞争力不断提升。李克强说，现在市场与过去大不一样，个性化需求越来越成为主流，国有企业特别是大企业要推进供给侧结构性改革，在竞争中把握主动，“双创”是大平台。要以更完善的激励机制激发内部创造活力，汇聚各方创新智慧，更好适应市场变化新趋势，深入实施“中国制造2025”，努力攻克关键核心技术，推动中国经济在转型升级中迈向中高端。";
    
    XESDataBase *dataBase = [XESDataBase shareDataBase];
    NSString *mDesc = @"";
    [dataBase xes_inTransaction:^(BOOL *rollback) {
        for (int i = 0; i < 100000; i++) {
            Person *person = [[Person alloc]init];
            person.name = [NSString stringWithFormat:@"小钱_%d",i + 25000];
            person.phoneNum = @13412341234;
            person.photoData = [NSData data];//[NSData dataWithContentsOfFile:imagePath];
            person.luckyNum = 26;
            person.sex = 1;
            person.age = 23;
            person.height = 176.20;
            person.weight = 79.23;
//            person.desc = [NSString stringWithFormat:@"%@",mDesc];
//            person.desc = [NSString stringWithFormat:@"%@",[mDesc substringToIndex:[mDesc length]/2]];

//            person.desc = [NSString stringWithFormat:@"%@%@%@%@%@",mDesc,mDesc,mDesc,mDesc,mDesc];
            
//            person.desc = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@",mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc];

            person.desc = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@\n%@%@%@%@%@%@%@%@%@%@",mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc,mDesc];

            BOOL flag = [dataBase xes_insertTableWithModel:person];
            if (flag == NO) {
                *rollback = YES; //回滚操作
                return; //不加return会一直循环完1000
            }
        }
    }];
    
    NSLog(@"10000条数据插入 新  结束 ：%@",[NSDate date]);

}


- (void)threadSafetyInsertOneData {
    
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("queue2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue3 = dispatch_get_global_queue(0, 0);
    
    dispatch_queue_t queue4 = dispatch_queue_create("queue4", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue5 = dispatch_queue_create("queue5", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue6 = dispatch_queue_create("queue6", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue7 = dispatch_queue_create("queue7", DISPATCH_QUEUE_SERIAL);
    
    
    dispatch_async(queue1, ^{
        XESDataBase *dataBase = [XESDataBase shareDataBase];
        __block BOOL isSuccess;
        
        Person *person = [[Person alloc]init];
        person.name = [NSString stringWithFormat:@"小钱_%d",10003+20000];//@"小钱";
        person.phoneNum = @13412341234;
        person.photoData = [NSData data];
        person.luckyNum = 26;
        person.sex = 1;
        person.age = 23;
        person.height = 176.20;
        person.weight = 79.23;
        
        [dataBase xes_inDatabase:^{
            isSuccess = [dataBase xes_insertTableWithModel:person];
        }];
        NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
        NSLog(@"queue1 = %@\n",message);
        
        NSLog(@"线程1：%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue2, ^{
        
        Person *person = [[Person alloc]init];
        person.name = [NSString stringWithFormat:@"小钱_%d",10004+20000];//@"小钱";
        person.phoneNum = @13412341234;
        person.photoData = [NSData data];
        person.luckyNum = 26;
        person.sex = 1;
        person.age = 23;
        person.height = 176.20;
        person.weight = 79.23;
        
        XESDataBase *dataBase = [XESDataBase shareDataBase];
        
        __block BOOL isSuccess;
        [dataBase xes_inDatabase:^{
            isSuccess = [dataBase xes_insertTableWithModel:person];
        }];
        NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
        NSLog(@"queue2 = %@\n",message);
        
        NSLog(@"线程2：%@",[NSThread currentThread]);

    });
    
    
    dispatch_async(queue3, ^{
        
        Person *person = [[Person alloc]init];
        person.name = [NSString stringWithFormat:@"小钱_%d",10005+20000];//@"小钱";
        person.phoneNum = @13412341234;
        person.photoData = [NSData data];
        person.luckyNum = 26;
        person.sex = 1;
        person.age = 23;
        person.height = 176.20;
        person.weight = 79.23;
        
        XESDataBase *dataBase = [XESDataBase shareDataBase];
        
        __block BOOL isSuccess;
        [dataBase xes_inDatabase:^{
            isSuccess = [dataBase xes_insertTableWithModel:person];
        }];
        NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
        NSLog(@"queue3 = %@\n",message);
        NSLog(@"线程3：%@",[NSThread currentThread]);

    });
    
    
    dispatch_async(queue4, ^{
        
        Person *person = [[Person alloc]init];
        person.name = [NSString stringWithFormat:@"小钱_%d",10005+20000];//@"小钱";
        person.phoneNum = @13412341234;
        person.photoData = [NSData data];
        person.luckyNum = 26;
        person.sex = 1;
        person.age = 23;
        person.height = 176.20;
        person.weight = 79.23;
        
        XESDataBase *dataBase = [XESDataBase shareDataBase];
        
        __block BOOL isSuccess;
        [dataBase xes_inDatabase:^{
            isSuccess = [dataBase xes_insertTableWithModel:person];
        }];
        NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
        NSLog(@"queue4 = %@\n",message);
        NSLog(@"线程4：%@",[NSThread currentThread]);
        
    });
    
    
    dispatch_async(queue5, ^{
        
        Person *person = [[Person alloc]init];
        person.name = [NSString stringWithFormat:@"小钱_%d",10005+20000];//@"小钱";
        person.phoneNum = @13412341234;
        person.photoData = [NSData data];
        person.luckyNum = 26;
        person.sex = 1;
        person.age = 23;
        person.height = 176.20;
        person.weight = 79.23;
        
        XESDataBase *dataBase = [XESDataBase shareDataBase];
        
        __block BOOL isSuccess;
        [dataBase xes_inDatabase:^{
            isSuccess = [dataBase xes_insertTableWithModel:person];
        }];
        NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
        NSLog(@"queue5 = %@\n",message);
        NSLog(@"线程5：%@",[NSThread currentThread]);
        
    });
    
    
    

    dispatch_async(queue6, ^{
        
        Person *person = [[Person alloc]init];
        person.name = [NSString stringWithFormat:@"小钱_%d",10005+20000];//@"小钱";
        person.phoneNum = @13412341234;
        person.photoData = [NSData data];
        person.luckyNum = 26;
        person.sex = 1;
        person.age = 23;
        person.height = 176.20;
        person.weight = 79.23;
        
        XESDataBase *dataBase = [XESDataBase shareDataBase];
        
        __block BOOL isSuccess;
        [dataBase xes_inDatabase:^{
            isSuccess = [dataBase xes_insertTableWithModel:person];
        }];
        NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
        NSLog(@"queue6 = %@\n",message);
        NSLog(@"线程6：%@",[NSThread currentThread]);
        
    });
    
    
    dispatch_async(queue7, ^{
        
        Person *person = [[Person alloc]init];
        person.name = [NSString stringWithFormat:@"小钱_%d",10005+20000];//@"小钱";
        person.phoneNum = @13412341234;
        person.photoData = [NSData data];
        person.luckyNum = 26;
        person.sex = 1;
        person.age = 23;
        person.height = 176.20;
        person.weight = 79.23;
        
        XESDataBase *dataBase = [XESDataBase shareDataBase];
        
        __block BOOL isSuccess;
        [dataBase xes_inDatabase:^{
            isSuccess = [dataBase xes_insertTableWithModel:person];
        }];
        NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
        NSLog(@"queue7 = %@\n",message);
        NSLog(@"线程7：%@",[NSThread currentThread]);
        
    });

//
    
//    for (int i = 0; i< 1000; i++) {
//        
//        NSString *queueName = [NSString stringWithFormat:@"queue_%d",i];
//        dispatch_queue_t queue = dispatch_queue_create([queueName UTF8String], DISPATCH_QUEUE_SERIAL);
//        
//        
//        dispatch_async(queue, ^{
//            
//            Person *person = [[Person alloc]init];
//            person.name = [NSString stringWithFormat:@"小钱_%d",i+50000];//@"小钱";
//            person.phoneNum = @13412341234;
//            person.photoData = [NSData data];
//            person.luckyNum = 26;
//            person.sex = 1;
//            person.age = 23;
//            person.height = 176.20;
//            person.weight = 79.23;
//            
//            XESDataBase *dataBase = [XESDataBase shareDataBase];
//            NSLog(@"名称：%s =  时间开始：%@",[queueName UTF8String],[NSDate date]);
//            __block BOOL isSuccess;
//            [dataBase xes_inDatabase:^{
//                isSuccess = [dataBase xes_insertTableWithModel:person];
//            }];
//            
//            
//            NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
////            NSLog(@"queue_%d = %@\n",i,message);
////            NSLog(@"queue_%d   线程：%@  ===== %@",i,[NSThread currentThread],message);
//
//            NSLog(@"线程：%@ =  时间结束：%@",[NSThread currentThread],[NSDate date]);
//        });
//
//    }
    
    
    
    
    
    
    for (int i = 0; i< 1000; i++) {
        NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(thread) object:@[@"1",@"2"]];
        thread.name = [NSString stringWithFormat:@"%d",i];
        [thread start];
    }

}
//多个线程 串行
- (void)multiThreadSerialInsertMoreData {

    NSString *mDesc = @"李克强牵挂贫困地区群众生活。他来到宝鸡秦岭深处的大湾河村，沿着崎岖的山路一连走进几户群众家中，查看家中存粮，询问收入来源、孩子上学、医保低保等情况，并与群众围坐交谈，乡亲们都盼着早日搬出山沟，这样生活、打工、上学、就医等都会更加方便，李克强和他们仔细算起搬迁账，并询问在搬迁中还有哪些困难。李克强叮嘱当地干部说，要按照习近平总书记在深度贫困地区脱贫攻坚座谈会上的讲话精神和党中央、国务院部署，统筹谋划、周密做好脱贫攻坚工作。这里因地制宜发展旅游业和特色农业大有可为，易地扶贫搬迁既要妥善解决村民安置和就业，也要创新思路做好乡村原址开发，这样不仅有利于保护好山区生态，又能使搬迁群众得到更多实惠。秦川机床集团是一家生产高端精密机床和复杂工具的企业。李克强走进车间，得知企业98%的产品按客户要求定制，内部建立了大批“双创”平台，有七、八百员工成为创客，依靠众智有效满足了市场需求，竞争力不断提升。李克强说，现在市场与过去大不一样，个性化需求越来越成为主流，国有企业特别是大企业要推进供给侧结构性改革，在竞争中把握主动，“双创”是大平台。要以更完善的激励机制激发内部创造活力，汇聚各方创新智慧，更好适应市场变化新趋势，深入实施“中国制造2025”，努力攻克关键核心技术，推动中国经济在转型升级中迈向中高端。李克强牵挂贫困地区群众生活。他来到宝鸡秦岭深处的大湾河村，沿着崎岖的山路一连走进几户群众家中，查看家中存粮，询问收入来源、孩子上学、医保低保等情况，并与群众围坐交谈，乡亲们都盼着早日搬出山沟，这样生活、打工、上学、就医等都会更加方便，李克强和他们仔细算起搬迁账，并询问在搬迁中还有哪些困难。李克强叮嘱当地干部说，要按照习近平总书记在深度贫困地区脱贫攻坚座谈会上的讲话精神和党中央、国务院部署，统筹谋划、周密做好脱贫攻坚工作。这里因地制宜发展旅游业和特色农业大有可为，易地扶贫搬迁既要妥善解决村民安置和就业，也要创新思路做好乡村原址开发，这样不仅有利于保护好山区生态，又能使搬迁群众得到更多实惠。秦川机床集团是一家生产高端精密机床和复杂工具的企业。李克强走进车间，得知企业98%的产品按客户要求定制，内部建立了大批“双创”平台，有七、八百员工成为创客，依靠众智有效满足了市场需求，竞争力不断提升。李克强说，现在市场与过去大不一样，个性化需求越来越成为主流，国有企业特别是大企业要推进供给侧结构性改革，在竞争中把握主动，“双创”是大平台。要以更完善的激励机制激发内部创造活力，汇聚各方创新智慧，更好适应市场变化新趋势，深入实施“中国制造2025”，努力攻克关键核心技术，推动中国经济在转型升级中迈向中高端。";
    
    
    NSLog(@"循环1000次创建线程  时间开始：%@",[NSDate date]);
    
    
    for (int i = 0; i< 10; i++) {
        
        NSString *queueName = [NSString stringWithFormat:@"queue_%d",i];
        dispatch_queue_t queue = dispatch_queue_create([queueName UTF8String], DISPATCH_QUEUE_SERIAL);
        dispatch_async(queue, ^{
            
            Person *person = [[Person alloc]init];
            person.name = [NSString stringWithFormat:@"小钱_%d",i+50000];//@"小钱";
            person.phoneNum = @13412341234;
            person.photoData = [NSData data];
            person.luckyNum = 26;
            person.sex = 1;
            person.age = 23;
            person.height = 176.20;
            person.weight = 79.23;
            person.desc = mDesc;
            
            XESDataBase *dataBase = [XESDataBase shareDataBase];
            NSLog(@"名称：%s =  时间开始：%@",[queueName UTF8String],[NSDate date]);
            __block BOOL isSuccess;
            [dataBase xes_inDatabase:^{
                isSuccess = [dataBase xes_insertTableWithModel:person];
            }];
            
            NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
            NSLog(@"%@",message);
            NSLog(@"线程：%@ =  时间结束：%@",[NSThread currentThread],[NSDate date]);
        });
        
    }

    
}
//多个线程  并行
- (void)multiThreadParallelInsertMoreData {

    NSString *mDesc = @"李克强牵挂贫困地区群众生活。他来到宝鸡秦岭深处的大湾河村，沿着崎岖的山路一连走进几户群众家中，查看家中存粮，询问收入来源、孩子上学、医保低保等情况，并与群众围坐交谈，乡亲们都盼着早日搬出山沟，这样生活、打工、上学、就医等都会更加方便，李克强和他们仔细算起搬迁账，并询问在搬迁中还有哪些困难。李克强叮嘱当地干部说，要按照习近平总书记在深度贫困地区脱贫攻坚座谈会上的讲话精神和党中央、国务院部署，统筹谋划、周密做好脱贫攻坚工作。这里因地制宜发展旅游业和特色农业大有可为，易地扶贫搬迁既要妥善解决村民安置和就业，也要创新思路做好乡村原址开发，这样不仅有利于保护好山区生态，又能使搬迁群众得到更多实惠。秦川机床集团是一家生产高端精密机床和复杂工具的企业。李克强走进车间，得知企业98%的产品按客户要求定制，内部建立了大批“双创”平台，有七、八百员工成为创客，依靠众智有效满足了市场需求，竞争力不断提升。李克强说，现在市场与过去大不一样，个性化需求越来越成为主流，国有企业特别是大企业要推进供给侧结构性改革，在竞争中把握主动，“双创”是大平台。要以更完善的激励机制激发内部创造活力，汇聚各方创新智慧，更好适应市场变化新趋势，深入实施“中国制造2025”，努力攻克关键核心技术，推动中国经济在转型升级中迈向中高端。李克强牵挂贫困地区群众生活。他来到宝鸡秦岭深处的大湾河村，沿着崎岖的山路一连走进几户群众家中，查看家中存粮，询问收入来源、孩子上学、医保低保等情况，并与群众围坐交谈，乡亲们都盼着早日搬出山沟，这样生活、打工、上学、就医等都会更加方便，李克强和他们仔细算起搬迁账，并询问在搬迁中还有哪些困难。李克强叮嘱当地干部说，要按照习近平总书记在深度贫困地区脱贫攻坚座谈会上的讲话精神和党中央、国务院部署，统筹谋划、周密做好脱贫攻坚工作。这里因地制宜发展旅游业和特色农业大有可为，易地扶贫搬迁既要妥善解决村民安置和就业，也要创新思路做好乡村原址开发，这样不仅有利于保护好山区生态，又能使搬迁群众得到更多实惠。秦川机床集团是一家生产高端精密机床和复杂工具的企业。李克强走进车间，得知企业98%的产品按客户要求定制，内部建立了大批“双创”平台，有七、八百员工成为创客，依靠众智有效满足了市场需求，竞争力不断提升。李克强说，现在市场与过去大不一样，个性化需求越来越成为主流，国有企业特别是大企业要推进供给侧结构性改革，在竞争中把握主动，“双创”是大平台。要以更完善的激励机制激发内部创造活力，汇聚各方创新智慧，更好适应市场变化新趋势，深入实施“中国制造2025”，努力攻克关键核心技术，推动中国经济在转型升级中迈向中高端。";
    
    
    NSLog(@"循环1000次创建线程  时间开始：%@",[NSDate date]);
    
    
    for (int i = 0; i< 1000; i++) {
        
        NSString *queueName = [NSString stringWithFormat:@"queue_%d",i];
        dispatch_queue_t queue = dispatch_queue_create([queueName UTF8String], DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(queue, ^{
            
            Person *person = [[Person alloc]init];
            person.name = [NSString stringWithFormat:@"小钱_%d",i+50000];//@"小钱";
            person.phoneNum = @13412341234;
            person.photoData = [NSData data];
            person.luckyNum = 26;
            person.sex = 1;
            person.age = 23;
            person.height = 176.20;
            person.weight = 79.23;
            person.desc = mDesc;
            
            XESDataBase *dataBase = [XESDataBase shareDataBase];
            NSLog(@"名称：%s =  时间开始：%@",[queueName UTF8String],[NSDate date]);
            __block BOOL isSuccess;
            [dataBase xes_inDatabase:^{
                isSuccess = [dataBase xes_insertTableWithModel:person];
            }];
            
            NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
            NSLog(@"%@",message);
            NSLog(@"线程：%@ =  时间结束：%@",[NSThread currentThread],[NSDate date]);
        });
        
    }

}
- (void)thread {

    
    NSThread *thread = [NSThread currentThread];
    if ([thread.name intValue] <500) {
        
        Person *person = [[Person alloc]init];
        person.name = [NSString stringWithFormat:@"小钱_%@",thread.name];//@"小钱";
        person.phoneNum = @13412341234;
        person.photoData = [NSData data];
        person.luckyNum = 26;
        person.sex = 1;
        person.age = 23;
        person.height = 176.20;
        person.weight = 79.23;
        
        XESDataBase *dataBase = [XESDataBase shareDataBase];
        
        __block BOOL isSuccess;
        [dataBase xes_inDatabase:^{
            isSuccess = [dataBase xes_insertTableWithModel:person];
        }];
        
        NSString *message =  (isSuccess)?@"线程安全 插入一条数据 成功":@"线程安全  插入一条数据  失败";
        //            NSLog(@"queue_%d = %@\n",i,message);
        NSLog(@"%@  线程：%@  ===== %@",thread.name,[NSThread currentThread],message);
    }
    else if ([thread.name intValue] < 600){
    
        XESDataBase *database = [XESDataBase shareDataBase];
        __block BOOL isSuccess;
        [database xes_inDatabase:^{
        
            isSuccess = [database xes_deleteTableWithModel:[Person class] whereFormat:nil];
            
        }];
        
        NSString *message =  (isSuccess)?@"线程安全 删除数据 成功":@"线程安全  删除数据  失败";
        //            NSLog(@"queue_%d = %@\n",i,message);
        NSLog(@"%@  线程：%@  ===== %@",thread.name,[NSThread currentThread],message);
        
    }
    else if ([thread.name intValue] < 900){
    
        XESDataBase *database = [XESDataBase shareDataBase];

        [database xes_inDatabase:^{
            
            NSArray *arr = [database xes_lookupTableWithModel:[Person class] whereFormat:nil];
            
            NSString *message =  ([arr count]>0)?@"线程安全 查询数据 成功":@"线程安全  查询数据  为空";
            //            NSLog(@"queue_%d = %@\n",i,message);
            NSLog(@"%@  线程：%@  ===== %@",thread.name,[NSThread currentThread],message);
        }];
        
       
    }
    else{
    
        Person *person = [[Person alloc]init];
        person.name = [NSString stringWithFormat:@"小钱_%@",thread.name];//@"小钱";
        person.phoneNum = @13412341234;
        person.photoData = [NSData data];
        person.luckyNum = 26;
        person.sex = 1;
        person.age = 23;
        person.height = 176.20;
        person.weight = 79.23;
        
        XESDataBase *dataBase = [XESDataBase shareDataBase];
        
        __block BOOL isSuccess;
        [dataBase xes_inDatabase:^{
            
//            isSuccess = [dataBase xes_insertTableWithModel:person];
            isSuccess = [dataBase xes_updateTableWithModel:person whereFormat:nil];
        }];
        
        NSString *message =  (isSuccess)?@"线程安全 更新数据 成功":@"线程安全  更新数据  失败";
        //            NSLog(@"queue_%d = %@\n",i,message);
        NSLog(@"%@  线程：%@  ===== %@",thread.name,[NSThread currentThread],message);
        
    }
    
}
- (void)threadSafetyInsertMoreData {

    
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", NULL);
    dispatch_queue_t queue2 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue3 = dispatch_get_main_queue();

    dispatch_async(queue1, ^{

        XESDataBase *dataBase = [XESDataBase shareDataBase];
        [dataBase xes_inDatabase:^{
            NSMutableArray *personArr = [NSMutableArray array];
            for (int i = 0; i < 10000;i++) {
                Person *person = [[Person alloc]init];
                person.name = [NSString stringWithFormat:@"小张_%d",i+1];//@"小张";
                person.phoneNum = @13412341234;
                person.photoData = nil;
                person.luckyNum = 16;
                person.sex = 1;
                person.age = 24;
                person.height = 176.20;
                person.weight = 79.23;
                person.desc = @"李克强牵挂贫困地区群众生活。他来到宝鸡秦岭深处的大湾河村，沿着崎岖的山路一连走进几户群众家中，查看家中存粮，询问收入来源、孩子上学、医保低保等情况，并与群众围坐交谈，乡亲们都盼着早日搬出山沟，这样生活、打工、上学、就医等都会更加方便，李克强和他们仔细算起搬迁账，并询问在搬迁中还有哪些困难。李克强叮嘱当地干部说，要按照习近平总书记在深度贫困地区脱贫攻坚座谈会上的讲话精神和党中央、国务院部署，统筹谋划、周密做好脱贫攻坚工作。这里因地制宜发展旅游业和特色农业大有可为，易地扶贫搬迁既要妥善解决村民安置和就业，也要创新思路做好乡村原址开发，这样不仅有利于保护好山区生态，又能使搬迁群众得到更多实惠。秦川机床集团是一家生产高端精密机床和复杂工具的企业。李克强走进车间，得知企业98%的产品按客户要求定制，内部建立了大批“双创”平台，有七、八百员工成为创客，依靠众智有效满足了市场需求，竞争力不断提升。李克强说，现在市场与过去大不一样，个性化需求越来越成为主流，国有企业特别是大企业要推进供给侧结构性改革，在竞争中把握主动，“双创”是大平台。要以更完善的激励机制激发内部创造活力，汇聚各方创新智慧，更好适应市场变化新趋势，深入实施“中国制造2025”，努力攻克关键核心技术，推动中国经济在转型升级中迈向中高端。李克强牵挂贫困地区群众生活。他来到宝鸡秦岭深处的大湾河村，沿着崎岖的山路一连走进几户群众家中，查看家中存粮，询问收入来源、孩子上学、医保低保等情况，并与群众围坐交谈，乡亲们都盼着早日搬出山沟，这样生活、打工、上学、就医等都会更加方便，李克强和他们仔细算起搬迁账，并询问在搬迁中还有哪些困难。李克强叮嘱当地干部说，要按照习近平总书记在深度贫困地区脱贫攻坚座谈会上的讲话精神和党中央、国务院部署，统筹谋划、周密做好脱贫攻坚工作。这里因地制宜发展旅游业和特色农业大有可为，易地扶贫搬迁既要妥善解决村民安置和就业，也要创新思路做好乡村原址开发，这样不仅有利于保护好山区生态，又能使搬迁群众得到更多实惠。秦川机床集团是一家生产高端精密机床和复杂工具的企业。李克强走进车间，得知企业98%的产品按客户要求定制，内部建立了大批“双创”平台，有七、八百员工成为创客，依靠众智有效满足了市场需求，竞争力不断提升。李克强说，现在市场与过去大不一样，个性化需求越来越成为主流，国有企业特别是大企业要推进供给侧结构性改革，在竞争中把握主动，“双创”是大平台。要以更完善的激励机制激发内部创造活力，汇聚各方创新智慧，更好适应市场变化新趋势，深入实施“中国制造2025”，努力攻克关键核心技术，推动中国经济在转型升级中迈向中高端。";
                //
                [personArr addObject:person];
            }
            
            //        NSLog(@"10000条数据插入 开始 ：%@",[NSDate date]);
            NSArray *arr = [dataBase xes_insertTable:@"Person" dicOrModelArray:personArr];
            NSString *message =  ([arr count] <= 0)?@"插入一组数据 成功":@"插入一组数据有  失败";
            NSLog(@"message ==== %@",message);
        }];
        
        

        
        
        
//        [dataBase xes_inTransaction:^(BOOL *rollback) {
//            for (int i = 0; i < 10000; i++) {
//                Person *person = [[Person alloc]init];
//                person.name = [NSString stringWithFormat:@"小钱_%d",i+10000];//@"小钱";
//                person.phoneNum = @13412341234;
//                person.photoData = [NSData data];
//                person.luckyNum = 26;
//                person.sex = 1;
//                person.age = 23;
//                person.height = 176.20;
//                person.weight = 79.23;
//                
//                BOOL flag = [dataBase xes_insertTableWithModel:person];
//                if (flag == NO) {
//                    *rollback = YES; //回滚操作
//                    return; //不加return会一直循环完1000
//                }
//            }
//        }];
        
        
        NSLog(@"线程1：%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue2, ^{
        
        XESDataBase *dataBase = [XESDataBase shareDataBase];
        
        [dataBase xes_inDatabase:^{
           
            BOOL isSuccess = [dataBase xes_deleteTableWithModel:[Person class] whereFormat:@"where name like '小钱_2%%'"];
            NSLog(@"delete name like 小钱_9%% = %d",isSuccess);
        }];
        
//        [dataBase xes_inTransaction:^(BOOL *rollback) {
//            for (int i = 0; i < 10000; i++) {
//                Person *person = [[Person alloc]init];
//                person.name = [NSString stringWithFormat:@"小钱_%d",i+10000];//@"小钱";
//                person.phoneNum = @13412341234;
//                person.photoData = [NSData data];
//                person.luckyNum = 26;
//                person.sex = 1;
//                person.age = 23;
//                person.height = 176.20;
//                person.weight = 79.23;
//                
//                BOOL flag = [dataBase xes_insertTableWithModel:person];
//                if (flag == NO) {
//                    *rollback = YES; //回滚操作
//                    return; //不加return会一直循环完1000
//                }
//            }
//        }];
        NSLog(@"线程2：%@",[NSThread currentThread]);
        
    });
    
    
    dispatch_async(queue3, ^{
        
        XESDataBase *dataBase = [XESDataBase shareDataBase];
        
        [dataBase xes_inTransaction:^(BOOL *rollback) {
            for (int i = 0; i < 10000; i++) {
                Person *person = [[Person alloc]init];
                person.name = [NSString stringWithFormat:@"小钱_%d",i+20000];//@"小钱";
                person.phoneNum = @13412341234;
                person.photoData = [NSData data];
                person.luckyNum = 26;
                person.sex = 1;
                person.age = 23;
                person.height = 176.20;
                person.weight = 79.23;
                
                BOOL flag = [dataBase xes_insertTableWithModel:person];
                if (flag == NO) {
                    *rollback = YES; //回滚操作
                    return; //不加return会一直循环完1000
                }
            }
        }];

        NSLog(@"线程3：%@",[NSThread currentThread]);
        
    });

    
}
-(void)asyncInsertOneData {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        XESDataBase *base = [XESDataBase shareDataBase];
        __block BOOL flag;
        __block BOOL flag1;
        
        [base xes_inDatabase:^{
            
            Person *person = [[Person alloc]init];
            person.name = [NSString stringWithFormat:@"小钱_%d",10000+20000];//@"小钱";
            person.phoneNum = @13412341234;
            person.photoData = [NSData data];
            person.luckyNum = 26;
            person.sex = 1;
            person.age = 23;
            person.height = 176.20;
            person.weight = 79.23;

            flag = [base xes_insertTableWithModel:person];
        }];
        NSString *message =  (flag)?@"插入一条数据 成功":@"插入一条数据  失败";
        
        [base xes_inDatabase:^{
            
            Person *person = [[Person alloc]init];
            person.name = [NSString stringWithFormat:@"小钱_%d",10001+20000];//@"小钱";
            person.phoneNum = @13412341234;
            person.photoData = [NSData data];
            person.luckyNum = 26;
            person.sex = 1;
            person.age = 23;
            person.height = 176.20;
            person.weight = 79.23;
            
            flag1 = [base xes_insertTableWithModel:person];
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
    
//    XESDataBase *database = [XESDataBase shareDataBase];
    /*
     NSUInteger pid = [database lastInsertPrimaryKeyIdFromTableName:@"tableOne"];
     BOOL isSuccess = [database xes_deleteTable:@"tableOne" whereFormat:@"where pkid = %d",pid];
     
     */
//    BOOL isSuccess = [database xes_deleteTableWithModel:[Person class] whereFormat:@"where pkid = (SELECT max(pkid) FROM tableOne)"];
    
    XESDataBase *database = [XESDataBase shareDataBase];
    BOOL isSuccess = [database xes_deleteTableWithModel:[Person class] whereFormat:@"where name = '小钱_30001'"];
    NSLog(@"delete  one data= = %d",isSuccess);
    
}
- (void)deleteAllData {
    NSLog(@"删除  开始：%@",[NSDate date]);

    XESDataBase *database = [XESDataBase shareDataBase];
    BOOL isSuccess = [database xes_deleteTableWithModel:[Person class] whereFormat:nil];
    NSLog(@"delete all data = = %d",isSuccess);
    NSLog(@"删除  结束：%@",[NSDate date]);

}
- (void)deleteInQueue {
    
    XESDataBase *database = [XESDataBase shareDataBase];
    __block BOOL isSuccess;
    [database xes_inDatabase:^{
//        NSUInteger pid = [database lastInsertPrimaryKeyIdFromTableName:@"Person"];
//        isSuccess = [database xes_deleteTableWithModel:[Person class] whereFormat:@"where pkid = '%d'",pid];
        isSuccess = [database xes_deleteTableWithModel:[Person class] whereFormat:@"where name like '小钱_99%%'"];

    }];
    NSLog(@"delete in queue = = %d",isSuccess);
}

- (void)deleteAsync {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        __block BOOL isSuccess;
        XESDataBase *database = [XESDataBase shareDataBase];
        [database xes_inDatabase:^{
            NSUInteger pid = [database lastInsertPrimaryKeyIdFromTableName:@"Person"];
            isSuccess = [database xes_deleteTableWithModel:[Person class] whereFormat:@"where pkid = '%d'",pid];
        }];
        NSLog(@"delete in async queue = = %d",isSuccess);
    });
}

#pragma mark ****************更新操作********************


- (void)updateData {
    
    NSLog(@"更新一条数据 开始 ： %@",[NSDate date]);
    XESDataBase *database = [XESDataBase shareDataBase];
    Person *person = [[Person alloc]init];
    person.name = [NSString stringWithFormat:@"小钱_%d",10001];//@"小钱";
    person.phoneNum = @13412341234;
    person.photoData = [NSData data];
    person.luckyNum = 26;
    person.sex = 1;
    person.age = 23;
    person.height = 176.20;
    person.weight = 79.23;
    BOOL isSuccess = [database xes_updateTableWithModel:person whereFormat:@"where name like '%@%%'",@"小钱_1"];
    NSLog(@"update  data = %d",isSuccess);
    NSLog(@"更新一条数据 结束 ： %@",[NSDate date]);
}
- (void)updateOtherData {
    
    
//    NSLog(@"更新数据 开始 ： %@",[NSDate date]);
//    Person *person = [[Person alloc]init];
//    person.name = [NSString stringWithFormat:@"小钱_%d",10000+20000];//@"小钱";
//    person.phoneNum = @13412341234;
//    person.photoData = [NSData data];
//    person.luckyNum = 26;
//    person.sex = 1;
//    person.age = 23;
//    person.height = 176.20;
//    person.weight = 79.23;
//    
//    XESDataBase *database = [XESDataBase shareDataBase];
//    [database xes_updateTableWithModel:person whereFormat:nil];
//
//    NSLog(@"更新数据 结束 ： %@",[NSDate date]);
    
    
    
//    XESDataBase *database = [XESDataBase shareDataBase];
//
//    Person *person = [[Person alloc]init];
//    person.name = [NSString stringWithFormat:@"小钱_%d",0+20000];//@"小钱";
//    person.phoneNum = @13412341234;
//    person.photoData = [NSData data];
//    person.luckyNum = 26;
//    person.sex = 1;
//    person.age = 23;
//    person.height = 176.20;
//    person.weight = 79.23;
//    person.desc = @"测试一下马上出发";
//    
//    BOOL flag = [database xes_updateTableWithModel:person whereFormat:@"where name = '小钱_%d'",10000];
//    NSLog(@"flag===%d",flag);
    
    
    /*事务处理   更新 10000条数据 每条都更新 */
    
    
//    NSLog(@"更新数据 开始 ： %@",[NSDate date]);
//    
//    XESDataBase *database = [XESDataBase shareDataBase];
//
//    [database xes_inTransaction:^(BOOL *rollback) {
//        
//        for (int i = 0; i< 50; i++) {
//            Person *person = [[Person alloc]init];
//            person.name = [NSString stringWithFormat:@"小钱_%d",i+1100];//@"小钱";
//            person.phoneNum = @13412341234;
//            person.photoData = [NSData data];
//            person.luckyNum = 26;
//            person.sex = 1;
//            person.age = 23;
//            person.height = 176.20;
//            person.weight = 79.23;
//            person.desc = @"测试一下马上出发";
//            NSDictionary *dict = @{@"name":person.name };
//
//            BOOL flag = [database  xes_updateTable:@"Person" dictOrModel:dict whereFormat:@"where name = '小钱_%d'",i+20000 + 1100];
//
////            BOOL flag = [database xes_updateTableWithModel:person whereFormat:@"where name = '小钱_%d'",i];
//            if (flag == NO) {
//                *rollback = YES; //回滚操作
//                return; //不加return会一直循环完1000
//            }
//        }
//    }];
//    
//    NSLog(@"更新数据 结束 ： %@",[NSDate date]);
    
    NSLog(@"更新数据 开始 ： %@",[NSDate date]);
    XESDataBase *database = [XESDataBase shareDataBase];
    /*更新数据  循环更新 */
    for (int i = 0; i< 100; i++) {
        Person *person = [[Person alloc]init];
        person.name = [NSString stringWithFormat:@"小张_%d",i+1150];//@"小钱";
//        person.phoneNum = @13412341234;
//        person.photoData = [NSData data];
//        person.luckyNum = 26;
//        person.sex = 1;
//        person.age = 23;
//        person.height = 176.20;
//        person.weight = 79.23;
        person.desc = @"测试一下马上出发";
        
//        NSDictionary *dict = @{@"name":person.name ,@"desc":person.desc};
        NSDictionary *dict = @{@"name":person.name };

        BOOL flag = [database xes_updateTable:@"Person" dictOrModel:dict whereFormat:@"where name = '小张_%d'",i+20000 + 1150];
        
//        BOOL flag = [database xes_updateTableWithModel:person whereFormat:@"where name = '小张_%d'",i+20000];
        NSLog(@"flag = %d",flag);
        
    }

    NSLog(@"更新数据 结束 ： %@",[NSDate date]);

    
}
- (void)updateDataInQueue {
    XESDataBase *database = [XESDataBase shareDataBase];
    
    __block BOOL isSuccess;
    
    Person *person = [[Person alloc]init];
    person.name = [NSString stringWithFormat:@"小钱_%d",10009+20000];//@"小钱";
    person.phoneNum = @13412341234;
    person.photoData = [NSData data];
    person.luckyNum = 26;
    person.sex = 1;
    person.age = 23;
    person.height = 176.20;
    person.weight = 79.23;
    person.desc = @"测试一下";
    [database xes_inDatabase:^{
        
        isSuccess = [database xes_updateTableWithModel:person whereFormat:@"where name like '%@%%'",@"小张_30"];
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
    
    
    NSLog(@"30000条数据查询  开始：%@",[NSDate date]);
//    XESDataBase *database = [XESDataBase shareDataBase];
//    NSArray *mArr = [database xes_lookupTableWithModel:[Person class] whereFormat:@"where name like '小张_1%%'"];
    XESDataBase *database = [XESDataBase shareDataBase];
    NSArray *mArr = [database xes_lookupTableWithModel:[Person class] whereFormat:@""];

    NSLog(@"lookup like  小张_2 data 的数据 === %@\n%lu",mArr,(unsigned long)[mArr count]);
    
    NSLog(@"30000条数据查询  结束：%@",[NSDate date]);
}
- (void)lookupAllData {
    
    NSLog(@"30000条数据查询  开始：%@",[NSDate date]);
    XESDataBase *database = [XESDataBase shareDataBase];
    NSArray *mArr = [database xes_lookupTableWithModel:[Person class] whereFormat:nil];
    NSLog(@"lookup like  小钱_20 data 的数据 === %@\n%lu",mArr,(unsigned long)[mArr count]);
    
    NSLog(@"30000条数据查询  结束：%@",[NSDate date]);
    
    
}
- (void)lookupDataInQueue {
    XESDataBase *database = [XESDataBase shareDataBase];
    [database xes_inDatabase:^{
        NSArray *arr = [database xes_lookupTableWithModel:[Person class] whereFormat:@"where name = '%@'",@"小钱_100"];
        NSLog(@"lookupDataInQueue all data name = 小钱_100 的数据 === %@",arr);
        
    }];
}
- (void)lookupDataAsyncInQueue {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        XESDataBase *database = [XESDataBase shareDataBase];
        NSArray *arr = [database xes_lookupTableWithModel:[Person class] whereFormat:@"where name like '%@%%'",@"小钱_100"];
        NSLog(@"lookupDataInQueue all data name like 小钱_100 的数据 === %@",arr);
    });
}
#pragma mark ****************事务处理操作********************
- (void)transactionInsertMaxData {
    
    XESDataBase *database = [XESDataBase shareDataBase];
//    [database xes_inTransaction:^(BOOL *rollback) {
//        for (int i = 0; i < 1000; i++) {
//            NSDictionary *dict = @{@"name":[NSString stringWithFormat:@"小平_%d",i+1],@"sex":(i%2)?@"1":@"0",@"city":@"BJ_New",@"desc":@"this is a new girl ",@"weight":@78.34,@"height":@170};
//            
//            BOOL flag = [database xes_insertTable:@"tableOne" dictOrModel:dict];
//            if (flag == NO) {
//                *rollback = YES; //回滚操作
//                return; //不加return会一直循环完1000
//            }
//        }
//    }];
    
    
    [database xes_inTransaction:^(BOOL *rollback) {
        for (int i = 0; i < 10000; i++) {
            Person *person = [[Person alloc]init];
            person.name = [NSString stringWithFormat:@"小钱_%d",i+50000];//@"小钱";
            person.phoneNum = @13412341234;
            person.photoData = [NSData data];
            person.luckyNum = 26;
            person.sex = 1;
            person.age = 23;
            person.height = 176.20;
            person.weight = 79.23;
            
            BOOL flag = [database xes_insertTableWithModel:person];
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

//删除数据库文件
- (void)dropDataBase {
    
//    NSString *DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:DocumentsPath];
//    for (NSString *fileName in enumerator) {
//        [[NSFileManager defaultManager] removeItemAtPath:[DocumentsPath stringByAppendingPathComponent:fileName] error:nil];
//    }
//    [self showAlert:@"清除文件成功！"];
    
    
    
////    person.name = @"小张";
//
    XESDataBase *database = [XESDataBase shareDataBase];
    NSArray *arr = [database xes_lookupTableWithModel:[Person class] whereFormat:@"where name = '小张'"];
    Person *p = [arr lastObject];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    imageView.image = [UIImage imageWithData:p.photoData];
    [self.view addSubview:imageView];
    NSLog(@"%@",arr);
    
    
}

- (void)showAlert:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)updateDataBaseNew {
    
    
    XESDataBase *database = [XESDataBase shareDataBase];
    
    FMDBMigrationManager * manager = [FMDBMigrationManager managerWithDatabaseAtPath:[XESDataBaseTool getDefaultDataBasePath] migrationsBundle:[NSBundle mainBundle]];
    
    NSString *versionOneStr1 = [database xes_getCreateTableSQLStringWithModel:[StudentNew class]];
    NSString *versionOneStr2 = [database xes_getCreateTableSQLStringWithModel:[School class]];
    
    XESMigration * migration_1 = [[XESMigration alloc]initWithName:@"new add StudentNew and School Table" andVersion:1 andExecuteUpdateArray:@[versionOneStr1,versionOneStr2]];//从版本生升级到版本1创建一个User表 带有 name,age 字段
    
    NSArray *addColumnArr = [database  xes_getAddColumnSQLStringWithModel:[StudentNew class]];
    NSLog(@"哈哈===%@",addColumnArr);
//    NSString *versionTwoStr1 = [database xes_getCreateTableSQLStringWithModel:[Person class]];
    
    NSMutableArray *arr2 = [NSMutableArray arrayWithArray:addColumnArr];
//    [arr2 addObject:versionTwoStr1];
    XESMigration * migration_2 = [[XESMigration alloc]initWithName:@"StudentNew表新增几个字段和 Person表创建" andVersion:2 andExecuteUpdateArray:arr2];//给User表添加email字段
    //
    //    XESMigration * migration_3 = [[XESMigration alloc]initWithName:@"tableOne表新增字段email" andVersion:3 andExecuteUpdateArray:@[@"alter table tableOne add email text"]];//给User表添加email字段
    
    [manager addMigration:migration_1];
//    [manager addMigration:migration_2];
    //    [manager addMigration:migration_3];
    
    BOOL resultState=NO;
    NSError * error=nil;
    if (!manager.hasMigrationsTable) {
        resultState=[manager createMigrationsTable:&error];
    }
    resultState=[manager migrateDatabaseToVersion:UINT64_MAX progress:nil error:&error];
    
}
- (void)updateDataBaseNew2 {
    
    
    XESDataBase *database = [XESDataBase shareDataBase];
    
    FMDBMigrationManager * manager = [FMDBMigrationManager managerWithDatabaseAtPath:[XESDataBaseTool getDefaultDataBasePath] migrationsBundle:[NSBundle mainBundle]];
    
    NSString *versionOneStr1 = [database xes_getCreateTableSQLStringWithModel:[StudentNew class]];
    NSString *versionOneStr2 = [database xes_getCreateTableSQLStringWithModel:[School class]];
    
    XESMigration * migration_1 = [[XESMigration alloc]initWithName:@"new add StudentNew and School Table" andVersion:1 andExecuteUpdateArray:@[versionOneStr1,versionOneStr2]];//从版本生升级到版本1创建一个User表 带有 name,age 字段
    [manager addMigration:migration_1];
    BOOL resultState=NO;
    NSError * error=nil;
    if (!manager.hasMigrationsTable) {
        resultState=[manager createMigrationsTable:&error];
    }
    resultState=[manager migrateDatabaseToVersion:UINT64_MAX progress:nil error:&error];
    
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
