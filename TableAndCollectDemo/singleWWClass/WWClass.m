//
//  WWClass.m
//  TableAndCollectDemo
//
//  Created by DUC-apple3 on 2017/6/6.
//  Copyright © 2017年 DUC-apple3. All rights reserved.
//

#import "WWClass.h"

@implementation WWClass
static WWClass *__wwClass;
+(instancetype)WWSharedClass {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __wwClass = [[WWClass alloc] init];
    });
    return __wwClass;
}
+(void)load{

}
@end
