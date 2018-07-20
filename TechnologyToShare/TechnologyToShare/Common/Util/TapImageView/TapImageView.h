//
//  TapImageView.h
//  SHToday_Effective_Cost
//
//  Created by wangminqing on 13-4-27.
//  Copyright (c) 2013年 wangminqing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    left,          
    middle,
    right
}Position;


typedef enum  showImageType
{
    costEffectiveImg = 1, //展示最划算
    SpecialListImg = 2, //展示专题
}ShowImageType;


@protocol TapImageViewDelegate;
@interface TapImageView : UIImageView{

  id <TapImageViewDelegate>__weak delegate;
  NSString  *thumbnailUrl;    //最划算的缩略图的url
  NSString  *middleImageUrl;  //中图的url

  NSInteger tapRow;
  Position  imgPosition;
    
  ShowImageType imgType;
  
}
@property(nonatomic,weak) id<TapImageViewDelegate>delegate;
@property(nonatomic,assign) NSInteger tapRow;
@property(nonatomic,assign) Position imgPosition;
@property(nonatomic,copy)  NSString  *thumbnailUrl;
@property(nonatomic,copy)  NSString  *middleImageUrl;
@property(nonatomic,assign) ShowImageType imgType;

@end

@protocol TapImageViewDelegate <NSObject>

@optional

- (void)touchTapImageView:(TapImageView *)touchedImageView
                     Ended:(NSSet *)touches
                 withEvent:(UIEvent *)event;

- (void)layOutShowView:(TapImageView *)downloadedImageView;

- (void)stopActivityViewWhenRequestImageFailed:(TapImageView *)downloadedImageView;


@end
