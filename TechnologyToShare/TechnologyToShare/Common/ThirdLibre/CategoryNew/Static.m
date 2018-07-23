//
//  Static.m
//  最划算
//
//  Created by 名品导购网 on 14-3-20.
//  Copyright (c) 2014年 wangminqing. All rights reserved.
//

#import "Static.h"



@implementation Static

+ (NSString *)nullToString:(id)stringValue
{
    NSString *str = @"";
    if ([stringValue isKindOfClass:[NSNull class]]){
        str = @"";
    }else if ([stringValue isKindOfClass:[NSNumber class]]) {
        str = [stringValue stringValue];
    }else if ([stringValue isKindOfClass:[NSString class]]){
        str = stringValue;
    }else if ([stringValue isKindOfClass:[NSDictionary class]]){
        str = stringValue;
    }else if ([stringValue isKindOfClass:[NSObject class]]){
        str = stringValue;
    }
    return str;
}


+ (NSString *)URLEncodedString:(NSString *)strUrl{
    //NSString *encodedString =
    return (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)strUrl,
                                            (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                            NULL,
                                            kCFStringEncodingUTF8));
}

+(NSString *)newPageUrlEncode:(NSString *)urlString{
    
    return  (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                          (CFStringRef)urlString,
                                                                          NULL,
                                                                          CFSTR(":/?#[]@!$&’()*+,;="),
                                                                          kCFStringEncodingUTF8);
}
+ (BOOL)intervalSinceNow: (NSString *) theDate{
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    
    NSTimeInterval cha=now-late;
    
        
    if (cha/3600 < 1 ) {
        return NO;
    }else{
        return YES;
    }
}


+ (void) setObjectToUserDefault:(id)value key:(NSString *)key{
    NSUserDefaults *sandbox = [NSUserDefaults standardUserDefaults];
    [sandbox setObject:value forKey:key];
    [sandbox synchronize];
}
+ (id) getObjectFromUserDefault:(NSString *)key{
    NSUserDefaults *standbox = [NSUserDefaults standardUserDefaults];
    return [standbox objectForKey:key] ;
}

+ (NSString*)nameValString:(NSDictionary*)dict {
    NSMutableArray* keys = [[NSMutableArray alloc]initWithArray:[dict allKeys]];
    NSMutableString* result = [[NSMutableString alloc] init];
    NSString *url = nil;
    NSString *requestUrl = nil;
    
    int i = 0;
    
    for (NSString *key in keys) {
        if([key isEqualToString:@"url"])url = [dict objectForKey:key];
        else{
            if(i>0)[result appendString:@"&"];
            else [result appendString:@"?"];
            [result appendFormat:@"%@=%@",key,[dict objectForKey:key]];
            i++;
        }
    }
    
    requestUrl = [[url stringByAppendingString:
                   result]
                  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return requestUrl;
}


+(BOOL)searchResult:(NSString *)contactName searchText:(NSString *)searchT{
	NSComparisonResult result = [contactName compare:searchT options:NSCaseInsensitiveSearch
											   range:NSMakeRange(0, searchT.length)];
	if (result == NSOrderedSame)
		return YES;
	else
		return NO;
}

+ (id)viewFromNibWithName: (NSString*)name {
    UIView *view = nil;
    NSArray *views = [[NSBundle mainBundle] loadNibNamed: name owner: self options: nil];
    if (views) {
        for (UIView *aView in views) {
            if ([aView isKindOfClass: NSClassFromString(name)])
                view = aView;
        }
    }
    
    return view;
}

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize

{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
    
}

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize{
//    NSLog(@"%f",scaleSize);
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
   // NSLog(@"%f-----%f",image.size.width *scaleSize, image.size.height *scaleSize);
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    

    return scaledImage;
    
}

+ (CGSize) getStringSize:(NSString*)str
{
    CGSize strSize = [str sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(200*200, 768)];
    return strSize;
}

+(UIImage *)loadBundleImage:(NSString*)name
{
    return [UIImage imageNamed:name];
}

+ (CGFloat)cowryViewOfTotailHeight:(NSArray *)cowryArray{
    NSInteger leftHeight=0;
    NSInteger rightHeight =0;
    
    for (int i=0; i<[cowryArray count]; i++) {
        float height = ([[[cowryArray objectAtIndex:i]objectForKey:@"height"]floatValue]*160)/([[[cowryArray objectAtIndex:i]objectForKey:@"width"]floatValue]);
        NSString *goodName = [[cowryArray objectAtIndex:i]objectForKey:@"good_name"];
        CGSize labelTextSize = [Static getStringSize:goodName];
        NSInteger ticketSummaryLineNum =labelTextSize.width/145.5+1;
        NSInteger tureLineNum =ticketSummaryLineNum>3?3:ticketSummaryLineNum;
        
        if (i==0) {
            leftHeight = leftHeight+ (height+18*tureLineNum+68);
        }else if(i==1){
            
            rightHeight = rightHeight+(height+18*tureLineNum+68);
        }else{
            
            if (leftHeight<=rightHeight) {
                leftHeight=leftHeight+(height+18*tureLineNum+68);
            }else{
                rightHeight = rightHeight+(height+18*tureLineNum+68);
            }
            
        }
    }
    
    if (leftHeight < rightHeight) {
        return rightHeight;
    }else{
        return leftHeight;
    }
}

+ (UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset {
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2, image.size.height - inset * 2);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

+ (NSString *)getTodayWeek{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    NSInteger  week = [comps weekday];
    switch (week) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            return @"礼拜天";
            break;
    }
    
}

//+ (NSString *)ControlStrToSymbol:(NSString *)str{
//    NSString *outStr = nil;
//    if ([str length] > 10) {
//        outStr =  [str stringByReplacingOccurrencesOfRegex:@"(?<=\\d{3})\\d(?=\\d{3})" withString:@"*"];
//    }else if ([str length] > 6){
//        outStr =  [str stringByReplacingOccurrencesOfRegex:@"(?<=\\d{2})\\d(?=\\d{2})" withString:@"*"];
//    }else if ([str length] > 4){
//        outStr =  [str stringByReplacingOccurrencesOfRegex:@"(?<=\\d{1})\\d(?=\\d{1})" withString:@"*"];
//    }else{
//        outStr = [str stringByReplacingOccurrencesOfRegex:@"(?<=\\d{0})\\d(?=\\d{0})" withString:@"*"];
//    }
//    return outStr;
//}

+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

//+ (NSString *)getCityStr:(NSString *)jsonStr{
//
//    NSString *key = [jsonStr stringByReplacingOccurrencesOfRegex:@"^[.*省|北京市|北京|上海市|上海｜天津市｜天津｜重庆市｜重庆｜中国|中国.*省]*(.*)$" withString:@"$1"];
//
//    NSString * str_key = [jsonStr stringByReplacingOccurrencesOfString:key withString:@""];
//
////    NSString *str_city = [str_key stringByReplacingOccurrencesOfString:@"中国" withString:@""];
////
//    NSString *city = [str_key stringByReplacingOccurrencesOfString:@"市" withString:@""];
//
//    return city;
//}

+ (NSString *)UTCToNormalTime:(NSString *)time type:(NSString *)type{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *star_date  = nil;
    
    if ([type isEqual:@"tucZ"]) {
        NSRange range = [time rangeOfString:@"."];
        if (range.location != NSNotFound) {
               star_date  =  [time stringByReplacingCharactersInRange:NSMakeRange(range.location, ([time length] - range.location)) withString:@""];
        }else{
            star_date  = time;
        }

    }else{
        star_date = time;
    }
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSDate *localDate = [dateFormatter dateFromString:star_date];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    NSString * strDate = [dateFormatter stringFromDate:[self getNowDateFromatAnDate:localDate]];
    
    return strDate;
}
+(void)saveUserDoLoginOperationDate{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateTime = [dateFormatter stringFromDate:today];
    [[NSUserDefaults standardUserDefaults] setObject:currentDateTime forKey:@"UserDoLoginOperationDate"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)saveUserDoGetUserInfoOperationDate{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateTime = [dateFormatter stringFromDate:today];
    [[NSUserDefaults standardUserDefaults] setObject:currentDateTime forKey:@"storeGetUserinfoOperationDate"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(NSString *)myValueForTitles:(NSString *)requestUrlString{
    NSString *decodeString = nil;
    if ([requestUrlString rangeOfString:@"t="].location !=NSNotFound) {
        NSArray *Array = [requestUrlString componentsSeparatedByString:@"t="];
        //NSLog(@"被t=分割后的数组=%@",Array);
        NSString *string1 = [Array objectAtIndex:1];
        // NSLog(@"数组的第一个元素=%@",string1);
        if ([string1 rangeOfString:@"&"].location !=NSNotFound) {
            NSArray *string1Array = [string1 componentsSeparatedByString:@"&"];
            // NSLog(@"被&分割后的数组=%@",string1Array);
            NSString *firstString = [string1Array objectAtIndex:0];
            // NSLog(@"被&分割后的数组的第一个元素=%@",firstString);
            //decodering的字符串
            decodeString =(__bridge_transfer NSString *) CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                           (__bridge CFStringRef)firstString,
                                                                                                                           CFSTR(""),
                                                                                                                           CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
          //  [super setNavigationBarColor:RGB(255, 64, 95) title:decodeString TitleColor:[UIColor whiteColor]];
        }else{
            //NSString *firstString = [stringArray objectAtIndex:1];
            decodeString =(__bridge_transfer NSString *) CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                           (__bridge CFStringRef)string1,
                                                                                                                           CFSTR(""),
                                                                                                                           CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
            //NSLog(@"解析之后的字符串=%@",decodeString);
            //[super setNavigationBarColor:RGB(255, 64, 95) title:decodeString TitleColor:[UIColor whiteColor]];
        }
    }
    
    return decodeString;
    
}
+(NSMutableDictionary *)explainUrlParameter:(NSString *)requestUrlString{
    
    NSMutableDictionary *paraMutableArray=[[NSMutableDictionary alloc]initWithCapacity:0];
    if ([requestUrlString rangeOfString:@"?"].location !=NSNotFound) {
        NSArray *array = [requestUrlString componentsSeparatedByString:@"?"];
       //以？分割成两个大数组
        if (array.count>1) {
            NSString *string1 = [array objectAtIndex:1];
            //数组的第2个元素就是参数
            if ([string1 rangeOfString:@"&"].location !=NSNotFound) {
                NSArray *string1Array = [string1 componentsSeparatedByString:@"&"];
                for(int i=0;i<string1Array.count;i++){
                    
                    NSArray *arraySinglePara = [[string1Array objectAtIndex:i] componentsSeparatedByString:@"="];
                    NSString *decodeString=nil;
                    if (arraySinglePara.count>1) {
                        
                        decodeString =(__bridge_transfer NSString *) CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                             (__bridge CFStringRef)[arraySinglePara objectAtIndex:1],
                                                                                                                             CFSTR(""),
                                                                                                                             CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
                    }else{
                        decodeString=@"";
                        
                    }
                    [paraMutableArray setValue:decodeString forKey:[arraySinglePara objectAtIndex:0]];
                    
                }
            }else{
                
                NSArray *arraySinglePara = [string1 componentsSeparatedByString:@"="];
                NSString *decodeString=nil;
                if (arraySinglePara.count>1) {
                    
                    decodeString =(__bridge_transfer NSString *) CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                         (__bridge CFStringRef)[arraySinglePara objectAtIndex:1],
                                                                                                                         CFSTR(""),
                                                                                                                         CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
                }else{
                    decodeString=@"";
                    
                }
                [paraMutableArray setValue:decodeString forKey:[arraySinglePara objectAtIndex:0]];

            }
        }
    }
    
    return paraMutableArray;

}
+(UIImage *)getPartOfImage:(UIImage *)img rect:(CGRect)partRect{
    CGImageRef imageRef = img.CGImage;
    CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, partRect);
    UIImage *retImg = [UIImage imageWithCGImage:imagePartRef];
    CGImageRelease(imagePartRef);
    return retImg;

}
//获取字符串的高度和宽度
+(CGSize) getStringSize:(NSString*)str Font:(UIFont*)setFont
{
//    CGSize strSize=CGSizeMake(0, 0);
  CGSize strSize;
    if(IOS7){
     CGRect rect=[str boundingRectWithSize:CGSizeMake(200*200, 768 ) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:setFont,NSFontAttributeName,nil] context:nil];
        strSize=rect.size;
    }else{
        strSize = [str sizeWithFont:setFont constrainedToSize:CGSizeMake(200*200, 768)];
    }
    
    return strSize;
}

+(NSDate*)convertDateFromString:(NSString*)uiDateStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[formatter dateFromString:uiDateStr];
    return date;
}

+(NSString *)stringFromDateTime:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}
+(NSString *)stringFromDate:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}
+(void)setDeflaultInfo:(NSInteger)value Key:(NSString*)keyStr{
    
    NSString *valueStr=[NSString stringWithFormat:@"%ld",(long)value];
    [[NSUserDefaults standardUserDefaults] setObject:valueStr forKey:keyStr];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(NSString*)getDeflaultInfo:(NSString*)keyStr{

    NSString *numberStr=[[NSUserDefaults standardUserDefaults]objectForKey:keyStr];
    if ([numberStr isEqualToString:@""]) {
        return @"";
    }else{
        return numberStr;
    }
    
}
+(NSString*)calculateIntervalTime:(NSInteger)timeRow{

    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval futuretime;
    if (timeRow<23) {
        futuretime=currentTime+3600*(timeRow+1);

    }else if(timeRow==23){
        futuretime=currentTime+3600*24;
    }else if(timeRow==24){
        futuretime=currentTime+3600*24*2;
    }else if(timeRow==25){
        futuretime=currentTime+3600*24*3;
    }
    NSDate *futureDate= [NSDate dateWithTimeIntervalSince1970:futuretime];
    
    NSDateFormatter *dateAntherFormatter = [[NSDateFormatter alloc] init];
    [dateAntherFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentFullTimeStampsString = [dateAntherFormatter stringFromDate:futureDate];
    return currentFullTimeStampsString;
}
+(NSString*)replacingFormatStr:(NSString*)textStr{

    NSString *replacStr=[NSString stringWithFormat:@"%@",textStr];
    replacStr = [replacStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    replacStr = [replacStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    replacStr = [replacStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return replacStr;
    
}
@end

