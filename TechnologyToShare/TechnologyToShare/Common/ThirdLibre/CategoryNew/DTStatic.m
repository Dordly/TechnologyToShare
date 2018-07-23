//
//  DTStatic.m
//  最划算
//
//  Created by 名品导购网MPLife.com on 15/10/15.
//  Copyright (c) 2015年 wangminqing. All rights reserved.
//

#import "DTStatic.h"

@implementation DTStatic
+(CGSize)getAttributeStringSize:(NSString*)str Font:(UIFont*)setFont LineSpace:(CGFloat)spaceFloat LabelWidth:(CGFloat)labelWidth{

    if (str==nil){
        str = @" ";
    }
    NSAttributedString *attributStr=[[NSAttributedString alloc]initWithString:str];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:attributStr];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spaceFloat];
    [text addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    [text addAttribute:NSFontAttributeName value:setFont range:NSMakeRange(0, text.length)];
    CGSize maxSize = CGSizeMake(labelWidth,MAXFLOAT);
    CGSize textSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    return textSize;
    //label .[lable setAttributedText:text];
    //[lable sizeToFit];
}
+(NSMutableAttributedString*)getAttributeStringText:(NSString*)str Font:(UIFont*)setFont LineSpace:(CGFloat)spaceFloat LabelWidth:(CGFloat)labelWidth{
    if (str == nil){
        str = @" ";
    }
    NSAttributedString *attributStr=[[NSAttributedString alloc]initWithString:str];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:attributStr];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spaceFloat];
    [text addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    [text addAttribute:NSFontAttributeName value:setFont range:NSMakeRange(0, text.length)];
    return text;
}


//设置字居中显示等属性计算高度
+(NSMutableAttributedString*)getAlignMentStringText:(NSString*)str Font:(UIFont*)setFont LineSpace:(CGFloat)spaceFloat LabelWidth:(CGFloat)labelWidth{

    NSAttributedString *attributStr=[[NSAttributedString alloc]initWithString:str];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:attributStr];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment=NSTextAlignmentLeft;
    [paragraphStyle setLineSpacing:spaceFloat];
    [text addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    [text addAttribute:NSFontAttributeName value:setFont range:NSMakeRange(0, text.length)];
    return text;


}
+(NSMutableAttributedString*)getColorAttributeStringText:(NSString*)str Font:(UIFont*)setFont LineSpace:(CGFloat)spaceFloat LabelWidth:(CGFloat)labelWidth BeginStr:(NSString*)beginStr EndStr:(NSString*)EndStr{
    
    NSRange rangeBegin = [str rangeOfString:beginStr];
    NSRange rangeEnd = [str rangeOfString:EndStr];
    if (rangeBegin.location == NSNotFound) {
        NSAttributedString *attributStr=[[NSAttributedString alloc]initWithString:str];
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:attributStr];
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:spaceFloat];
        [text addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
        [text addAttribute:NSFontAttributeName value:setFont range:NSMakeRange(0, text.length)];
        return text;
    }else{
        
        NSString *str1 = [str stringByReplacingOccurrencesOfString:beginStr withString:@""];
        NSString *str2 = [str1 stringByReplacingOccurrencesOfString:EndStr withString:@""];
        NSAttributedString *attributStr=[[NSAttributedString alloc]initWithString:str2];
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:attributStr];
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:spaceFloat];
        [text addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str2 length])];
        [text addAttribute:NSFontAttributeName value:setFont range:NSMakeRange(0, text.length)];
        
        [text addAttribute:NSForegroundColorAttributeName value:Main_Color range:NSMakeRange(rangeBegin.location,rangeEnd.location-1-rangeBegin.location)];
        return text;
    }
    //return text;
}

+(NSMutableAttributedString*)getMutiColorAttributeStringText:(NSString*)str Font:(UIFont*)setFont LineSpace:(CGFloat)spaceFloat LabelWidth:(CGFloat)labelWidth BeginStr:(NSString*)beginStr EndStr:(NSString*)EndStr{
    NSRange rangeBegin = [str rangeOfString:beginStr];
//    NSRange rangeEnd = [str rangeOfString:EndStr];
    if (rangeBegin.location == NSNotFound) {
        NSAttributedString *attributStr=[[NSAttributedString alloc]initWithString:str];
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:attributStr];
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:spaceFloat];
        [text addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
        [text addAttribute:NSFontAttributeName value:setFont range:NSMakeRange(0, text.length)];
        return text;
    }else{
        
        NSMutableArray *beginLocations=[[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray *endLocations=[[NSMutableArray alloc]initWithCapacity:0];
        NSRange rangeBegin1 = [str rangeOfString:beginStr];
        NSRange rangeEnd1 = [str rangeOfString:EndStr];
        NSString *tempBeginStr=str;
        NSString *tempEndStr=str;
        for (int i=0; rangeBegin1.location != NSNotFound; i++) {
            [beginLocations addObject:[NSNumber numberWithLong:(long)rangeBegin1.location]];
            tempBeginStr=[tempBeginStr stringByReplacingCharactersInRange:NSMakeRange(rangeBegin1.location, 1) withString:@"*"];
            rangeBegin1 = [tempBeginStr rangeOfString:beginStr];
        }
        
        for (int i=0; rangeEnd1.location != NSNotFound; i++) {
            [endLocations addObject:[NSNumber numberWithLong:(long)rangeEnd1.location]];
            tempEndStr=[tempEndStr stringByReplacingCharactersInRange:NSMakeRange(rangeEnd1.location, 1) withString:@"*"];
            rangeEnd1 = [tempEndStr rangeOfString:EndStr];
        }
       
        NSAttributedString *attributStr=[[NSAttributedString alloc]initWithString:str];
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:attributStr];
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:spaceFloat];
        [text addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
        [text addAttribute:NSFontAttributeName value:setFont range:NSMakeRange(0, text.length)];
        
        for(int i=0;i<beginLocations.count;i++){
            NSInteger beginNum=[[beginLocations objectAtIndex:i] integerValue];
            NSInteger endNum=[[endLocations objectAtIndex:i] integerValue];
             [text addAttribute:NSForegroundColorAttributeName value:Main_Color range:NSMakeRange(beginNum,endNum-beginNum+1)];
        }
       
        return text;
    }
   

}

+(void)storePlistToDocument:(NSMutableDictionary*)dic PathName:(NSString*)pathName{

    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:pathName];
    BOOL configureHave=[[NSFileManager defaultManager] fileExistsAtPath:plistPath];
    if (configureHave) {
       
        BOOL blDele= [[NSFileManager defaultManager] removeItemAtPath:plistPath error:nil];
        if (blDele) {
            ;
        }else {
            ;
        }
        [dic writeToFile:plistPath atomically:YES];
        
    }else{
        
        [dic writeToFile:plistPath atomically:YES];
    }

}
+(void)storeDicPlistToDocument:(NSDictionary*)dic PathName:(NSString*)pathName{
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:pathName];
    BOOL configureHave=[[NSFileManager defaultManager] fileExistsAtPath:plistPath];
    if (configureHave) {
        
        BOOL blDele= [[NSFileManager defaultManager] removeItemAtPath:plistPath error:nil];
        if (blDele) {
            ;
        }else {
            ;
        }
        [dic writeToFile:plistPath atomically:YES];
        
    }else{
        
        [dic writeToFile:plistPath atomically:YES];
    }


}
+(NSMutableDictionary *)getPlistFromDocument:(NSString*)pathName{

    NSMutableDictionary *mutiDic=nil;
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:pathName];
    BOOL configureHave=[[NSFileManager defaultManager] fileExistsAtPath:plistPath];
    if (configureHave) {
        mutiDic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    }else {
        
    }
    return mutiDic;
}

+(NSDictionary *)getDicPlistFromDocument:(NSString*)pathName{
    NSDictionary *mutiDic=nil;
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:pathName];
    BOOL configureHave=[[NSFileManager defaultManager] fileExistsAtPath:plistPath];
    if (configureHave) {
        mutiDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    }else {
        
    }
    return mutiDic;

}
+(NSArray *)storeRecommendArray:(NSArray *)array pathName:(NSString *)path{
    
    NSString *documentDirectiory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *Filepath  =[documentDirectiory stringByAppendingPathComponent:path];
    [array writeToFile:Filepath atomically:YES];
    return array;
}

+(NSArray *)getRecommendArray:(NSString *)pathName{
    
    NSArray *recommendArray=nil;
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:pathName];
    BOOL configureHave=[[NSFileManager defaultManager] fileExistsAtPath:plistPath];
    if (configureHave) {
        recommendArray = [NSArray arrayWithContentsOfFile:plistPath];
    }else {
        
    }
    return recommendArray;
}
+(void)deleteDicPlistFromDocument:(NSString*)pathName{

  
  NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
  NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:pathName];
  BOOL configureHave=[[NSFileManager defaultManager] fileExistsAtPath:plistPath];
  if (configureHave) {
    [[NSFileManager defaultManager]removeItemAtPath:plistPath error:nil];
  }else {
    
  }
 

}
+(NSString*)calculationFormatDistance:(NSInteger)distance{

  NSString *distanceStr=nil;
    if (distance!=-1) {
        if (distance<100) {
            distanceStr = [NSString stringWithFormat:@"<%ldm",(long)distance];
            
        }else if (distance>500) {
            distanceStr = [NSString stringWithFormat:@"%.1lfkm",(NSInteger)distance/1000.0];
            
        }else{
            distanceStr = [NSString stringWithFormat:@"%ldm",(long)distance];
        }
    }else{
        distanceStr = @"";
    }
    return distanceStr;


}
+(CGSize)setSizeForLabelBycalculateString:(NSString*)str Font:(UIFont*)Font LabelWidth:(CGFloat)labelWidth{
    
    //    CGSize size=[str sizeWithFont:Font constrainedToSize:CGSizeMake(labelWidth, 10000) lineBreakMode:NSLineBreakByCharWrapping];//自动行高
    
    CGRect rect=[str boundingRectWithSize:CGSizeMake(labelWidth, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:Font,NSFontAttributeName,nil] context:nil];
    return rect.size;
}
/**截取个别字符串变色*/
+(NSMutableAttributedString*)getColorAttributeText:(NSString*)str Font:(UIFont*)setFont WithBegin:(NSInteger)begin Length:(NSInteger)length WithTextColor:(UIColor *)color{
    
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSFontAttributeName value:setFont range:NSMakeRange(begin, length)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(begin, length)];
    
    return attrStr;
    
}
/**关键字高亮*/
+ (NSMutableAttributedString *)changeColorWithString:(NSString *)string light:(NSString *)light font:(UIFont*)font
{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    if (attString.length >= light.length){
        for (int i = 0; i < attString.length - light.length + 1; i++) {
            NSRange range =NSMakeRange(i, light.length);
            if ([[string substringWithRange:range] isEqualToString:light]) {
                // 添加关键字的特征
                [attString addAttribute:NSForegroundColorAttributeName value:Main_Color range:range];
                [attString addAttribute:NSFontAttributeName value:font range:range];
            }
        }
    }
    
    return attString;
}
@end
