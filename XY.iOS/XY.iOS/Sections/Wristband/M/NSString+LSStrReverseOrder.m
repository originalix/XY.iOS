//
//  NSString+LSStrReverseOrder.m
//  LSDemo
//
//  Created by apple on 2017/6/9.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "NSString+LSStrReverseOrder.h"

@implementation NSString (LSStrReverseOrder)

+(NSString *)formatStrWithReverseOrder:(NSString *)str
{
    NSString *targetMac = @"";
    int count = (int)str.length;
    count /= 2;
    if (count)
    {
        unsigned char temp[64] = {0};
        for (int i = 0; i < count; ++i)
        {
            NSString *a = [str substringWithRange:NSMakeRange(i * 2 , 2)];
            unsigned char m = strtol(a.UTF8String, NULL, 16);
            temp[count - i - 1] = m;
        }
        NSData *macAddrs = [NSData dataWithBytes:temp length:6];
        NSString *maa = [NSString stringWithFormat:@"%@", macAddrs];
        maa = [maa stringByReplacingOccurrencesOfString:@" " withString:@""];
        maa = [maa stringByReplacingOccurrencesOfString:@"<" withString:@""];
        maa = [maa stringByReplacingOccurrencesOfString:@">" withString:@""];
        maa = [maa uppercaseString];
        targetMac = maa;
        
    }
    return targetMac;
    
}

@end
