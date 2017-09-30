//
//  SixNewOtherModel.m
//  XESDataBaseDemo
//
//  Created by gfy on 2017/7/18.
//  Copyright © 2017年 gfy. All rights reserved.
//

#import "SixNewOtherModel.h"

@implementation SixNewOtherModel

-(id)initWithCoder:(NSCoder *)aDecoder
{
    
    if (self = [super init]) {
        
        self.phoneNum = [aDecoder decodeObjectForKey:@"phoneNum"];
        
        self.name = [aDecoder decodeObjectForKey:@"name"];
        
        self.luckyNum = [aDecoder decodeIntegerForKey:@"luckyNum"];
        
    }
    return self;
    
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.phoneNum forKey:@"phoneNum"];
    
    [aCoder encodeObject:self.name forKey:@"name"];
    
    [aCoder encodeInteger:self.luckyNum forKey:@"luckyNum"];
    
}
@end
