//
//  XESDataBaseTool.h
//  XESDataBaseDemo
//
//  Created by gfy on 2017/6/27.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import <Foundation/Foundation.h>

///文本
FOUNDATION_EXPORT NSString * const SQL_Type_Text;
///int long integer ...
FOUNDATION_EXPORT NSString * const SQL_Type_Integer;
///浮点
FOUNDATION_EXPORT NSString * const SQL_Type_Real;
///data
FOUNDATION_EXPORT NSString * const SQL_Type_Blob;


FOUNDATION_EXPORT NSString * const DATABASE_DEFAULT_NAME;

//#define DATABASE_DEFAULT_NAME @"XES_DATABASE.sqlite"


@interface XESDataBaseTool : NSObject
//new add 
+ (NSDictionary *)transformSupportArrDictDataTypeModelToDictionary:(id)model excludeFields:(NSArray *)fieldsArr;
//new add
+ (NSDictionary *)supportArrDictDataTypeModelToDictionary:(Class)cls excludePropertyName:(NSArray *)nameArr;
//new  add
+ (NSString *)supportArrDictDataTypePropertTypeConvert:(NSString *)typeStr;
// new addd    获取model的key和value
+ (NSDictionary *)getSupportArrDictDataTypeModelPropertyKeyValue:(id)model tableName:(NSString *)tableName columnArr:(NSArray *)columnArr;
//new add
+ (NSArray *)getArrDictTypeDataNameFrom:(Class)cls;



+ (NSDictionary *)transformModelToDictionary:(id)model excludeFields:(NSArray *)fieldsArr ;
+ (NSDictionary *)modelToDictionary:(Class)cls excludePropertyName:(NSArray *)nameArr;

+ (Class)getClassFromModel:(id)model;

// 获取model的key和value
+ (NSDictionary *)getModelPropertyKeyValue:(id)model tableName:(NSString *)tableName columnArr:(NSArray *)columnArr;

+ (NSString *)getDefaultDataBasePath;
+ (NSString *)getDatabasePathWithDatabaseName:(NSString *)dbName;

//字典、数据 与json字符串 相互转换
+ (NSString *)transferDictOrArrToJsonStrFromData:(id)transferData;
+ (NSDictionary *)transferJsonStringToDictionaryWithJsonString:(NSString *)jsonString;
@end
