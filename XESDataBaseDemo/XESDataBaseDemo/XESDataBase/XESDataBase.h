//
//  XESDataBase.h
//  XESDataBaseDemo
//
//  Created by gfy on 2017/6/13.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XESDataBaseTool.h"

@interface XESDataBase : NSObject

/**
 单例
 名称和存放路径都默认
 @return 返回XESDataBase一个对象
 */
+ (instancetype)shareDataBase;

/**
 单例

 @param dbName 设置数据库名称 存放路径默认
 @return 返回XESDataBase一个对象
 */
+ (instancetype)shareDataBase:(NSString *)dbName;
/**
 单例
 @param dbName 数据库名称
 @param dbStoragePath 数据库存放路径
 @return 返回XESDataBase一个对象
 */
+ (instancetype)shareDataBase:(NSString *)dbName storagePath:(NSString *)dbStoragePath;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE ;

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

/*新增*/

/**
 创建表
 自定义Model 属性支持包含基本数据类型的Array NSDictionary
 @param parameters 自定义Model
 @return 创建表成功失败
 */
- (BOOL)xes_createTableWithSupportArrDictDataTypeModel:(id)parameters ;




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
- (BOOL)xes_createTable:(NSString *)tableName dictOrModel:(id)parameters excludeName:(NSArray *)nameArr;
- (BOOL)xes_createTable:(NSString *)tableName dictOrModel:(id)parameters  primaryKey:(NSString *)primaryKey  excludeName:(NSArray *)nameArr;

/*
 新增
 */

/**
 插入数据 自定义Model
 自定义Model 属性支持包含基本数据类型的Array NSDictionary
 @param model 自定义Model
 @return 插入成功失败
 */
- (BOOL)xes_insertTableWithSupportArrDictDataTypeModel:(id)model;

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

// 直接传一个array插入
- (NSArray *)xes_insertTable:(NSString *)tableName dicOrModelArray:(NSArray *)dicOrModelArray;
- (BOOL)xes_insertTable:(NSString *)tableName dictOrModel:(id)parameters columnArr:(NSArray *)columnArr ;



/**
 删除表中数据

 @param tableName 表名
 @param format 删除条件 未设置条件 可以传@"" 或者nil   表示删除全部
 @return 成功失败
 */
- (BOOL)xes_deleteTable:(NSString *)tableName whereFormat:(NSString *)format, ... ;
- (BOOL)xes_deleteAllDataFromTable:(NSString *)tableName;
/**
 删除表中数据  自定义model
 
 @param modelClass 自定义model   class
 @param format 条件
 @return 成功失败
 */
- (BOOL)xes_deleteTableWithModel:(Class)modelClass whereFormat:(NSString *)format, ... ;


/*
 新增 表格更新数据
 */

/**
 表格更新数据  自定义Model
自定义Model 属性支持包含基本数据类型的Array NSDictionary
 @param parameters 自定义Model
 @param format 更新  条件
 @return 成功失败
 */
- (BOOL)xes_updateTableWithSupportArrDictDataTypeModel:(id)parameters whereFormat:(NSString *)format, ...;

- (BOOL)xes_updateTable:(NSString *)tableName withSupportArrDictDataTypeDictOrModel:(id)parameters whereQueryString:(NSString *)where;


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


/*新增加*/

//新增查询 之前不支持属性类型 如NSArray 、NSDictionary、自定义类型  可以支持

/**
 查询数据  自定义model
 新增自定义Model 属性支持包含基本数据类型的Array NSDictionary
 @param parameters 自定义model
 @param format 查询条件
 @return 查询的数据  数组
 */
- (NSArray *)xes_lookupSupportArrDictDataTypeTableWithModel:(id)parameters whereFormat:(NSString *)format, ... ;

- (NSArray *)xes_lookupSupportArrDictDataTypeTable:(NSString *)tableName dictOrModel:(id)parameters whereFormat:(NSString *)format, ...;


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

- (NSInteger)xes_tableItemCount:(NSString *)tableName;

/**
 ALTER  更改表名称

 @param tableName 表名
 @param newTableName 新表名
 @return 更改成功或者失败
 */
- (BOOL)xes_alterTable:(NSString *)tableName newTableName:(NSString *)newTableName;

/**
 ALTER 表格新增字段

 @param tableName 表名
 @param parameters 新增字段名称及类型
 @return 成功或者失败
 */
- (BOOL)xes_alterTable:(NSString *)tableName addColumnWithDictOrModel:(id)parameters;
- (BOOL)xes_alterTable:(NSString *)tableName addColumnWithDictOrModel:(id)parameters excludeName:(NSArray *)nameArr;

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

- (long long int)lastInsertPrimaryKeyIdFromTableName:(NSString *)tableName;

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

/**
 查询数据库中所有的表名

 @return 数据库中所有的表名
 */
- (NSArray * )xes_lookupAllTablesInDatabase;


- (BOOL)xes_executeUpdate:(NSString *)format, ...;



@end
