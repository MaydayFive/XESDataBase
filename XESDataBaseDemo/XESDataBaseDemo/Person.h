//
//  Person.h
//  XESDataBaseDemo
//
//  Created by gfy on 2017/7/9.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

//version 0
@property (nonatomic, strong)NSString *name;

@property (nonatomic, strong)NSNumber *phoneNum;

@property (nonatomic, strong)NSData *photoData;

@property (nonatomic, assign)NSInteger luckyNum;

@property (nonatomic, assign)BOOL sex;

@property (nonatomic, assign)int age;

@property (nonatomic, assign)float height;  //float类型存入172.12会变成172.19995, 取值时%.2f等于原值172.12
@property (nonatomic, assign)double weight;

@property (nonatomic, strong)NSString *desc;


//version 1
@property (nonatomic, strong)NSString *city;

@property (nonatomic, assign)int score;
//
////new add
//@property (nonatomic, assign)int allScore;
//
//@property (nonatomic, strong)NSString *parentName;

@end
