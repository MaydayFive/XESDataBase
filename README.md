
### 一、安装
##### 1.1、Installation with CocoaPods（推荐）
1.在 `Podfile` 中添加 `pod 'XESDataBasePublic'`。
2.执行 `pod install` 或 `pod update`。
3.导入 `"XESDataBase.h"`。
##### 1.2、手动安装（不推荐）
1.下载 XESDataBase 文件夹内的所有内容。
2.将 XESDataBase 内的源文件添加(拖放)到你的工程。
3.项目中需要引用`FMDB` 和 `FMDBMigrationManager`
4.导入 XESDataBase.h。

### 二、XESDataBase介绍
##### 2.1、简介
XESDataBase是一个基于FMDB封装的一个数据库工具。
##### 2.2、XESDataBase有哪些特性
    1、FMDB的二次封装
    2、线程安全
    3、支持自定义model和Dictionary存储
    4、支持事务操作
    5、不侵入你的任何Model
    6、拓展性强
    7、支持数据库版本升级


### 三、XESDataBase 提供了哪些服务
##### 3.1、创建数据库
&emsp;&emsp;支持单例、init方式创建
单例方法创建数据库, 如果使用shareDataBase创建,则默认在NSDocumentDirectory下创建一个名称为XES_DATABASE.sqlite的数据库文件, 但只要使用这三个方法任意一个创建成功, 之后即可使用三个中任意一个方法获得同一个实例,参数可随意或nil dbName 数据库的名称 如: @"Users.sqlite", 如果dbName = nil,则默认dbName=@"XES_DATABASE.sqlite" dbPath 数据库的路径, 如果dbPath = nil, 则路径默认NSDocumentDirectory init初始化方法也是一样。

&emsp;&emsp;3.1.1接口


```
/**
 单例
 名称和存放路径都默认
 @return 返回XESDataBase一个对象
 */
+ (instancetype)shareDataBase;
  /**
 初始化

 @param dbName 数据库名称
 @return 返回一个XESDataBase一个对象
 */
- (instancetype)initWithDBName:(NSString *)dbName;  
    
```

&emsp;&emsp; 3.1.2 示例代码


```

//初始化 创建数据库

XESDataBase *dataBase = [XESDataBase shareDataBase];

XESDataBase *dataBase = [[XESDataBase alloc]initWithDBName:@"test.sqlite"];

``` 

##### 3.2 、创建表
&emsp;&emsp;默认创建主键xesid

&emsp;&emsp; 3.2.1 提供的接口

```
/**
 创建表格 自定义Model
 @param parameters 自定义Model
 @return 表格创建成功失败
 */
- (BOOL)xes_createTableWithModel:(id)parameters;

/**
 创建表格
 @param tableName 表名
 @param parameters 表格字段可以传自定义类或者字典（字段名称和类型）
 @return 创建成功或者失败
 */
- (BOOL)xes_createTable:(NSString *)tableName dictOrModel:(id)parameters;

```
&emsp;&emsp; 3.2.2 示例代码

```

@interface Student:NSObject

@property (nonatomic, strong)NSString *name;

@property (nonatomic, strong)NSNumber *phoneNum;

@property (nonatomic, strong)NSData *photoData;

@property (nonatomic, assign)NSInteger luckyNum;

@property (nonatomic, assign)BOOL sex;

@property (nonatomic, assign)int age;

@property (nonatomic, assign)float height;

@property (nonatomic, assign)double weight;

// 为了测试除以上类型外, 下面的类型不参与建表
@property (nonatomic, strong)NSDictionary *testDic;

@property (nonatomic, strong)NSArray *testArr;

@property (nonatomic, strong)NSError *testError;

@property (nonatomic, strong)Person *testP;

@end

@implementation Student


@end


[database xes_createTable:@"newTable" dictOrModel:[Student class]];


```

##### 3.3 、主键用法
&emsp;&emsp;主键是默认自动创建的,名为xesid,如果你需要在你的Model中使用主键, 需要添加主键属性, 属性名必须为xesid,主键不会参加插入和修改操作。
&emsp;&emsp; 3.3.1 提供的接口

```
@property (nonatomic, assign)NSInteger xesid;
                                           
```

&emsp;&emsp; 3.3.2 示例代码

```
    
    
```

##### 3.4 、增、删、改、查 之 增

&emsp;&emsp;插入一个或者一组 自定义model或者dictionary数据 都可以接收并存储。
&emsp;&emsp; 3.4.1 提供的接口

```
 /**
 表中插入数据  自定义Model

 @param model 自定义Model
 @return 插入自定义Model成功失败
 */
- (BOOL)xes_insertTableWithModel:(id)model;

/**
 表中插入数据

 @param tableName 表名
 @param parameters 数据模型或者字典
 @return 插入成功或者失败
 */
- (BOOL)xes_insertTable:(NSString *)tableName dictOrModel:(id)parameters;

                                          
```

&emsp;&emsp; 3.4.2 示例代码

```
Person *person = [[Person alloc]init];
    person.name = @"小张";
    person.phoneNum = @13412341234;
    person.photoData = [NSData data];
    person.luckyNum = 16;
    person.sex = 1;
    person.age = 24;
    person.height = 176.20;
    person.weight = 79.23;
    person.desc = @"descripion";
    BOOL isSuccess = [dataBase xes_insertTableWithModel:person];
    
```

##### 3.5、增、删、改、查 之 删

&emsp;&emsp;可以根据自定义SQL条件语句删除想要删除的数据或者删除表中全部数据。未设定条件可以传nil或者@""

&emsp;&emsp; 3.5.1 提供的接口

```
/**
 删除表中数据  自定义model
 
 @param modelClass 自定义model   class
 @param format 条件
 @return 成功失败
 */
- (BOOL)xes_deleteTableWithModel:(Class)modelClass whereFormat:(NSString *)format, ... ;

/**
 删除表中数据

 @param tableName 表名
 @param format 删除条件 未设置条件 可以传@"" 或者nil   表示删除全部
 @return 成功失败
 */
- (BOOL)xes_deleteTable:(NSString *)tableName whereFormat:(NSString *)format, ... ;

```

&emsp;&emsp; 3.5.2 示例代码

```
[database xes_deleteTableWithModel:[Person class] whereFormat:nil];

[database xes_deleteTable:@"tableOne" whereFormat:@"where xesid = (SELECT max(xesid) FROM tableOne)"];


```

##### 3.6、增、删、改、查 之 改
&emsp;&emsp; 可以根据自己设定的SQL条件更新数据 未设定条件可以传nil或者@""
&emsp;&emsp; 3.6.1 提供的接口

```

/**
 表格更新数据  自定义Model

 @param parameters 自定义Model
 @param format 更新  条件
 @return 成功失败
 */
- (BOOL)xes_updateTableWithModel:(id)parameters whereFormat:(NSString *)format, ... ;


/**
 表格更新数据

 @param tableName 表名
 @param parameters 更新的数据
 @param format 更新的条件
 @return 更新成功失败
 */
- (BOOL)xes_updateTable:(NSString *)tableName dictOrModel:(id)parameters whereFormat:(NSString *)format, ... ;


```


&emsp;&emsp; 3.6.2 示例代码

```

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
    [database xes_updateTableWithModel:person whereFormat:@"where name like '%@%%'",@"小钱_1"];
    
```



##### 3.7、增、删、改、查 之 查

&emsp;&emsp; parameters为查找到数据后每条数据要存入的模型,可以为model、dictionary或者nil(传nil以字典形式返回所有字段)

&emsp;&emsp; 3.7.1 提供的接口

```

/**
 查询数据  自定义model
 
 @param parameters 自定义model
 @param format 查询条件
 @return 查询的数据  数组
 */
- (NSArray *)xes_lookupTableWithModel:(id)parameters whereFormat:(NSString *)format, ...;
- 

/**
 查询表格数据

 @param tableName 表名
 @param parameters 模型或者nil 传入模型类返回数据自动转换模型 传入nil自动返回字典类型
 @param format 查询条件
 @return 查询的数据
 */
- (NSArray *)xes_lookupTable:(NSString *)tableName dictOrModel:(id)parameters whereFormat:(NSString *)format, ...;


```

&emsp;&emsp; 3.7.2 示例代码

```
   XESDataBase *database = [XESDataBase shareDataBase];
    NSArray *mArr = [database xes_lookupTableWithModel:[Person class] whereFormat:@""];

```

##### 3.8、线程安全
&emsp;&emsp; 以上操作是非线程安全的, 要想保证线程安全,还是采用FMDB的原型,所有操作都放在下面block中执行, 而block块内代码会被提交到一个队列中,从而保证线程安全, 但要注意的是block不能嵌套使用！！！

&emsp;&emsp; 3.8.1 提供的接口

```
- (void)xes_inDatabase:(void(^)(void))block;

```

&emsp;&emsp; 3.8.2 示例代码

```

[database xes_inDatabase:^{
      NSArray *arr = [database xes_lookupTableWithModel:[Person class] whereFormat:nil];
}];

```
##### 3.9、事务操作
&emsp;&emsp;支持事务操作
&emsp;&emsp; 3.9.1 提供的接口

```
- (void)xes_inTransaction:(void(^)(BOOL *rollback))block;

```

&emsp;&emsp; 3.9.2 示例代码

```
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

```

##### 3.10、数据库版本升级
&emsp;&emsp;支持数据库版本升级,通过使用`FMDBMigrationManager`来控制数据库升级。
&emsp;&emsp; 3.10.1 提供的接口

```
/**
 通过自定义model返回创建表 SQL语句

 @param model 自定义model
 @return SQL语句 字符串
 */
- (NSString *)xes_getCreateTableSQLStringWithModel:(id)model;

/**
 通过自定义model返回  添加字段的  SQL语句
 直接在model中新增字段即可 该方法会自动判断新增字段
 @param model 自定义model
 @return sql语句 字符串  数组
 */
- (NSArray *)xes_getAddColumnSQLStringWithModel:(id)model;


```

&emsp;&emsp; 3.10.2 示例代码

```
FMDBMigrationManager * manager=[FMDBMigrationManager managerWithDatabaseAtPath:[XESDataBaseTool getDefaultDataBasePath] migrationsBundle:[NSBundle mainBundle]];
NSString *versionOneStr1 = [database xes_getCreateTableSQLStringWithModel:[StudentNew class]];
NSString *versionOneStr2 = [database xes_getCreateTableSQLStringWithModel:[School class]];
XESMigration * migration_1=[[XESMigration alloc]initWithName:@"新增USer表" andVersion:1 andExecuteUpdateArray:@[versionOneStr1,versionOneStr2]];//从版本生升级到版本1创建一个User表 带有 name,age 字段

[manager addMigration:migration_1];

BOOL resultState=NO;
NSError * error=nil;
if (!manager.hasMigrationsTable) {
resultState=[manager createMigrationsTable:&error];
}
resultState=[manager migrateDatabaseToVersion:UINT64_MAX progress:nil error:&error];

```

---

### 四、XESNetwork API分为以下几个分类

* `XESDataBase`
* `XESDataBaseTool`
* `XESMigration` 

##### 4.1、XESDataBase

 &emsp;&emsp;4.1.1、介绍
 &emsp;&emsp;&emsp;&emsp;  `XESDataBase`类是数据库管理类，负责创建数据库管理对象，执行数据库增、删、改、查等操作。
  
&emsp;&emsp;4.1.2、接口
&emsp;&emsp;&emsp;&emsp;此类可以通过类方法（单例）、或者提供的初始化方法创建对象，不允许使用init、new方法创建实例对象。

```
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;


/**
 获取单例对象
 名称和存放路径都默认
 @return 返回XESDataBase一个对象
 */
+ (instancetype)shareDataBase;
+ (instancetype)shareDataBase:(NSString *)dbName;
+ (instancetype)shareDataBase:(NSString *)dbName storagePath:(NSString *)dbStoragePath;

 /**
 初始化

 @param dbName 数据库名称
 @return 返回一个XESDataBase一个对象
 */
- (instancetype)initWithDBName:(NSString *)dbName;
- (instancetype)initWithDBName:(NSString *)dbName path:(NSString *)dbPath;


/**
 判断表是否存在

 @param tableName 表名
 @return 是否存在
 */
- (BOOL)xes_tableExists:(NSString *)tableName;

/**
 创建表格 自定义Model

 @param parameters 自定义Model
 @return 表格创建成功失败
 */
- (BOOL)xes_createTableWithModel:(id)parameters;

/**
 创建表格
 @param tableName 表名
 @param parameters 表格字段可以传自定义类或者字典（字段名称和类型）
 @return 创建成功或者失败
 */
- (BOOL)xes_createTable:(NSString *)tableName dictOrModel:(id)parameters;

/**
 表中插入数据  自定义Model

 @param model 自定义Model
 @return 插入自定义Model成功失败
 */
- (BOOL)xes_insertTableWithModel:(id)model;

/**
 表中插入数据

 @param tableName 表名
 @param parameters 数据模型或者字典
 @return 插入成功或者失败
 */
- (BOOL)xes_insertTable:(NSString *)tableName dictOrModel:(id)parameters;


/**
 删除表中数据  自定义model
 
 @param modelClass 自定义model   class
 @param format 条件
 @return 成功失败
 */
- (BOOL)xes_deleteTableWithModel:(Class)modelClass whereFormat:(NSString *)format, ... ;
/**
 删除表中数据

 @param tableName 表名
 @param format 删除条件 未设置条件 可以传@"" 或者nil   表示删除全部
 @return 成功失败
 */
- (BOOL)xes_deleteTable:(NSString *)tableName whereFormat:(NSString *)format, ... ;

/**
 表中插入数据  自定义Model

 @param model 自定义Model
 @return 插入自定义Model成功失败
 */
- (BOOL)xes_insertTableWithModel:(id)model;

/**
 表中插入数据

 @param tableName 表名
 @param parameters 数据模型或者字典
 @return 插入成功或者失败
 */
- (BOOL)xes_insertTable:(NSString *)tableName dictOrModel:(id)parameters;


/**
 删除表中数据  自定义model
 
 @param modelClass 自定义model   class
 @param format 条件
 @return 成功失败
 */
- (BOOL)xes_deleteTableWithModel:(Class)modelClass whereFormat:(NSString *)format, ... ;

/**
 删除表中数据

 @param tableName 表名
 @param format 删除条件 未设置条件 可以传@"" 或者nil   表示删除全部
 @return 成功失败
 */
- (BOOL)xes_deleteTable:(NSString *)tableName whereFormat:(NSString *)format, ... ;

/**
 表格更新数据  自定义Model

 @param parameters 自定义Model
 @param format 更新  条件
 @return 成功失败
 */
- (BOOL)xes_updateTableWithModel:(id)parameters whereFormat:(NSString *)format, ... ;

/**
 表格更新数据

 @param tableName 表名
 @param parameters 更新的数据
 @param format 更新的条件
 @return 更新成功失败
 */
- (BOOL)xes_updateTable:(NSString *)tableName dictOrModel:(id)parameters whereFormat:(NSString *)format, ... ;

/**
 查询数据  自定义model
 
 @param parameters 自定义model
 @param format 查询条件
 @return 查询的数据  数组
 */
- (NSArray *)xes_lookupTableWithModel:(id)parameters whereFormat:(NSString *)format, ...;

/**
 查询表格数据

 @param tableName 表名
 @param parameters 模型或者nil 传入模型类返回数据自动转换模型 传入nil自动返回字典类型
 @param format 查询条件
 @return 查询的数据
 */
- (NSArray *)xes_lookupTable:(NSString *)tableName dictOrModel:(id)parameters whereFormat:(NSString *)format, ...;
/**
 删除一个表
 
 @param tableName 表名
 @return 成功失败
 */
- (BOOL)xes_dropTable:(NSString *)tableName;

/**
 查询表中所有字段

 @param tableName 表名称
 @return 表中所有字段
 */
- (NSArray *)getTableColumnsFromTable:(NSString *)tableName;

/**
 线程安全 FMDatabaseQueue

 @param block block
 */
- (void)xes_inDatabase:(void(^)(void))block;

/**
 事务操作

 @param block block
 */
- (void)xes_inTransaction:(void(^)(BOOL *rollback))block;

/**
 通过自定义model返回创建表 SQL语句

 @param model 自定义model
 @return SQL语句 字符串
 */
- (NSString *)xes_getCreateTableSQLStringWithModel:(id)model;

/**
 通过自定义model返回  添加字段的  SQL语句
 直接在model中新增字段即可 该方法会自动判断新增字段
 @param model 自定义model
 @return sql语句 字符串  数组
 */
- (NSArray *)xes_getAddColumnSQLStringWithModel:(id)model;



```


---


##### 4.2、XESDataBaseTool

 &emsp;&emsp; 4.2.1、介绍
   &emsp;&emsp; &emsp;&emsp; `XESDataBaseTool`类是一个工具类，仅供`XESDataBaseTool` 类使用。

 &emsp;&emsp;4.2.2、接口
 
```

+ (NSDictionary *)transformModelToDictionary:(id)model excludeFields:(NSArray *)fieldsArr ;
+ (NSDictionary *)modelToDictionary:(Class)cls excludePropertyName:(NSArray *)nameArr;
+ (Class)getClassFromModel:(id)model;

// 获取model的key和value
+ (NSDictionary *)getModelPropertyKeyValue:(id)model tableName:(NSString *)tableName columnArr:(NSArray *)columnArr;

+ (NSString *)getDefaultDataBasePath;
+ (NSString *)getDatabasePathWithDatabaseName:(NSString *)dbName;

```

---

##### 4.3、XESMigration

 &emsp;&emsp; 4.3.1、介绍
   &emsp;&emsp; &emsp;&emsp; `XESDataBaseTool`类是一个数据库版本升级负责处理版本新增事务的处理。配合`FMDBMigrationManager` 类使用完成数据库升级操作。
  &emsp;&emsp;4.3.2、属性
 
```
@property (nonatomic, readonly) NSString *name;

@property (nonatomic, readonly) uint64_t version;

``` 
 &emsp;&emsp;4.3.3、接口
 
```

- (instancetype)initWithName:(NSString *)name andVersion:(uint64_t)version andExecuteUpdateArray:(NSArray *)updateArray;//自定义方法

- (BOOL)migrateDatabase:(FMDatabase *)database error:(out NSError *__autoreleasing *)error;


```

---


### 历史版本
* 0.0.1

---
### 系统要求
该项目最低支持 iOS 7.0 和 Xcode 7.0。


