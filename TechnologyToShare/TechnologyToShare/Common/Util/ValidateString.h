//
//  ValidateString.h
//  Eight-V
//
//  Created by soonyo on 16/11/7.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ValidateString : NSObject
/**改变按钮倒计时与状态*/
+(void)changeVerifyButtonState:(UIButton *)sender;

/**手机格式*/
+(BOOL)validateWithMobile:(NSString *)mobile;
/**密码格式*/
+(BOOL)validateWithPassword:(NSString *)password;
/**判断姓名格式*/ 
+(BOOL)validateUserName:(NSString *)name;
/**昵称*/ 
+(BOOL)validateNickname:(NSString *)nickname;
/**判断邮箱格式*/
+(BOOL)ValidateEmail:(NSString *)email;
//过滤所有Emoji标签符号
+(BOOL)stringContainEmoji:(NSString *)emoji;
/**字符串替换*/
+(NSString *)StringChooseString:(NSString *)chooseStr;
+(NSString *)StringString:(NSString *)chooseStr;
/**判断字符串 首字符是否为字母*/
+(BOOL)JudgeString:(NSString *)string;
/**时间字符串转星期*/
+(NSString*)getWeekDay:(NSString*)currentStr;
/**时间戳转时间*/
+ (NSString *)dateWithString:(NSString *)str Format:(NSString *)format;
/**当前时间戳转时间*/
+ (NSString *)currentDateWithFormat:(NSString *)format;
/** NSString 转NSDate */
+ (NSDate *)dateWithdate:(NSString *)str Format:(NSString *)format;
/**转换成时间*/
+(NSString *)dateWithDate:(NSDate *)date Format:(NSString *)format;
/**
 系统通知是否打开
 @return 是否打开
 */
//检测通知是否打开iOS8以后有所变化 所以需要适配iOS7
+(BOOL)openThePushNotification;
/**
 *  获取手机型号
 */
+ (NSString *)deviceVersion;
/**
 *  字典转JSON
 */
+ (NSString *)dictionaryToJson:(NSDictionary *)dict;
/*
 * JSON转字典
 */
+ (NSDictionary *)jsonToDictionary:(NSString *)jsonString;
/**
 *  判断是否输入了emoji 表情
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;
/**
*  通过文字来计算文字所占的区域大小
*/
+ (CGSize)sizeForText:(NSString *)text withFont:(UIFont *)font withSize:(CGSize)size;
/**
*  字典按升序排序
*/
+ (NSString *)stringWithAscendingOrderDict:(NSDictionary*)dict;
/**
*  压缩图片
*/
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)size;
/**
*  URLEncoding格式
*/
+ (NSString *)URLEncodedString:(NSString *)strUrl;
/**
 *  显示提示信息框
*/
+ (void)showErrorInfo:(NSString *)errorInfo Width:(CGFloat)width;
/**
*  显示原生弹窗
*/
//+ (void)showInfo:(NSString *)info VC:(UIViewController *)VC;
/**
*  匹配手机号
*/
+ (BOOL)matchesWithPhoneNumber:(NSString *)phoneNumber;
/**
*  匹配身份证号码
*/
+ (BOOL)matchesWithIDCardNumber:(NSString *)idNumber;
/**
*  匹配姓名
*/
+ (BOOL)matchesWithName:(NSString *)nameStr;
/**
 *  匹配6-16位的纯汉字
*/
+ (BOOL)matchesWithChinese:(NSString *)nameStr;
/**
*  指定格式的匹配
*/
+ (BOOL)matchesWithFormatString:(NSString *)formatStr tagaetStr:(NSString *)targetStr;
/**
*  Base64加密
*/
//+ (NSString *)base64WithString:(NSString *)str;
/**
 *  确认快捷支付RSA加密
*/
//+ (NSString *)QuickpayRSAEncryptWithString:(NSString *)str;
/**
 *  RSA加密
*/
//+ (NSString *)RSAEncryptWithString:(NSString *)str;
/**
 *  RSA解密
*/
//+ (NSString *)RSADecryptWithString:(NSString *)str;
/**
*  AES加密
*/
//+ (NSString *)AESCryptWithString:(NSString *)str Key:(NSString *)key;
/**
*  AES解密
*/
//+ (NSString *)AESDecryptWithString:(NSString *)str Key:(NSString *)key;
/**
*  MD5加密
*/
//+ (NSString *)MD5WithString:(NSString *)str;
/**
 * 判断银行卡是否合法
 */
+(BOOL)checkBankCardNumber:(NSString *)cardNumber;
+(NSInteger)getNowTimestamp;
/**时间戳转换时间-毫秒*/
+ (NSString *)dateMSWithString:(NSString *)str Format:(NSString *)format;
/**每隔4个字符添加一个空格的字符串算法*/
+ (NSString *)dealWithString:(NSString *)number;
/**字符串截取*/
+ (NSString *)InterceptionWithString:(NSString *)str;
/**判断字符串中是否包含文字*/
+(BOOL)IsChinese:(NSString *)str;
//+ (BOOL)isLocationServiceOpen;
/**过滤指定字符串   里面的指定字符根据自己的需要添加 过滤特殊字符*/
+(NSString*)RemoveSpecialCharacter: (NSString *)str;
/**时间比较*/
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
/**转换拼音*/
+(NSString *)transformToPinyin:(NSString *)aString;
/**判断是否打开定位*/
//+(BOOL)determineWhetherTheAPPOpensTheLocation;
/**此方法是用来判断一个字符串是不是整型.如果传进的字符串是一个字符,可以用来判断它是不是数字*/
+ (BOOL) deptNumInputShouldNumber:(NSString *)str;
@end
