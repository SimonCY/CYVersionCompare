//
//  NSString+VersionCompare.h
//  CYVersionCompare
//
//  Created by RRTY on 17/3/14.
//  Copyright © 2017年 deepAI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VersionCompare)
- (BOOL)isEarlyThanVersion:(NSString *)aVersion;
@end
