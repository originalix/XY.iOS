//
//  SGHeartHelper.m
//  XY.iOS
//
//  Created by Lix on 2017/6/30.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "SGHeartHelper.h"

@implementation SGHeartHelper

+ (NSString *)formatMeasureTime:(NSString *)time {
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [dateformatter dateFromString:time];
    dateformatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [dateformatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)formatCurrentTime {
    return [SGHeartHelper convertCurrentDate:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSInteger)convertToTimestamp:(NSString *)time format:(NSString *)format {
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.dateFormat = format;
    NSDate *date = [dateformatter dateFromString:time];
    NSInteger timestamp = [date timeIntervalSince1970];
    return timestamp;
}

+ (NSString *)convertTimeBeforeFormat:(NSString *)beforeFormat convertFormat:(NSString *)converFormat timeStr:(NSString *)time {
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.dateFormat = beforeFormat;
    NSDate *date = [dateformatter dateFromString:time];
    dateformatter.dateFormat = converFormat;
    NSString *dateStr = [dateformatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)convertCurrentDate:(NSString *)format {
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.dateFormat = format;
    NSString *dateStr = [dateformatter stringFromDate:[NSDate date]];
    return dateStr;
}

+ (NSString *)convertToDateStrWithTimestamp:(NSInteger)timestamp {
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateStr = [dateformatter stringFromDate:date];
    return dateStr;
}

+ (NSData *)convertHexStrToData:(NSString *)str {
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    
    NSLog(@"hexdata: %@", hexData);
    return hexData;
}

+ (NSString *)convertDataToHexStr:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

@end
//2017-06-30 10:44:59
