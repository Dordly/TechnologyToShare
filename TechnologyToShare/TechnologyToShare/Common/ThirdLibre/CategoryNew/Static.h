//
//  Static.h
//  最划算
//
//  Created by 名品导购网 on 14-3-20.
//  Copyright (c) 2014年 wangminqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Static : NSObject

#pragma mark NSString Model
+ (NSString *)nullToString:(id)stringValue;



#pragma mark NSUserDefaults Model
+ (void) setObjectToUserDefault:(id)value key:(NSString *)key;
+ (id) getObjectFromUserDefault:(NSString *)key;
+(BOOL)searchResult:(NSString *)contactName searchText:(NSString *)searchT;
+ (id)viewFromNibWithName: (NSString*)name;
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
+ (UIImage *)loadBundleImage:(NSString*)name;
+ (CGSize) getStringSize:(NSString*)str;
+ (CGFloat)cowryViewOfTotailHeight:(NSArray *)cowryArray;
+ (UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset;
+ (NSString *)getTodayWeek;
+ (NSString*)nameValString:(NSDictionary*)dict;
+ (NSString *)ControlStrToSymbol:(NSString *)str;
//UTC时间转为常用时间
+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate;
+ (NSString *)getCityStr:(NSString *)jsonStr;
//UTC时间转常规时间(去时差，去特殊情况)
+ (NSString *)UTCToNormalTime:(NSString *)time type:(NSString *)type;
//计算时间差
+ (BOOL)intervalSinceNow: (NSString *) theDate;
+ (NSString *)URLEncodedString:(NSString *)strUrl;
//用于记录用户做登录的日期；
+(void)saveUserDoLoginOperationDate;
//用于记录登录用户每天向服务器请求依次用户信息数据
+(void)saveUserDoGetUserInfoOperationDate;
+(NSString *)myValueForTitles:(NSString *)requestUrlString;
+(NSMutableDictionary *)explainUrlParameter:(NSString *)requestUrlString;
+(UIImage *)getPartOfImage:(UIImage *)img rect:(CGRect)partRect;
+(CGSize) getStringSize:(NSString*)str Font:(UIFont*)setFont;
+(NSString *)newPageUrlEncode:(NSString *)urlString;
+(NSDate*)convertDateFromString:(NSString*)uiDateStr;
+(NSString *)stringFromDateTime:(NSDate *)date;
+(NSString *)stringFromDate:(NSDate *)date;
+(void)setDeflaultInfo:(NSInteger)value Key:(NSString*)keyStr;
+(NSString*)getDeflaultInfo:(NSString*)keyStr;
//计算间隔一段时间后的时间
+(NSString*)calculateIntervalTime:(NSInteger)timeRow;

//去除掉首尾的空白字符和换行字符

+(NSString*)replacingFormatStr:(NSString*)textStr;

@end
