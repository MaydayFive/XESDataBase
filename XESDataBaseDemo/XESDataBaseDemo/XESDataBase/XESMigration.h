//
//  Migration.h
//  FMDBMigrationManager
//
//  Created by gfy on 2017/6/27.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;

@interface XESMigration : NSObject

@property (nonatomic, readonly) NSString *name;

@property (nonatomic, readonly) uint64_t version;

- (instancetype)initWithName:(NSString *)name andVersion:(uint64_t)version andExecuteUpdateArray:(NSArray *)updateArray;//自定义方法

- (BOOL)migrateDatabase:(FMDatabase *)database error:(out NSError *__autoreleasing *)error;

@end
