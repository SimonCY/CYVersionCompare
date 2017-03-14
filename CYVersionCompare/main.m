//
//  main.m
//  CYVersionCompare
//
//  Created by RRTY on 17/3/14.
//  Copyright © 2017年 deepAI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+VersionCompare.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        BOOL result = [@"1.0.0.0.00" isEarlyThanVersion:@"2.0.1.0.0"];
        NSLog(@"result is %d",result);
    }
    return 0;
}
