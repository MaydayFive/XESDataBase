//
//  SixModel.h
//  XESDataBaseDemo
//
//  Created by gfy on 2017/7/18.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SixModel : NSObject

@property (nonatomic, strong)NSString *name;

@property (nonatomic, strong)NSNumber *phoneNum;

@property (nonatomic, strong)NSData *photoData;

@property (nonatomic, assign)NSInteger luckyNum;

@property (nonatomic, assign)BOOL sex;

@property (nonatomic, assign)int age;

@property (nonatomic, assign)float height;

@property (nonatomic, assign)double weight;

// 为了测试除以上类型外, 下面的类型不参与建表 新增支持
@property (nonatomic, strong)NSDictionary *testDic;

@property (nonatomic, strong)NSArray *testArr;

//@property (nonatomic, strong)NSError *testError;

//@property (nonatomic, strong)SixModel *testP;


@end
