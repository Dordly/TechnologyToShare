//
//  ValidateString.m
//  Eight-V
//
//  Created by soonyo on 16/11/7.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "ValidateString.h"
#import <sys/utsname.h>
#import <CommonCrypto/CommonCrypto.h>

@implementation ValidateString
/**手机号验证*/
+(BOOL)validateWithMobile:(NSString *)mobile
{
    NSString * phone = @"^1([3-9]\\d{9}$)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phone];
    return [phoneTest evaluateWithObject:mobile];
}
/**判断密码格式*/
+(BOOL)validateWithPassword:(NSString *)password
{
    //密码只包含字母，数字，字符中至少两种
    NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}$";
    NSPredicate * pas= [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pas evaluateWithObject:password];
}
#pragma mark ~~~判断姓名格式
/**用户名*/
+(BOOL)validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{3,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}
/**昵称*/
+(BOOL)validateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4E00-\u9FA5\uf900-\ufa2d·s•]{2,20}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}
/**邮箱*/
+(BOOL)ValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
/**过滤所有Emoji标签符号*/
+(BOOL)stringContainEmoji:(NSString *)emoji{
    __block BOOL returnValue = NO;
    [emoji enumerateSubstringsInRange:NSMakeRange(0, [emoji length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    return returnValue;
    
}

#pragma mark - 字符串替换 -
+(NSString *)StringChooseString:(NSString *)chooseStr{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\"."];
    NSString *trimmedString = [chooseStr stringByTrimmingCharactersInSet:set];
    NSLog(@"DELECT----%@",trimmedString);
    NSString *str = [trimmedString stringByReplacingOccurrencesOfString:@"\"," withString:@"、"];//替换字符
    NSString * twoStr = [str stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    NSString * three = [twoStr stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSLog(@"DELECTONE----%@",three);
    return three;
}
#pragma mark - 字符串替换 -
+(NSString *)StringString:(NSString *)chooseStr{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\"."];
    NSString *trimmedString = [chooseStr stringByTrimmingCharactersInSet:set];
    NSLog(@"DELECT----%@",trimmedString);
//    NSString *str = [trimmedString stringByReplacingOccurrencesOfString:@"\"," withString:@"、"];//替换字符
    NSString * twoStr = [trimmedString stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    NSString * three = [twoStr stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSLog(@"DELECTONE----%@",three);
    return three;
}
#pragma mark - 判断字符串 首字符是否为字母 -
+(BOOL)JudgeString:(NSString *)string{
    NSString *regex = @"[A-Za-z]+";
    NSPredicate*predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:string];
}
+(NSString*)getWeekDay:(NSString*)currentStr
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate*date =[dateFormat dateFromString:currentStr];
    NSArray*weekdays = [NSArray arrayWithObjects: [NSNull null],@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",nil];
    NSCalendar*calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone*timeZone = [[NSTimeZone alloc]initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit =NSCalendarUnitWeekday;
    NSDateComponents*theComponents = [calendar components:calendarUnit fromDate:date];
    return [weekdays objectAtIndex:theComponents.weekday];
    
}
/**时间戳转换成时间*/
+ (NSString *)dateWithString:(NSString *)str Format:(NSString *)format
{
    NSTimeInterval time = [str doubleValue];
    /** [[NSDate date] timeIntervalSince1970]*1000;*/
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormatter setDateFormat:format];//设定时间格式,这里可以设置成自己需要的格式
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    return currentDateStr;
}
/**时间戳转换时间-毫秒*/
+ (NSString *)dateMSWithString:(NSString *)str Format:(NSString *)format
{
    NSTimeInterval time = [str doubleValue]/1000;
    /** [[NSDate date] timeIntervalSince1970]*1000;*/
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormatter setDateFormat:format];//设定时间格式,这里可以设置成自己需要的格式
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    return currentDateStr;
}
/**转换成时间*/
+(NSString *)dateWithDate:(NSDate *)date Format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormatter setDateFormat:format];//设定时间格式,这里可以设置成自己需要的格式
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    return currentDateStr;
}
/** NSString 转NSDate */
+ (NSDate *)dateWithdate:(NSString *)str Format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormatter setDateFormat:format];//设定时间格式,这里可以设置成自己需要的格式
    NSDate * mainDate = [dateFormatter dateFromString:str];
    return mainDate;
}
/**当前时间戳转换成时间*/
+ (NSString *)currentDateWithFormat:(NSString *)format
{
    NSDate *detaildate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormatter setDateFormat:format];//设定时间格式,这里可以设置成自己需要的格式
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    return currentDateStr;
}
/**
 系统通知是否打开
 @return 是否打开
 */
//检测通知是否打开iOS8以后有所变化 所以需要适配iOS7
+(BOOL)openThePushNotification{
    if (IOS8) {//IOS8写的宏
        if ([[UIApplication sharedApplication] currentUserNotificationSettings].types  == UIUserNotificationTypeNone) {
            //         未打开通知//这个是个自定义的alertView 当用户没有打开推送时  会弹出 可以替换成自己项目里面的弹框
            if (IOS8) {//iOS8以后跳转到设置界面的代码也出现了变化 下面这段代码是直接跳转到APP的设置界面
                //跳入当前App设置界面
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }else{
                //适配iOS7 ,跳入系统设置界面
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:General&path=Reset"]];
            }
            return NO;
        }else{
            return YES;
        }
    }else{ // ios7
        if ([[UIApplication sharedApplication] enabledRemoteNotificationTypes]  == UIUserNotificationTypeNone) {
            if (IOS8) {
                //跳入当前App设置界面
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }else{
                //适配iOS7 ,跳入系统设置界面
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:General&path=Reset"]];
            }
            return NO;
        }else{
            
            return YES;
        }
    }
}
/**
*  获取手机型号
*/
+ (NSString *)deviceVersion
{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    return platform;
}
/**
 *  字典转JSON
 */
+ (NSString *)dictionaryToJson:(NSDictionary *)dict
{
    BOOL isValidJSONObject = [NSJSONSerialization isValidJSONObject:dict];
    if (isValidJSONObject)
    {
        NSData *jsonData =  [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

/*
 * JSON转字典
 */
+ (NSDictionary *)jsonToDictionary:(NSString *)jsonString
{
    if (jsonString == nil)
    {
        return nil;
    }
    NSLog(@"%@",jsonString);
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

/**
 *  判断是否输入了emoji 表情
 */
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL isEomji = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f)
                 {
                     isEomji = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3|| ls ==0xfe0f) {
                 isEomji = YES;
             }
         } else {
             if (0x2B05 <= hs && hs <= 0x2b07) {
                 isEomji = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 isEomji = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 isEomji = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                 isEomji = YES;
             }
         }
     }];
    return isEomji;
}

/**
 *  通过文字来计算文字所占的区域大小
 */
+ (CGSize)sizeForText:(NSString *)text withFont:(UIFont *)font withSize:(CGSize)size
{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    
    //通过文字来获取文字所占的大小
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return rect.size;
}

/**
 *  字典按升序排序
 */
+ (NSString *)stringWithAscendingOrderDict:(NSDictionary*)dict
{
    NSArray*keys = [dict allKeys];
    NSArray*sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2)
                           {
                               return[obj1 compare:obj2 options:NSNumericSearch];//正序
                           }];
    NSString*str =@"";
    for(NSString*categoryId in sortedArray)
    {
        id value = [dict objectForKey:categoryId];
        if ([value isKindOfClass:[NSDictionary class]])
        {
            value = [self stringWithAscendingOrderDict:value];
        }
        if ([str length] !=0)
        {
            str = [str stringByAppendingString:@"&"];
        }
        str = [str stringByAppendingFormat:@"%@=%@",categoryId,value];
    }
    return str;
}

/**
 *  压缩图片
 */
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
/**
 *  URLEncoding格式
 */
+ (NSString *)URLEncodedString:(NSString *)strUrl
{
    return [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

/**
 *  显示提示信息框
 */
+ (void)showErrorInfo:(NSString *)errorInfo Width:(CGFloat)width
{
    LemonBubbleInfo *iconInfo = [[LemonBubbleInfo alloc] init];
    iconInfo.maskColor = RGBA(0, 0, 0, 0.4);
    //    iconInfo.backgroundColor = Color_white;
    //    iconInfo.titleColor = [UIColor darkGrayColor];
    iconInfo.locationStyle = BUBBLE_LOCATION_STYLE_BOTTOM;
    iconInfo.layoutStyle = BUBBLE_LAYOUT_STYLE_TITLE_ONLY;
    iconInfo.title = errorInfo;
    iconInfo.proportionOfDeviation = 0.05;
    iconInfo.bubbleSize = CGSizeMake(width, DHEIGHT(80));
    [[LemonBubbleView defaultBubbleView] showWithInfo:iconInfo autoCloseTime:2];
}

/**
 *  显示原生弹窗
 */
+ (void)showInfo:(NSString *)info VC:(UIViewController *)VC
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:info preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertVC addAction:okAction];
    [VC presentViewController:alertVC animated:YES completion:nil];
}

/**
 *  匹配手机号
 */
+ (BOOL)matchesWithPhoneNumber:(NSString *)phoneNumber
{
    return [self matchesWithFormatString:@"^1([3-9]\\d{9}$)" tagaetStr:phoneNumber];
}

/**
 *  匹配身份证号码
 */
+ (BOOL)matchesWithIDCardNumber:(NSString *)idNumber
{
    return [self matchesWithFormatString:@"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$|^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$" tagaetStr:idNumber];
}

/**
 *  匹配姓名
 */
+ (BOOL)matchesWithName:(NSString *)nameStr
{
    return [self matchesWithFormatString:@"^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*" tagaetStr:nameStr];
}

/**
 *  匹配6-16位的纯汉字
 */
+ (BOOL)matchesWithChinese:(NSString *)nameStr
{
    return [self matchesWithFormatString:@"^[\u4e00-\u9fa5]{6,16}$" tagaetStr:nameStr];
}

/**
 *  指定格式的匹配
 */
+ (BOOL)matchesWithFormatString:(NSString *)formatStr tagaetStr:(NSString *)targetStr
{
    NSString *emailRegex = formatStr;
    NSPredicate *match = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [match evaluateWithObject:targetStr];
}

/**
 *  Base64加密
 */
+ (NSString *)base64WithString:(NSString *)str
{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

/**
 *  确认快捷支付RSA加密
 */

+ (NSString *)QuickpayRSAEncryptWithString:(NSString *)str
{
    CRSA *RSA = [CRSA shareInstance];
    [RSA writePukWithKey:QuickPayPubKey];
    NSString *pubStr = [RSA encryptByRsaWithCutData:str keyType:(KeyTypePublic)];

    return pubStr;
}

/**
 *  RSA加密
 */


+ (NSString *)RSAEncryptWithString:(NSString *)str
{
    CRSA *RSA = [CRSA shareInstance];
    [RSA writePukWithKey:PubKey];
    NSString *pubStr = [RSA encryptByRsaWithCutData:str keyType:(KeyTypePublic)];

    return pubStr;
}

/**
 *  RSA解密
 */

+ (NSString *)RSADecryptWithString:(NSString *)str
{
    CRSA * RSA = [CRSA shareInstance];
    [RSA writePukWithKey:PubKey];
//    [RSA writePrkWithKey:PubKey];
    NSString *pubStr = [RSA decryptByRsaWithCutData:str keyType:(KeyTypePublic)];
    return pubStr;
}

/**
 *  AES加密
 */

+ (NSString *)AESCryptWithString:(NSString *)str Key:(NSString *)key
{
    NSString *AESStr = [SecurityUtil encryptAESData:str Key:key];
    return AESStr;
}

/**
 *  AES解密
 */
+ (NSString *)AESDecryptWithString:(NSString *)str Key:(NSString *)key
{
    NSString *AESStr = [SecurityUtil decryptAESData:str Key:key];
    return AESStr;
}

/**
 *  MD5加密
 */
+ (NSString *)MD5WithString:(NSString *)str
{
    NSData *stringData = [str dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[CC_MD5_DIGEST_LENGTH];//加密后的长度
    /**
     CC_MD5(const void *data, CC_LONG len, unsigned char *md)

     data：是将要加密的数据
     len：代表需要加载的数据长度
     md：是加密之后的密文
     */
    CC_MD5(stringData.bytes, (CC_LONG)stringData.length, result);
    NSMutableString *resultStr = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i ++)
    {
        [resultStr appendFormat:@"%02x",result[i]];
    }
    return [resultStr uppercaseString];
}
/**
 *  改变按钮倒计时与状态
 */
+(void)changeVerifyButtonState:(UIButton *)sender
{
    __block int countDown = 120;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        if(countDown <= 0)
        {
            //倒计时结束，关闭
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                sender.enabled = YES;
                sender.backgroundColor = Main_Color;
                [sender setTitle:@"重新获取验证码" forState:UIControlStateNormal];
            });
        }
        else
        {
            NSString *TimeString = [NSString stringWithFormat:@"%.2d", countDown];
            dispatch_async(dispatch_get_main_queue(), ^{
                [sender setTitle:[NSString stringWithFormat:@"%@秒再次获取",TimeString] forState:UIControlStateNormal];
                sender.backgroundColor = MainTwoText_Color;
                sender.enabled = NO;
            });
            countDown--;
        }
    });
    dispatch_resume(timer);
}
/**
 * 判断银行卡是否合法
 */
+(BOOL)checkBankCardNumber:(NSString *)cardNumber
{
    int oddSum = 0;     // 奇数和
    int evenSum = 0;    // 偶数和
    int allSum = 0;     // 总和
    
    // 循环加和
    for (NSInteger i = 1; i <= cardNumber.length; i++)
    {
        NSString *theNumber = [cardNumber substringWithRange:NSMakeRange(cardNumber.length-i, 1)];
        int lastNumber = [theNumber intValue];
        if (i%2 == 0)
        {
            // 偶数位
            lastNumber *= 2;
            if (lastNumber > 9)
            {
                lastNumber -=9;
            }
            evenSum += lastNumber;
        }
        else
        {
            // 奇数位
            oddSum += lastNumber;
        }
    }
    allSum = oddSum + evenSum;
    // 是否合法
    if (allSum%10 == 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
//获取当前系统时间的时间戳
#pragma mark - 获取当前时间的 时间戳

+(NSInteger)getNowTimestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间
    NSLog(@"设备当前的时间:%@",[formatter stringFromDate:datenow]);
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
    NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
    return timeSp;
    
}
/**每隔4个字符添加一个空格的字符串算法*/
+ (NSString *)dealWithString:(NSString *)number
{
    NSString *doneTitle = @"";
    int count = 0;
    for (int i = 0; i < number.length; i++) {
        
        count++;
        doneTitle = [doneTitle stringByAppendingString:[number substringWithRange:NSMakeRange(i, 1)]];
        if (count == 4) {
            doneTitle = [NSString stringWithFormat:@"%@ ", doneTitle];
            count = 0;
        }
    }
    NSLog(@"%@", doneTitle);
    return doneTitle;
}
/**字符串截取*/
+ (NSString *)InterceptionWithString:(NSString *)str {
    NSString * mainStr = @"";
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"[]{}（#%-*+=_）\\|~(＜＞$%^&*)_+ 0123456789"];
    mainStr = [[str componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString: @""];
    return mainStr;
}
/**判断字符串中是否包含文字*/
+(BOOL)IsChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}
+ (BOOL)isLocationServiceOpen {
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        return NO;
    } else{
        return YES;
    }
}
//过滤指定字符串   里面的指定字符根据自己的需要添加 过滤特殊字符
+(NSString*)RemoveSpecialCharacter: (NSString *)str {
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @",.？、 ~￥#&<>《》()[]{}【】^@/￡¤|§¨「」『』￠￢￣~@#&*（）——+|《》$_€"]];
    if (urgentRange.location != NSNotFound)
    {
        return [self RemoveSpecialCharacter:[str stringByReplacingCharactersInRange:urgentRange withString:@""]];
    }
    return str;
}
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    
    NSComparisonResult result = [dateA compare:dateB];
    
    if (result == NSOrderedDescending) {
        //NSLog(@"oneDay比 anotherDay时间晚");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"oneDay比 anotherDay时间早");
        return -1;
    }
    //NSLog(@"两者时间是同一个时间");
    return 0;
    
}
+(NSString *)transformToPinyin:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    NSArray *pinyinArray = [str componentsSeparatedByString:@" "];
    NSMutableString *allString = [NSMutableString new];
    
    int count = 0;
    
    for (int  i = 0; i < pinyinArray.count; i++)
    {
        for(int i = 0; i < pinyinArray.count;i++)
        {
            if (i == count) {
                [allString appendString:@"#"];
                //区分第几个字母
            }
            [allString appendFormat:@"%@",pinyinArray[i]];
        }
        [allString appendString:@","];
        count ++;
    }
    NSMutableString *initialStr = [NSMutableString new];
    //拼音首字母
    for (NSString *s in pinyinArray)
    {
        if (s.length > 0)
        {
            [initialStr appendString:  [s substringToIndex:1]];
        }
    }
    [allString appendFormat:@"#%@",initialStr];
    [allString appendFormat:@",#%@",aString];
    return allString;
}
#pragma mark 判断是否打开定位
+(BOOL)determineWhetherTheAPPOpensTheLocation{
    
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] ==kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized)) {
        
        return YES;
    }else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied) {
        return NO;
        
    }else{
        
        return NO;
        
    }
    
}
// 此方法是用来判断一个字符串是不是整型.如果传进的字符串是一个字符,可以用来判断它是不是数字
+ (BOOL) deptNumInputShouldNumber:(NSString *)str
{
    if (str.length == 0) {
        return NO;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}
@end
