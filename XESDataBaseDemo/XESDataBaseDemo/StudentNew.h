//
//  Student.h
//  XESDataBaseDemo
//
//  Created by gfy on 2017/7/10.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentNew : NSObject

@property (nonatomic, strong)NSString *name;

@property (nonatomic, assign)BOOL sex;

@property (nonatomic, assign)int age;

@property (nonatomic, strong)NSNumber *phoneNum;

@property (nonatomic, strong)NSData *photoData;

@property (nonatomic, strong)NSString *classId;

@property (nonatomic, strong)NSString *locationCity;


@end
