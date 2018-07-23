//
//  DTStatic.h
//  最划算
//
//  Created by 名品导购网MPLife.com on 15/10/15.
//  Copyright (c) 2015年 wangminqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DTStatic : NSObject

//设置行间距等属性计算高度
+(CGSize)getAttributeStringSize:(NSString*)str Font:(UIFont*)setFont LineSpace:(CGFloat)spaceFloat LabelWidth:(CGFloat)labelWidth;

+(NSMutableAttributedString*)getAttributeStringText:(NSString*)str Font:(UIFont*)setFont LineSpace:(CGFloat)spaceFloat LabelWidth:(CGFloat)labelWidth;
//设置字居中显示等属性计算高度
+(NSMutableAttributedString*)getAlignMentStringText:(NSString*)str Font:(UIFont*)setFont LineSpace:(CGFloat)spaceFloat LabelWidth:(CGFloat)labelWidth;
//获取指定字符变色
+(NSMutableAttributedString*)getColorAttributeStringText:(NSString*)str Font:(UIFont*)setFont LineSpace:(CGFloat)spaceFloat LabelWidth:(CGFloat)labelWidth BeginStr:(NSString*)beginStr EndStr:(NSString*)EndStr;

+(NSMutableAttributedString*)getMutiColorAttributeStringText:(NSString*)str Font:(UIFont*)setFont LineSpace:(CGFloat)spaceFloat LabelWidth:(CGFloat)labelWidth BeginStr:(NSString*)beginStr EndStr:(NSString*)EndStr;

//读写Document目录下的文件
+(void)storePlistToDocument:(NSMutableDictionary*)dic PathName:(NSString*)pathName;
+(void)storeDicPlistToDocument:(NSDictionary*)dic PathName:(NSString*)pathName;
+(NSMutableDictionary *)getPlistFromDocument:(NSString*)pathName;
+(NSDictionary *)getDicPlistFromDocument:(NSString*)pathName;
//删除Document目录下的文件
+(void)deleteDicPlistFromDocument:(NSString*)pathName;

+(NSArray *)storeRecommendArray:(NSArray *)array pathName:(NSString *)path;
+(NSArray *)getRecommendArray:(NSString *)pathName;

//标准化距离
+(NSString*)calculationFormatDistance:(NSInteger)distance;

//计算Label的宽和高
+(CGSize)setSizeForLabelBycalculateString:(NSString*)str Font:(UIFont*)Font LabelWidth:(CGFloat)labelWidth;
/**截取个别字符串变色*/
+(NSMutableAttributedString*)getColorAttributeText:(NSString*)str Font:(UIFont*)setFont WithBegin:(NSInteger)begin Length:(NSInteger)length WithTextColor:(UIColor *)color;
/**关键字高亮*/
+ (NSMutableAttributedString *)changeColorWithString:(NSString *)string light:(NSString *)light font:(UIFont*)font;
@end
