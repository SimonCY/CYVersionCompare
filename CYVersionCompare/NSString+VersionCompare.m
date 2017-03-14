//
//  NSString+VersionCompare.m
//  CYVersionCompare
//
//  Created by RRTY on 17/3/14.
//  Copyright © 2017年 deepAI. All rights reserved.
//

#import "NSString+VersionCompare.h"

@implementation NSString (VersionCompare)
/**
    版本号格式一般为  X.X   X.X.X  格式的字符串     进行比较时需要考虑位数不相同的情况
 
    实际开发可以使用本函数判断当前版本是否早于服务器版本aVersion    如果早于则说明需要更新
    所以返回一个bool值即可  yes为需要更新  no为不需要更新
 */
- (BOOL)isEarlyThanVersion:(NSString *)aVersionStr {
    
    //验证非空
    NSAssert(((self != nil) && (aVersionStr != nil)), @"被比较的版本号不能为nil");
    if ([self isEqualToString:aVersionStr]) {
        return NO;
    }
    
    //判断版本号格式是否正确
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"\\d+(\\.\\d+)*"];
    BOOL isV1Formatted = [pre evaluateWithObject:self];
    NSAssert((isV1Formatted == YES), @"当前版本号不是一个有效的版本号");
    
    BOOL isV2Formatted = [pre evaluateWithObject:aVersionStr];
    NSAssert((isV2Formatted == YES), @"当前版本号不是一个有效的版本号");
    
    //取出字符型的各位数字(此处也可以使用正则表达式实现)
    NSMutableArray *strs1 = [NSMutableArray arrayWithArray:[self componentsSeparatedByString:@"."]];
    NSMutableArray *strs2 = [NSMutableArray arrayWithArray:[aVersionStr componentsSeparatedByString:@"."]];

    //因为不排除 1.0   1.0.0 的情况      将元素较少的数组末位补0即可做到形式一致,这样无需考虑其他
    if (strs1.count < strs2.count) {
        
        while (1) {
            [strs1 addObject:@"0"];
            if (strs1.count == strs2.count) {
                break;
            }
        }
    } else if (strs1.count > strs2.count) {
    
        while (1) {
            [strs2 addObject:@"0"];
            if (strs1.count == strs2.count) {
                break;
            }
        }
    }
    
    //逐位进行比较
    for (int i = 0; i < strs1.count; i++) {
        int v1 = [strs1[i] intValue];
        int v2 = [strs2[i] intValue];
        
        if (v1 < v2) {
            //version1 < version2
            return YES;
        } else if (v1 > v2) {
            //version1 > version2
            return NO;
        }
    }
    
    //v1 = v2
    return NO;
}


@end
