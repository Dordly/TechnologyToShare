//
//  Color_header.h
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#ifndef Color_header_h
#define Color_header_h

//颜色
#define RGBA(r,g,b,a)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define Main_Color              RGBA(0, 0, 0, 1)//Color.argb(255, 87, 153, 174)
#define Main_HintColor          RGBA(215, 233, 238, 1)//Color.argb(255, 215, 233, 238)
#define Main_NextBgColor          RGBA(242, 243, 244, 1)//Color.argb(255, 215, 233, 238)
#define Color_white             [UIColor whiteColor]
#define Color_clear             [UIColor clearColor]
/**main_bgColor*/
#define Main_BgColor RGBA(255, 245, 243,1)//Color.argb(255, 244, 243, 243)
#define Main_Hint_BgColor RGBA(228, 244, 245,1)
/**mainTwoColor*/
#define Main_TwoColor RGBA(247,107,107, 1)
/**nav_Color*/
#define Nav_Color RGBA(41,48,51, 1)
/**mainTextColor*/
#define MainText_Color RGBA(0,0,27, 1)

/**mainTwoTextColor*/
#define MainTwoText_Color RGBA(161,161,161, 1)
/**mainThreeTextColor*/
#define MainThreeText_Color RGBA(142,142,142, 1)
/**LineViewColor*/
#define Line_Color RGBA(230,230,230, 1)

#define ThirdColor  RGBA(153,153,153, 1)

#endif /* Color_header_h */
